module expression_module

public :: expression, term, primary, number, position, combine

contains

recursive function expression (string)  &
      result (expression_result)

   character (len = *), intent (in) :: string
   integer :: expression_result
   integer :: op

   expression_result = term (string)
   if (expression_result < 0) then
      ! Find first + outside parens
      op = position (string, "+") 
      if (op > 0) then
         expression_result =  &
            combine (term (string (:op-1)),  &
               expression (string (op+1:)), "+")
      end if
   end if

end function expression

recursive function term (string)  result (term_result)

   character (len = *), intent (in) :: string
   integer :: term_result
   integer :: op

   term_result = primary (string)
   if (term_result < 0) then
      ! find first * outside parens
      op = position (string, "*") 
      if (op > 0) then
         term_result =  &
            combine (primary (string (:op-1)),  &
                        term (string (op+1:)), "*")
      end if
   end if

end function term

recursive function primary (string)  &
      result (primary_result)

   character (len = *), intent (in) :: string
   integer :: primary_result
   integer :: ls

   primary_result = number (string)
   ls = len (string)
   if (primary_result < 0 .and. ls > 0) then
      if (string (1:1) == "(" .and.  &
          string (ls:ls) == ")") then
         primary_result =  &
               expression (string (2 : ls - 1))
      end if
   end if

end function primary
     
function number (string)  result (number_result)

   character (len = *), intent (in) :: string
   integer :: number_result

   if (len (string) > 0 .and.  &
         verify (string, "0123456789") == 0) then
      read (unit = string, fmt = *) number_result
   else
      number_result = -1
   end if

end function number

function position (string, op_symbol)  &
      result (position_result)

   character (len = *), intent (in) :: string, op_symbol
   integer :: position_result
   integer :: p, paren_count

   position_result = 0
   paren_count = 0
   do p = 1, len (string)
      ! Can't use a case construct,
      ! because op_symbol is a variable
      if (string (p:p) == "(") then
         paren_count = paren_count + 1
      else if (string (p:p) == ")") then
         paren_count = paren_count - 1
      else if (string (p:p) == op_symbol .and.  &
                paren_count == 0) then
         position_result = p
         exit
      end if
   end do

end function position

function combine (x, y, op_symbol)  &
      result (combine_result)

   integer, intent (in) :: x, y
   character (len = *), intent (in) :: op_symbol
   integer :: combine_result

   if (x < 0 .or. y < 0) then
      combine_result = -1
   else
      select case (op_symbol)
         case ("+")
            combine_result = x + y
         case ("*")
            combine_result = x * y
         case default
            combine_result = -1
      end select
   end if

end function combine

end module expression_module

program expression_evaluation

   use expression_module
   character (len = 100), dimension (4) :: line
   integer :: value, n

   line = (/                                  &
            "(443+29)(38+754)              ", &
            "89+23*4                       ", &
            "(((((((555)))))))             ", &
            "64+23*(5388+39)*(54*22+3302*2)"  &
          /)

   do n = 1, 4
      value = expression (trim (line (n)))
      print *, "The value of the expression is: ", value
   end do

end program expression_evaluation
