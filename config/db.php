<?php
// Deteksi environment (lokal vs hosting)
$isLocal = ($_SERVER['HTTP_HOST'] === 'localhost' || $_SERVER['HTTP_HOST'] === '127.0.0.1' || strpos($_SERVER['HTTP_HOST'], 'localhost') !== false);

if ($isLocal) {
    // LOKAL (XAMPP)
    define('DB_HOST', 'localhost');
    define('DB_USER', 'root');
    define('DB_PASS', '');
    define('DB_NAME', 'bulan_k3_2026');
} else {
    // HOSTING (Infinity Free)
    define('DB_HOST', 'sql306.infinityfree.com');
    define('DB_USER', 'if0_41118739');
    define('DB_PASS', 'phONQdfqfpU3mdI');
    define('DB_NAME', 'if0_41118739_bulank3');
}

function getDBConnection() {
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    $conn->set_charset("utf8mb4");
    
    return $conn;
}

function closeDBConnection($conn) {
    if ($conn) {
        $conn->close();
    }
}
?>

