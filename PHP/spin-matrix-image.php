#!/usr/bin/php
<?php
    if ($argc < 2)
    {
        print "Usage: $argc[0] <filename>\n";
        return;
    }
    
    // Opening file to be read
    $fileName = $argv[1];
    print "Current file: $fileName\n";
    
    $fp = fopen("$fileName", 'r');
    if (!$fp)
    {
        die ("The file $fileName can not be opened.\n");
    }
    
    // Creating image instance
    $img = imagecreatetruecolor(500,500);
    
    // Definig some colors
    $white    = imagecolorallocate($img, 0xFF, 0xFF, 0xFF);
    $gray     = imagecolorallocate($img, 0xC0, 0xC0, 0xC0);
    $darkgray = imagecolorallocate($img, 0x90, 0x90, 0x90);
    $navy     = imagecolorallocate($img, 0x00, 0x00, 0x80);
    $darknavy = imagecolorallocate($img, 0x00, 0x00, 0x50);
    $red      = imagecolorallocate($img, 0xFF, 0x00, 0x00);
    $darkred  = imagecolorallocate($img, 0x90, 0x00, 0x00);
    $colors = array($white, $gray, $navy, $red, $darkred);
    
    // Parsing file
    while (!feof($fp))
    {
        $line = fgets($fp);
        print strlen($line)."\n";
    
    
        $indx0 = 0;
        $indx1 = 0;
        $getstring = true;
        $arrindx = 0;
        $coord = null;
        for ($i=0; $i<strlen($line); $i++)
        {
            if ($line[$i]=='0' or $line[$i]=='1' or
                $line[$i]=='2' or $line[$i]=='3' or
                $line[$i]=='4' or $line[$i]=='5' or
                $line[$i]=='6' or $line[$i]=='7' or
                $line[$i]=='8' or $line[$i]=='9')
            {
                $getstring = true;
                $indx1 = $i;
            }
            else
            {
                if ($getstring)
                {
                    $coord[$arrindx++] = (int) substr($line, $indx0, $indx1-$indx0+1);
                }
                $getstring = false;
                $indx0 = $i+1;
                $indx1 = $i+1;
            }
       }
       //print_r($coord);
       
       imagefilledrectangle($img, $coord[0], $coord[1], $coord[0]+$coord[2], $coord[1]+$coord[3], $colors[$coord[4]]);
    }
    
    
    // Flush the image
    //header('Content-type: image/png');
    imagepng($img, $fileName.".png");
    imagedestroy($img);
    
    $stderr = fopen("php://stderr", "w");
    fwrite($stderr, "Image destroyed\n");
    fclose($stderr);
?>
