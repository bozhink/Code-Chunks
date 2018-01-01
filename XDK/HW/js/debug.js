//debugging sample code

//Once everything is loaded, this code will draw on the debug sample buttons
document.addEventListener("appMobi.device.ready",function() {

    console.log("This sample code will help illustrate how to do on-device debugging.");
    
	//create the containing DIV element
    var containerDIV = document.createElement('div');
	containerDIV.id = "debugContainerDIV";
	containerDIV.style.textAlign = "center";
    document.getElementById("buttonid").parentNode.appendChild(containerDIV);
		
	//this button should work with no issues thrown in the debugger
    btnDebugGood = document.createElement('div');
    btnDebugGood.setAttribute ("class","button");
	btnDebugGood.style.position = "static";
	btnDebugGood.style.marginLeft = "auto";
    btnDebugGood.id = "btnDebugGood";
    btnDebugGood.innerText = "Good";
    btnDebugGood.addEventListener("touchstart",function(){
    
        //Change the title here
        document.getElementById("headlineDIV").innerHTML="Hello Good!";
        
        
    });
    document.getElementById("debugContainerDIV").appendChild(btnDebugGood);
    
	//add two line breaks
	document.getElementById("debugContainerDIV").appendChild(document.createElement("br"));
	document.getElementById("debugContainerDIV").appendChild(document.createElement("br"));	
    
	//this button includes JavaScript errors that will throw events in the debugger
    btnDebugBad = document.createElement('div');
    btnDebugBad.setAttribute ("class","button");
	btnDebugBad.style.position = "static";
	btnDebugBad.style.marginLeft = "auto";
    btnDebugBad.id = "btnDebugBad";
    btnDebugBad.innerText = "Bad";
    btnDebugBad.addEventListener("touchstart",function(){
        
        //this should break the debugger
        breakDebugger = invalidVariable;
        
        //Change the title here
        document.getElementById("headlineDIV").innerHTML="Hello Bad!";
        
    });
    document.getElementById("debugContainerDIV").appendChild(btnDebugBad);
    
    
},false); 
