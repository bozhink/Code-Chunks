module secant_module
    implicit none
    public::secant
contains
    subroutine secant(f,x1,x2,eps,miter,z,fz,flag)
        interface
            function f(x)
                real,intent(in)::x
                real::f
            end function f
        end interface
        !
        real,intent(in)::x1,x2,eps
        real,intent(out)::z,fz
        integer,intent(in)::miter
        integer,intent(out)::flag
        real::f1,f2,y1,y2
        integer::i
        !
        y1=x1
        y2=x2
        f1=f(y1)
        f2=f(y2)
        flag=0
        do i=1,miter+1
            if (i>miter) then
                flag=-1
                return
            endif
            z=y2-f2*(y2-y1)/(f2-f1)
            fz=f(z)
            if (abs(fz)<=eps) then
                flag=0
                return
            else
                y1=y2
                y2=z
                f1=f2
                f2=fz
            endif
        enddo
    end subroutine secant
end module secant_module
