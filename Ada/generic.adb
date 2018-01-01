-- (C) 1994-1996 Arthur Vargas Lopes
-- Generic function body
function Factorial(N : in Num) return Num is
begin
	if N < Num(0) then
		raise Constraint_Error;
	elsif N = Num(0)  then
		return Num(1);
	else
		return N * Factorial(N - Num(1));
	end if;
end Factorial;