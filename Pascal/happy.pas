program Happy;
var nhappy: real;    {брой на щастливите комбинации}
    c1,c2,c3 : integer; {първа, втора и трета цифра}
begin
{брой на трицифрените комбинации със сума на цифрите 13}
    nhappy := 0;
    for c1:=0 to 9 do
    for c2:=0 to 9 do
    for c3:=0 to 9 do
    if c1+c2+c3=13 then nhappy:=nhappy+1;
    {брой на търсените трицифрени щастливи комбинации}
    nhappy:=Sqrt(nhappy);
    writeln('Щастливите комбинации са ', nhappy:7:2, ' комбинации от цифри.');
end.

