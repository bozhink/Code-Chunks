program heat
    implicit none
    real,dimension(10,10),target::plate
    real,dimension(8,8)         ::temp
    real,pointer,dimension(:,:) ::n,e,s,w,inside
    real,parameter::tolerance=1.0e-4
    character(len=*),parameter::plateFormat="(10f5.2)"
    real::diff
    integer::i,j,niter
    !
    ! Set up initial conditions
    plate=0
    plate(1:10,1)=1.0 ! boundary value
    plate(1,1:10)=(/(0.1*j,j=10,1,-1)/)
    !
    ! Point to part of tje plate
    inside => plate(2:9,2:9)
    n => plate(1:8,2:9)
    s => plate(3:10,2:9)
    e => plate(2:9,1:8)
    w => plate(2:9,3:10)
    !
    ! Iterate
    niter = 0
    do
        temp=(n+e+s+w)*0.25
        diff=maxval(abs(temp-inside))
        niter=niter+1
        inside=temp
        print*,niter,diff
        if (diff<tolerance) then
            exit
        endif
    enddo
    print*
    do i=1,10
        print plateFormat, plate(1:10,i)
    enddo
end

