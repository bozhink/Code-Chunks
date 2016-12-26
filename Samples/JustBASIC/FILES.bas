
    'the array used by the files command must already exist
    dim info$(1, 1)

    prompt "Enter a filename to find (example: dos\qbasic.exe)."; fileName$
    files "c:\", fileName$, info$(

    if val(info$(0, 0)) > 0 then _
        notice "file " + fileName$ + " exists" _
      else _
        notice "file " + fileName$ + " doesn't exist"

    'now display a notice reporting an error if there is one
    if instr("0123456789", left$(info$(0, 0), 1)) = 0 then _
        notice info$(0, 0)
