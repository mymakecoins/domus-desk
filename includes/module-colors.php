<?php
/**
 * Module Colours - shared helper
 * Provides default and database-overridden module colours for dynamic CSS generation.
 * Included by waffle-menu.php and index.php.
 */

$defaultModuleColors = [
    'watchtower'     => ['#a3dfff', '#055883'],
    'tickets'        => ['#a3dfff', '#055883'],
    'assets'         => ['#a3dfff', '#055883'],
    'knowledge'      => ['#a3dfff', '#055883'],
    'changes'        => ['#a3dfff', '#055883'],
    'problems'       => ['#a3dfff', '#055883'],
    'calendar'       => ['#a3dfff', '#055883'],
    'morning-checks' => ['#a3dfff', '#055883'],
    'reporting'      => ['#a3dfff', '#055883'],
    'software'       => ['#a3dfff', '#055883'],
    'forms'          => ['#a3dfff', '#055883'],
    'contracts'      => ['#a3dfff', '#055883'],
    'service-status' => ['#a3dfff', '#055883'],
    'wiki'           => ['#a3dfff', '#055883'],
    'lms'            => ['#a3dfff', '#055883'],
    'process-mapper' => ['#a3dfff', '#055883'],
    'tasks'          => ['#a3dfff', '#055883'],
    'cmdb'           => ['#a3dfff', '#055883'],
    'network-mapper' => ['#a3dfff', '#055883'],
    'workflow'       => ['#a3dfff', '#055883'],
    'system'         => ['#a3dfff', '#055883'],
];

function getModuleColors() {
    static $cached = null;
    if ($cached !== null) {
        return $cached;
    }

    global $defaultModuleColors;
    $colors = $defaultModuleColors;

    try {
        if (!function_exists('connectToDatabase')) {
            require_once __DIR__ . '/functions.php';
        }
        $conn = connectToDatabase();
        $stmt = $conn->prepare("SELECT setting_key, setting_value FROM system_settings WHERE setting_key LIKE 'module_color_%'");
        $stmt->execute();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($rows as $row) {
            $moduleKey = substr($row['setting_key'], strlen('module_color_'));
            $parts = explode(',', $row['setting_value']);
            if (count($parts) === 2 && isset($colors[$moduleKey])) {
                $colors[$moduleKey] = [trim($parts[0]), trim($parts[1])];
            }
        }
    } catch (Exception $e) {
        // Fall back to defaults if DB unavailable
    }

    $cached = $colors;
    return $cached;
}
