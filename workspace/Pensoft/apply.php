#!/usr/bin/php
<?php
if (empty($argv[1]) || empty($argv[2])) { die ("Usage: $argv[0] <xml-file> <xsl-file>\n"); }

$xmlFile = $argv[1];
$xslFile = $argv[2];

$dom = new domDocument();
$dom->load($xslFile);
$proc = new xsltprocessor;
$xsl = $proc->importStylesheet($dom);

$xml = new domDocument();
$xml->load($xmlFile);

$string = $proc->transformToXml($xml);
echo $string;
?>