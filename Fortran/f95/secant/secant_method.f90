program secant_method
use secant_module
use function_module
    implicit none
    real::x1,x2,eps,z,fz
    integer::miter,flag

    x1=0.1
    x2=0.5
    eps=0.000001
    miter=100

    print*,'Solution by secant method'

    call secant(f,x1,x2,eps,miter,z,fz,flag)

    if (flag==-1) then
       print*
       print*,'No convergence in MITER iterations'
       stop
    elseif(flag==0) then
       print*
       print*,'Converged solution = ',z
       print*,'f = ', fz
    else
       print*
       print*,'ERROR: Invalid flag'
       stop
    endif
end program secant_method
