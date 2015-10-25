// Hello welcome to the UltraEdit scripting environment. Normally you would     
// put a header comment at the top of a javascript file to be used in UltraEdit 
// in order to indicate the version of the UltraEdit scripting API like so:     
// Version = 1.00                                                               
// However, this is currently not necessary since the API will default to 1.00. 
                                                                                
// ---------------------------------------------------------------------------- 
// header.js                                                                    
// This script creates a header for all open documents                          
// ---------------------------------------------------------------------------- 
// UltraEdit is our application object. All UltraEdit operations will use this  
// object.                                                                      
                                                                                
// Get the num of open documents.                                               
 var num_of_docs = UltraEdit.document.length;                                   
                                                                                
 var dashes = "// ------------------------------------------------------------";
 dashes += "----------------\r\n";                                              
                                                                                
// Enumerate through all open documents and add the header.                     
 var index;                                                                     
 for (index = 0; index < num_of_docs; index++) {                                
   UltraEdit.document[index].top();                                             
   UltraEdit.document[index].write(dashes);                                     
   UltraEdit.document[index].write("// Script Name: \r\n");                     
   UltraEdit.document[index].write("// Creation Date: \r\n");                   
   UltraEdit.document[index].write("// Last Modified: \r\n");                   
   UltraEdit.document[index].write("// Copyright (c)20XX\r\n");                 
   UltraEdit.document[index].write("// Purpose: \r\n");                         
   UltraEdit.document[index].write(dashes);                                     
 } //end for loop                                                               