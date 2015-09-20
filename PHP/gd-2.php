#!/usr/bin/php
<?php
    print $argv[0]."\n";
    print $argc;
    
    $fp = fopen('gd-1.php','r');
    $line = fgets($fp);
    fclose($fp);
    
    print $line[1];
    
    
    $img = imagecreatetruecolor(100,100);
    
    $white    = imagecolorallocate($img, 0xFF, 0xFF, 0xFF);
    $gray     = imagecolorallocate($img, 0xC0, 0xC0, 0xC0);
    $darkgray = imagecolorallocate($img, 0x90, 0x90, 0x90);
    $navy     = imagecolorallocate($img, 0x00, 0x00, 0x80);
    $darknavy = imagecolorallocate($img, 0x00, 0x00, 0x50);
    $red      = imagecolorallocate($img, 0xFF, 0x00, 0x00);
    $darkred  = imagecolorallocate($img, 0x90, 0x00, 0x00);
    
    imagerectangle($img, 0, 0, 10, 10, $red);
    imagefilledrectangle($img, 10, 10, 30, 30, $navy);
    
    // Flush the image
    //header('Content-type: image/png');
    imagepng($img, "rectangle.png");
    imagedestroy($img);
    
    $stderr = fopen("php://stderr", "w");
    fwrite($stderr, "Image destroyed\n");
    fclose($stderr);
?>
