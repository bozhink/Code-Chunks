--Computes days between two dates
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure CountDays is
  subtype TDay is Integer;
  subtype TMonth is Integer;
  type TYear is record
    value : Integer;
    stat : Integer;
    end record;
  type TDate is record
    day : TDay;
    month : TMonth;
    year : TYear;
    end record;
  
  function Counter(Date1, Date2 : in TDate) return Integer is
    Date_Error : exception;
    Years      : Integer;
    N          : Integer;
    Days       : Integer;    
    function feblength(Year : in TYear) return Integer is
    begin
      if Year.stat = 0 then
        return 28;
      else
        return 29;
      end if;      
    end feblength;    
    function DaysToBeginning(Date : in TDate) return Integer is
      MonthLength : array(1..12) of Integer;
      I    : Integer;
      Days : Integer;
    begin
      MonthLength := (31, feblength(Date.year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
      Days := Date.day;
      for I in 1..Date.month-1 loop
        Days := Days + MonthLength(I);
      end loop;
      return Days;
    end DaysToBeginning;
  begin
    Years := Date2.year.value - Date1.year.value;
    if Years < 0 then
      raise Date_Error;
    end if;
    N := Integer(Years/4);
    if (Years - N*4) = 0 then
      if Date1.year.stat = 0 then
        Days := Years*365 + n;
      else
        Days := Years*365 + n + 1;
      end if;
    else
      Days := Years*365 + n + 1;
    end if;
    return Days + DaysToBeginning(Date2) - DaysToBeginning(Date1);
  exception
    when Date_Error => Put_Line("Incorrect dates input");
    when others => raise Program_Error;
  end Counter;
  
  procedure RepairYear(Year : in out TYear) is
    repYear : constant Integer := 2008;
    reference : Integer;
  begin
    Year.stat := 0;
    reference := Year.value - repYear;
    if (abs(reference) mod 4) = 0 then
      Year.stat := 1;
    end if;
  end RepairYear;
  
  Date1 : TDate;
  Date2 : TDate; 
begin  
  Date2.day := 28;
  Date2.month := 1852;
  Date2.year.value := 2009;
  Date2.year.stat := 0;
  --RepairYear(Date2.year);
  Date1.day := 28;
  Date1.month := 2;
  Date1.year.value := 2005;
  Date1.year.stat := 0;
  --RepairYear(Date1.year);
  Put_Line("");
  Put(Counter(Date1, Date2));
  Put_Line("");
end CountDays;