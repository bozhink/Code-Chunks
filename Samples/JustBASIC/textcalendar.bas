'simple text calendar example
'courtesy Jay Shrimplin

    aDate$= date$("mm/dd/yyyy")
    'aDate$="02/19/2003"
    locate int((28-len(monthname$(aDate$)))/2),y
    print monthname$(aDate$)+" "+right$(aDate$,4)
1 FirstDay=date$(word$(aDate$,1,"/")+"/1/"+word$(aDate$,3,"/"))
2 LastDay$=date$(date$(word$(date$(FirstDay+32),1,"/")+"/1/"+word$(date$(FirstDay+32),3,"/"))-1)
3 dow=val(word$("3 4 5 x 6 7 x 1 2",int((FirstDay/7-int(FirstDay/7))*10)+1))
    print " Sun Mon Tue Wed Thu Fri Sat"
4 for i=1 to val(mid$(LastDay$,4,2))
    y=int((i+dow-2)/7)
    x=(i+dow-2)-y*7
    x=4*x+2
    locate x,y+3
    print using("###",i)
    next i
    print:print " Today is ";
5 i=date$(aDate$)
6 print word$("Tuesday Wednesday Thursday x Friday Saturday x Sunday Monday",int((i/7-int(i/7))*10)+1);
    print " ";aDate$
    wait

    function monthname$(aDate$)
    month=val(aDate$)
    monthname$=word$("January Febuary March April May June July August September October November December",month)
    end function

'--------------------------------------------------------------------------------------------------
'     JulianDay = days since 1901
' (1) Find first day of month - Take current and change day to 1 "02/12/2003" >> "02/1/2003"
' (2) Find last day of month - Take first day and add 32 days to julian makes date next month.
'     Then find first day of that month "03/4/2003" >> "03/1/2003" subtract 1 from julian and you
'     then change julian to mm/dd/yy and you find the last day of any month without leap year issues.
' (3) Find day of week of first day.
'     dow=val(word$("3 4 5 x 6 7 x 1 2",int((i/7-int(i/7))*10)+1))
'     Sun=1 Mon=2 and so on. Where (i) = JulianDay
' (4) (i) = 1 to last day of the month found.
' (5) Change "mm/dd/yyyy" to JulianDay.
' (6) dow$=word$("Tuesday Wednesday Thursday x Friday Saturday x Sunday Monday",int((i/7-int(i/7))*10)+1);
'     where (i) = JulianDay
