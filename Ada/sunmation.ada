package ArrayCalc is
	type Mydata is private;
	function sum return integer;
	procedure setval(arg:in integer);
	private
		size: constant:= 99;
		type myarray is array(1..size) of integer;
		type Mydata is record
			val: myarray;
			sz: integer := 0;
			end record;
		v: Mydata;
end;

package body ArrayCalc is
	function sum return integer is
		temp: integer;
	-- Body of function sum
		begin
		temp := 0;
		for i in 1..v.sz loop
			temp := temp + v.val(i);
			end loop;
			v.sz:=0;
			return temp;
			end sum;
		procedure setval(arg:in integer) is
			begin
			v.sz:= v.sz+1;
			v.val(v.sz):=arg;
			end setval; end;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with ArrayCalc; use ArrayCalc;
procedure main is
	k, m: integer;
begin 
	get(k);
	while k>0 loop
		for j in 1..k loop
		get(m); put(m,3);
		setval(m);
		end loop;
		new_line; put("SUM =");
		put(ArrayCalc.sum,4);
		new_line; get(k);
		end loop;
end;