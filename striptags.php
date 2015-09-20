#!/usr/bin/php
<?php
	while ($line=fgets(STDIN))
	{
		$out=strip_tags($line);
		if (!preg_match('/\n\r*$/',$out)) { $out .= "\n"; }
		print $out;
	}
?>
