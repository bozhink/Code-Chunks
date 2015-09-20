<?php
    // Create an image
    $image = imagecreatetruecolor(100, 100);
 
    // Allocate some colors
    $white    = imagecolorallocate($image, 0xFF, 0xFF, 0xFF);
    $gray     = imagecolorallocate($image, 0xC0, 0xC0, 0xC0);
    $darkgray = imagecolorallocate($image, 0x90, 0x90, 0x90);
    $navy     = imagecolorallocate($image, 0x00, 0x00, 0x80);
    $darknavy = imagecolorallocate($image, 0x00, 0x00, 0x50);
    $red      = imagecolorallocate($image, 0xFF, 0x00, 0x00);
    $darkred  = imagecolorallocate($image, 0x90, 0x00, 0x00);
 
    // Make the 3D effect
    for ($i = 60; $i > 50; $i--) {
        imagefilledarc($image, 50, $i, 100, 50, 0,   45, $darknavy, IMG_ARC_PIE);
        imagefilledarc($image, 50, $i, 100, 50, 45,  75, $darkgray, IMG_ARC_PIE);
        imagefilledarc($image, 50, $i, 100, 50, 75, 360, $darkred,  IMG_ARC_PIE);
    }
 
    imagefilledarc($image, 50, 50, 100, 50,  0,  45, $navy, IMG_ARC_PIE);
    imagefilledarc($image, 50, 50, 100, 50, 45,  75, $gray, IMG_ARC_PIE);
    imagefilledarc($image, 50, 50, 100, 50, 75, 360, $red,  IMG_ARC_PIE);
 
    // Flush the image
    header('Content-type: image/png');
    imagepng($image, "chart.png");
    imagedestroy($image);
?>

