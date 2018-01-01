-- (C) 1993-1998 Arthur Vargas Lopes
-- Source file CQSort.Ada
-- Designed and written for a The George Washington University project and
-- sponsored by the United States Advanced Research Projects Agency  (ARPA)
-- under contract #F29601-93-K-0215, administered by Phillips Laboratory,
-- Kirtland AFB, NM 87117-5776.

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Parallel_Quick_Sort is
    type Data_Type is array(Integer range <>) of Integer;
    Data : Data_Type(1..20) := (10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0,-1,-2,-3,-4,-5,-6,-7,-8,-9);

    procedure Swap(X, Y : in out Integer) is
        Temp : Integer;
    begin
        Temp := x;
        X := y;
        Y := Temp;
    end Swap;
    
    procedure Find_Pivot(Left : Integer; Right : Integer; Pivot : out Integer) is

        FirstKey  : Integer := Data(Left);

    begin
        Pivot := 0; 
        for Up in Left+1 .. Right loop
            if Data(Up) > FirstKey then
                Pivot := Up;
                exit;
            elsif Data(up) < FirstKey then
                Pivot := Left;
                exit;
            end if;
        end loop;
            
    end Find_Pivot;

    procedure Partition(Left, Right : Integer;
                        Pivot : Integer; 
                        Partition_Point : out Integer) is
                            
	Up   : Integer := Left;
	Down : Integer := Right;
    begin
        loop            
            Swap(Data(Up),Data(Down));
            while Data(Up) < Pivot loop
                Up := Up + 1;
            end loop;
                
            while Pivot <= Data(Down) loop
                Down := Down - 1;
            end loop;
                
            exit when Up > Down;
                
        end loop;
            
        Partition_Point := Up;
            
    end Partition;

    procedure CQuick_Sort(Left, Right : Integer) is

        Pivot_Point     : Integer;
        Pivot           : Integer;
        Partition_Point : Integer;
       
    begin

        Find_Pivot(Left,Right,Pivot_Point);

        if Pivot_Point /= 0 then

            Pivot := Data(Pivot_Point);
            Partition(Left,Right,Pivot,Partition_Point);

            declare  

                task type CQSort is
                    entry Start(First, Last : Integer);
                end;
		
	CQSort_Left, CQSort_Right : CQSort;

                task body CQSort is
                    First_B, Last_B : Integer;    
                begin
        
                    accept Start(First, Last : Integer) do
                        First_B := First;
                        Last_B  := Last;
                    end Start;
                    if First_B < Last_B then
	                    CQuick_Sort(First_B , Last_B);
	            end if;
                end;

            begin
            
                CQSort_Right.Start(Partition_Point,Right);
                CQSort_Left .Start(Left,Partition_Point - 1);
                
            end;
        end if;

    end CQuick_Sort;
        
begin

    for I in Data'range loop        
        Put(Data(i),3);
    end loop;

    New_Line;

    CQuick_Sort(Data'first , Data'last);

    for I in Data'Range loop        
        Put(Data(I),3);
    end loop;

    New_Line;

end Parallel_Quick_Sort;
