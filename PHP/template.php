<?php
require_once "HTML/Template/IT.php";

$tplfile = './tpl.tpl';

$tpl = new HTML_Template_IT('./');
$tpl->loadTemplateFile($tplfile);
$tpl->setVariable('title','Hello, World');
$tpl->setVariable('body','This is a test');
$tpl->show();

?>

