
  'INKEY.BAS  - how to use the Inkey$ variable

  open "Inkey$ example" for graphics as #graph
  print #graph, "when characterInput [fetch]"

[mainLoop]
  print #graph, "setfocus"
  input r$

[fetch]  'a character was typed!

  key$ = Inkey$
  if len(key$) = 1 then
      notice key$+" was pressed!"
  else
      keyValue = asc(right$(key$, 1))
      if keyValue = _VK_SHIFT then
          notice "Shift was pressed"
        else
          if keyValue = _VK_CONTROL then
              notice "Ctrl was pressed"
            else
              notice "Unhandled key pressed"
          end if
      end if
  end if

  goto [mainLoop]
