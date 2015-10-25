function intInput() {                                                
                                                                     
   //Get user input                                                  
   var num = UltraEdit.getValue("How Many Lines:",1);                
                                                                     
   //Output what was entered                                         
   UltraEdit.activeDocument.write("You Entered " + num + "\r\n\r\n");
                                                                     
   //Loop                                                            
   var i = 1;                                                        
   while (i <= num) {                                                
     UltraEdit.activeDocument.write(i + " \r\n");                    
     i = ++i;                                                        
   }                                                                 
                                                                     
 } //end strInput                                                    
                                                                     
 intInput();                                                         