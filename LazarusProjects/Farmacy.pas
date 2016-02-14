program Farmacy;
type
  LString = String[255];
  Medicine = Record
    Name : LString;
    ProdDate : String[10];
    ExpDate  : String[10];
    Price : Real;
    Quantity : Integer;
  end;

const
  IniFile = 'Sheets.init';

var
  CurrSheet    : LString;
  FP           : File of LString;
  FV           : File of Medicine;
  OutputVar    : LString;
  BufLS        : Array of LString;	
  BufI         : Integer;
  I            : Integer;

  procedure PInit;
  begin
    assign(FP, IniFile);
	reset(FP);
    BufI := filesize(FP) + 1;
	SetLength(BufLS, BufI);
	I := 1;
    while not eof(FP) do
	  begin
        read(FP, OutputVar);
	    BufLS[I] := OutputVar;
        I := I + 1;
	  end;
  end;  

  procedure OpenSheet;
  var
    OutputVar : LString;
  begin
    writeln('Choose Sheet to be used from the list below:');
    assign(FP, IniFile);
	  reset(FP);	  
	  while not eof(FP) do
	    begin
        read(FP, OutputVar);
		    writeln('     ',OutputVar);
	    end;
    
	  close(FP);
	  writeln('');
	  readln(CurrSheet);
  end;
  
  procedure CreateNewSheet;
  var
    NewSheetName : LString;	
    OutputVar    : LString;
    BufLS        : Array of LString;	
	  BufI         : Integer;
	  I            : Integer;
  begin
    writeln('You are about to create a new sheet.');
	  writeln('Enter the full path name of the new sheet');
	  readln(NewSheetName);
	  assign(FP, IniFile);
	  reset(FP);
    BufI := filesize(FP) + 1;
	  SetLength(BufLS, BufI);
	  I := 1;
    while not eof(FP) do
	    begin
        read(FP, OutputVar);
		    BufLS[I] := OutputVar;
        I := I + 1;
	    end;
    BufLS[BufI] := NewSheetName;
    for I := 1 to BufI do
      begin
        write(FP, BufLS[I]);
      end;  	
  	close(FP);
  	assign(FV, NewSheetName);
  	rewrite(FV);
  	close(FV);	
  end;  
  
  procedure AddNewRecord;
  var
    NewRec : Medicine; 
    I, N   : Integer;	
  begin
    writeln('You are about enter new medicine:');
	  writeln('Enter how many records you want to add');
  	readln(N);
  	writeln('Enter required data:');
  	assign(FV, CurrSheet);
  	reset(FV);
	  seek(FV,filesize(FV));
	  for I:=1 to N do
	    begin
	      writeln('Record #',I,':');
	      with NewRec do
	        begin
	          write('   Name ................... '); readln(Name);
	          write('   Date of production ..... '); readln(ProdDate);
	          write('   Expiry date ............ '); readln(ExpDate);
	          write('   Price .................. '); readln(Price);
	          write('   Quantity ............... '); readln(Quantity);
	        end;
	  	  write(FV, NewRec);
	  	end;	
	  close(FV);
  end;
  
begin
  PInit;
  CreateNewSheet;
  OpenSheet;
  AddNewRecord;
  read();
end.