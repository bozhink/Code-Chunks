  function ok(){
      alert("OK");
  }
  function MayBe(){
      var textb = document.getElementById("mytext");
      var txt=textb.value;
      alert(txt);
      textb.value="Hello, World!";
  }
  function initEditor(){
    var editor = document.getElementById("myEditor");
    editor.contentDocument.designMode = 'on';
  }
  function doCancel(){Close();}