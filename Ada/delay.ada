-- (C) 1994-1996 Arthur Vargas Lopes
with Text_IO; use Text_IO;
with Calendar; use Calendar;

procedure Testa_Delay is
    Interval  : Duration := 0.01;
    Next_Time : Time;
    Work_Time : Time;
    task Will_Be_Aborted is
        entry Start;
    end Will_Be_Aborted;
    task body Will_Be_Aborted is
    begin
        accept Start;
        loop
            Put('a');
        end loop;
    end Will_Be_Aborted;
begin
    Will_Be_Aborted.Start;
    Next_Time := Clock + Interval;
    Work_Time := Clock + 0.07;
    while Clock <= Work_Time loop
        delay until Next_Time;
        New_Line;
        Put('.');
        Next_Time := Next_Time + Interval;
    end loop;
    abort Will_Be_Aborted;
    New_Line;
end Testa_Delay;