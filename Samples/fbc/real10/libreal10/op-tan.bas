#include once "real10.bi"
#include once "intern.bi"

Function xTan ( Byref lhs As ext ) As ext
    Dim As ext retval
    x_Tan ( retval, lhs )
    Return retval
End Function

Function xTan ( Byval lhs As Integer ) As ext
    Dim As ext retval
    iReal10 ( retval, lhs )
    x_Tan ( retval, retval )
    Return retval
End Function

Function xTan ( Byval lhs As Single ) As ext
    Dim As ext retval
    sReal10 ( retval, lhs )
    x_Tan ( retval, retval )
    Return retval
End Function

Function xTan ( Byval lhs As Double ) As ext
    Dim As ext retval
    dReal10 ( retval, lhs )
    x_Tan ( retval, retval )
    Return retval
End Function
