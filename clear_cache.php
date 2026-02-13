<?php
// Clear PHP OPCode Cache
if (function_exists('opcache_reset')) {
    opcache_reset();
    echo '<h1 style="color:green; padding:20px;">✓ PHP OPCode Cache Cleared!</h1>';
    echo '<p>Refresh halaman tournament Anda sekarang.</p>';
    echo '<p><a href="index.php">Kembali ke halaman utama</a></p>';
} else {
    echo '<h1 style="color:warning; padding:20px;">⚠ OPCode cache function not available</h1>';
    echo '<p>Coba method lain atau hubungi hosting support.</p>';
}
?>
