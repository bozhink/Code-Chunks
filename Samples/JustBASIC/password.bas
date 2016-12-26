'This program is an example contributed by a Liberty BASIC community member.
'PASSWORD EXAMPLE WITH A MASK
'by laz on April 1, 2002

'password protect your programs with this simple password screen
'the password is masked with the asterisk you can change the mask
'to what ever you want. You can also use the backspace key to delete
'a charcter. You can use the enter key to press the Ok button after
' you enter the password
'
'you can remove the ok button and put all the timers to 10
'"timer 10, [t]" the just use the enter key to enter password
'
'the password in this example is "ok"
nomainwin
enter$ = chr$(_VK_RETURN) : backspace$ = chr$(_VK_BACK)
bs = 2 'for some reason when you press the
'backspace key it shows up twice and
'deletes two charcters. This is used
'as a counter so the backspace only
'deletes one charcter at a time
'** if anyone knows how to fix this please
'** post it to the group. Thanks

WindowWidth = 285 : WindowHeight= 130
'center the window
UpperLeftX = (DisplayWidth-WindowWidth)/2
UpperLeftY = (DisplayHeight-WindowHeight)/2

'graphicbox is used to capture key input
graphicbox #pass.gb, 0,0,0,0
textbox #pass.tb, 1,20,275,25
'ok button optional
button #pass.default, "Ok", [ok],UL 100,60,70,25
open "Enter Password" for window as #pass
print #pass, "trapclose [quitpass]"
print #pass, "font courier_new 10 bold"
print #pass.gb, "setfocus"
print #pass.gb, "when characterInput [letter]"
timer 400, [t]
wait

[t]
'if enter = 1 the enter key was pressed
if enter = 1 then timer 0 : goto [ok]
print #pass.gb, "setfocus"
wait

[letter]
timer 0
key$ = Inkey$ : key$ = left$(Inkey$, 2) : vkey$ = right$(key$,1)
if vkey$ <> enter$ and vkey$ <> backspace$ then
b$ = b$ + key$ : b = len(b$) : fill$ = ""
for x = 1 to b:fill$ = fill$ + "*" : next x 'fill mask with "*"
print #pass.tb, fill$ : print #pass.gb, "setfocus"
end if
if vkey$ = enter$ then enter = 1
if vkey$ = backspace$ and bs = 2 then
b = len(b$) : b=b-1 : b$ = left$(b$,b) : fill$ = ""
for x = 1 to b : fill$ = fill$ + "*" : next x 'fill mask with "*"
print #pass.tb, fill$ : print #pass.gb, "setfocus"
bs = bs +1: if bs = 3 then bs = 1 else if bs = 1 then bs = 2
end if : timer 400, [t]
wait

[quitpass]
timer 0
close #pass
end

[ok]
timer 0
if b$ = "ok" then 'password is "ok"
'do events for correct password
notice " " + chr$(13) + "Correct password" : print #pass.tb, ""
print #pass.gb, "setfocus" : b$ = ""
enter = 0 'leave timer off if opening a new window "timer 0"
timer 400, [t]
else
'do events for wrong password
notice " " + chr$(13) + "Wrong Password!" : print #pass.tb, ""
print #pass.gb, "setfocus" : b$ = "" : enter = 0 : timer 400, [t]
end if
wait
