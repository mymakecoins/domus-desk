<?php
/**
 * Force Password Change
 * Shown when a user's password has expired per the password policy
 */
session_start();
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../includes/i18n.php';
I18n::initFromSession();

// Must be logged in with expired password flag
if (!isset($_SESSION['analyst_id']) || empty($_SESSION['password_expired'])) {
    header('Location: login.php');
    exit;
}

$analyst_name = $_SESSION['analyst_name'] ?? 'Analyst';
?>
<!DOCTYPE html>
<html lang="<?php echo htmlspecialchars(I18n::getLocale()); ?>">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars(t('auth.force_change.page_title')); ?></title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0A192F 0%, #1E3A8A 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .change-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 420px;
        }

        .change-header {
            text-align: center;
            margin-bottom: 24px;
        }

        .change-header .icon {
            width: 48px;
            height: 48px;
            color: #f59e0b;
            margin-bottom: 16px;
        }

        .change-header h1 {
            color: #333;
            font-size: 22px;
            margin-bottom: 8px;
        }

        .change-header p {
            color: #666;
            font-size: 14px;
            line-height: 1.5;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            color: #333;
            font-weight: 500;
            font-size: 13px;
        }

        .form-group input {
            width: 100%;
            padding: 11px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }

        .msg {
            padding: 10px 14px;
            border-radius: 5px;
            margin-bottom: 16px;
            font-size: 13px;
            display: none;
        }

        .msg.error {
            display: block;
            background: #fee;
            color: #c33;
            border-left: 4px solid #c33;
        }

        .msg.success {
            display: block;
            background: #e8f5e9;
            color: #2e7d32;
            border-left: 4px solid #2e7d32;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #0A192F 0%, #1E3A8A 100%);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .submit-btn:hover { transform: translateY(-2px); }
        .submit-btn:active { transform: translateY(0); }
        .submit-btn:disabled { opacity: 0.6; cursor: not-allowed; transform: none; }

        .logout-link {
            display: block;
            text-align: center;
            margin-top: 16px;
            color: #999;
            text-decoration: none;
            font-size: 13px;
        }

        .logout-link:hover { color: #666; }
    </style>
</head>
<body>
    <div class="change-container">
        <div class="change-header">
            <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                <line x1="12" y1="9" x2="12" y2="13"></line>
                <line x1="12" y1="17" x2="12.01" y2="17"></line>
            </svg>
            <h1><?php echo htmlspecialchars(t('auth.force_change.heading')); ?></h1>
            <p><?php echo htmlspecialchars(t('auth.force_change.description')); ?></p>
        </div>

        <div id="msg" class="msg"></div>

        <div class="form-group">
            <label for="currentPw"><?php echo htmlspecialchars(t('auth.force_change.current_password')); ?></label>
            <input type="password" id="currentPw" autocomplete="current-password" autofocus>
        </div>

        <div class="form-group">
            <label for="newPw"><?php echo htmlspecialchars(t('auth.force_change.new_password')); ?></label>
            <input type="password" id="newPw" autocomplete="new-password">
        </div>

        <div class="form-group">
            <label for="confirmPw"><?php echo htmlspecialchars(t('auth.force_change.confirm_password')); ?></label>
            <input type="password" id="confirmPw" autocomplete="new-password">
        </div>

        <button type="button" class="submit-btn" id="submitBtn" onclick="changePassword()"><?php echo htmlspecialchars(t('auth.force_change.submit')); ?></button>
        <a href="analyst_logout.php" class="logout-link"><?php echo htmlspecialchars(t('auth.force_change.logout')); ?></a>
    </div>

    <script>
    async function changePassword() {
        const msgEl = document.getElementById('msg');
        const btn = document.getElementById('submitBtn');
        msgEl.className = 'msg';
        msgEl.style.display = 'none';

        const current = document.getElementById('currentPw').value;
        const newPw = document.getElementById('newPw').value;
        const confirm = document.getElementById('confirmPw').value;

        if (!current || !newPw || !confirm) {
            msgEl.className = 'msg error';
            msgEl.textContent = 'All fields are required';
            return;
        }

        btn.disabled = true;
        btn.textContent = <?php echo json_encode(t('auth.force_change.submitting')); ?>;

        try {
            const resp = await fetch('api/myaccount/change_password.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    current_password: current,
                    new_password: newPw,
                    confirm_password: confirm
                })
            });
            const data = await resp.json();

            if (data.success) {
                msgEl.className = 'msg success';
                msgEl.textContent = 'Password changed successfully. Redirecting...';
                setTimeout(() => { window.location.href = 'index.php'; }, 1500);
            } else {
                msgEl.className = 'msg error';
                msgEl.textContent = data.error;
                btn.disabled = false;
                btn.textContent = <?php echo json_encode(t('auth.force_change.submit')); ?>;
            }
        } catch (e) {
            msgEl.className = 'msg error';
            msgEl.textContent = 'Failed to change password. Please try again.';
            btn.disabled = false;
            btn.textContent = <?php echo json_encode(t('auth.force_change.submit')); ?>;
        }
    }

    // Enter key submits
    document.querySelectorAll('input').forEach(input => {
        input.addEventListener('keydown', function(e) {
            if (e.key === 'Enter') changePassword();
        });
    });
    </script>
</body>
</html>
