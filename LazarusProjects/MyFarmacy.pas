program Farmacy;
type
  TDate = record
    Day, Month, Year : Integer;
  end;
  Medicine = record
    Name : String[60];
    ProdDate, ExpDate : TDate;
    Price : Real;
    Quantity : Real;
  end;

var  
  fp        : file of Medicine;
  MyMed     : Medicine;
  MyMedArr  : array of Medicine;
  MyExpDate : TDate;
  TotalCost : Real;
  I, N      : Integer;
  Ans       : String[1];
  
begin
  assign(fp, 'Farm.dat');
  rewrite(fp);
  N := 0;
  I := 1;
  Ans:='Y';
  while (Ans='Y') or (Ans='y') do
    begin
    N:=N+1;
    writeln('Enter data for medicine No ', N);
	  with MyMed do
	    begin
		  write('Name: .............................. '); readln(Name);
		  write('Date produced (ex.: 23 10 2007): ... ');
		  readln(ProdDate.Day, ProdDate.Month, ProdDate.Year);
		  write('Price: ............................. '); readln(Price);
		  write('Expire date (ex.: 23 10 2007): ..... ');
		  readln(ExpDate.Day, ExpDate.Month, ExpDate.Year);
		  write('Quantity: .......................... '); readln(Quantity);
		  writeln('');
		  write('Do you want to enter more medicines? Y/N  ');
		  readln(Ans);
		  writeln('');
		end;
	  write(fp, MyMed);
	end;
	
  SetLength(MyMedArr, N);
  writeln('Medicines in the file are: ', N);
  seek(fp, 0);  
  for I:=1 to N do read(fp, MyMedArr[I]);
  
  {A:}
  writeln(''); writeln('Quantity less than 10:');
  for I:=1 to N do
    with MyMedArr[I] do
	  if Quantity < 10.0 then writeln(Name, ':  ', Quantity:1:0);
  
  {B:}
  write('Enter date (ex.: 23 10 2007): ... '); readln(MyExpDate.Day, MyExpDate.Month, MyExpDate.Year);
  for I:=1 to N do
    begin
	  with MyMedArr[I] do
	    if ExpDate.Year < MyExpDate.Year then writeln(Name, ':  ', ExpDate.Day:2, '  ', ExpDate.Month:2, '  ', ExpDate.Year:4)
		else if ExpDate.Year = MyExpDate.Year then
		  if ExpDate.Month < MyExpDate.Month then writeln(Name, ':  ', ExpDate.Day:2, '  ', ExpDate.Month:2, '  ', ExpDate.Year:4)
		  else if ExpDate.Month = MyExpDate.Month then
		    if ExpDate.Day <= MyExpDate.Day then writeln(Name, ':  ', ExpDate.Day:2, '  ', ExpDate.Month:2, '  ', ExpDate.Year:4);
	end;
  
  {C:}
  TotalCost:=0.0;
  for I:=1 to N do
    with MyMedArr[I] do TotalCost:=TotalCost+Price*Quantity;
  writeln('Total cost of all medicines is: ', TotalCost:9:2);
  close(fp);
  readln();
end. 
