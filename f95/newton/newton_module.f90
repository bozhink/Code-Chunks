module newton_module

   public::newton
contains

   subroutine newton(f,df,y1,accuracy,maxit,y,fy,converg)
      implicit none
      interface
         function f(x) result(f_val)
            real, intent(in) :: x
            real :: f_val
         end function f
         function df(x) result(df_val)
            real, intent(in) :: x
            real :: df_val
        end function df
      end interface
      real, intent(in) :: y1, accuracy
      integer, intent(in) :: maxit
      real, intent(out) :: y, fy
      integer, intent(out) :: converg
      integer :: icount
      real :: difference, y2
      icount = 1
      y2 = y1
      do
         y = y2 - f(y2) / df(y2)
         difference = abs(y-y2)
         if (difference <= accuracy) then
            converg=icount
            fy=f(y)
            exit
         else
            icount = icount + 1
            y2 = y
            if (icount <= maxit) then
               cycle
            else
               converg=maxit
               fy=f(y)
               exit
            endif
         endif
      enddo
   end subroutine newton

end module newton_module

