module matrix_determinant_module
    implicit none
    private::gussian_elimination
    public::determinant_calculate

contains

    subroutine determinant_calculate(a,n,d,indx)
    ! Subroutine for evaluating the determinant of a
    ! matrix using the partial pivoting Gaussian
    ! elimination scheme
        implicit none
        ! Dummy arguments
        real, dimension(:,:),intent(in out)::a
        integer,dimension(:),intent(in out)::indx
        integer,intent(in)                 ::n
        real,intent(out)                   ::d
        ! Local variables
        integer :: i,j,msgn
        logical :: ir
        !
        ir=.true.
        call gussian_elimination(a,n,ir,indx)
        !
        d=1.0
        do i=1,n
           d=d*a(indx(i),i)
        enddo
        msgn=1
        do i=1,n
           do
              if (.not.(i/=indx(i))) then
                 exit
              endif
              msgn=-msgn
              j=indx(i)
              indx(i)=indx(j)
              indx(j)=j
           enddo
        enddo
        !
        d=msgn*d
        !
    end subroutine determinant_calculate

    subroutine gussian_elimination(a,n,ir,indx)
    implicit none
    ! Subroutine for partial pivoting Gaussian
    ! elimination.
    ! 'a' is the coefficient matrix in the input
    ! and transformed matrix in the output.
    ! 'indx' records the pivoting order.
    ! 'ir' is the indicator for rescaling
    !
        ! Dummy arguments
        real,dimension(:,:),intent(in out)  :: a
        integer,dimension(:),intent(in out) :: indx
        integer,intent(in)::n
        logical,intent(in out)::ir
        !
        ! Local varialbles
        real,dimension(100)::c
        integer            ::i,j,k,itmp
        real               ::c1,pi,pi1,pj
        ! Initialize the index
        do i=1,n
            indx(i)=i
        enddo
        !
        ! Rescale the coefficients
        do i=1,n
            c1=0.0
            do j=1,n
                c1=max(c1,abs(a(i,j)))
            enddo
            c(i)=c1
        enddo
        do i=1,n
            do j=1,n
                a(i,j)=a(i,j)/c(i)
            enddo
        enddo
        !
        ! Search the pivoting elements
        do j=1,n-1
            pi1=0.0
            do i=1,n
                pi=abs(a(indx(i),j))
                if (pi>pi1) then
                    pi1=pi
                    k=i
                endif
            enddo
            !
            ! Eliminate the elements below the diagonal
            itmp=indx(j)
            indx(j)=indx(i)
            indx(k)=itmp
            do i=j+1,n
                pj=a(indx(i),j) / a(indx(j),j)
                a(indx(i),j)=pj
                do k=j+1,n
                    a(indx(i),k)=a(indx(i),k) - &
                                 pj*a(indx(j),k)
                enddo
            enddo
        enddo
        !
        ! Rescale the coefficients back to the original
        ! magnitudes
        !
        if (ir) then
            do i=1,n
                do j=1,n
                    a(i,j)=c(i)*a(i,j)
                enddo
            enddo
        endif
    !
    end subroutine gussian_elimination

end module matrix_determinant_module
