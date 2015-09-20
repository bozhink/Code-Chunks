<?php

class hello{
	public function hello(){
		$a=1+2;
		$this->$a+2;
		//echo $this;
	}
}

?>

<?php
  echo "Hello\n\n";
  $h=new hello();
  $h->hello();
?>
