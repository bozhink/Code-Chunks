<?php

require_once "HTML/Template/IT.php";

$listitems = array('Computer Science', 'Nuclear Physics', 'Rocket Science');

$tplfile = 'tpl0.tpl';

$tpl = new HTML_Template_IT('./');
$tpl->loadTemplateFile($tplfile);
$tpl->setVariable('title','IT List Examples');

foreach ($listitems as $item)
{
  $tpl->setCurrentBlock('listentry');
  $tpl->setVariable('entry_text', $item);
  $tpl->parseCurrentBlock('cell');
}

$tpl->show();

?>
