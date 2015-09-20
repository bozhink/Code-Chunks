module function_module

   public::f,df

contains

   function f(x) result(f_val)
      implicit none
      real, intrinsic :: sin
      real, intent(in) :: x
      real :: f_val
      f_val = sin(x) - x*x
   end function f

   function df(x) result(df_val)
      implicit none
      real, intrinsic :: cos
      real, intent(in) :: x
      real :: df_val
      df_val = cos(x) - 2.0*x
   end function df
end module function_module

