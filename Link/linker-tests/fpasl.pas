library fpas;
 
// function that adds two numbers
function AddNumbers(a, b : Double): Double;
begin
  AddNumbers := a + b;
end;
 
// export this function
exports AddNumbers;
 
// DLL initialization code: no special handling needed
begin
end.