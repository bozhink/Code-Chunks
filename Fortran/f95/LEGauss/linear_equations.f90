module linear_equations
    implicit none
    private::gaussian_elimination, back_substitution
    public::gaussian_solve
contains
    subroutine gaussian_solve(a,b,error)
    ! This subroutine solves the linear set of equations
    ! Ax = b, where the coefficient of A are stored in the
    ! array a. The solution is put in the array b
    ! error indicates if errors are found
        ! Dummy arguments
        real,dimension(:,:),intent(in out):: a
        real,dimension(:),intent(in out)  :: b
        integer,intent(out)               :: error
        ! Reduce the equations by Gaussian elimination
        call gaussian_elimination(a,b,error)
        ! If reduction was successful, calculate solution
        ! by back substitution
        if (error==0) then
            call back_substitution(a,b)
        endif
    end subroutine gaussian_solve
    !
    !
    subroutine gaussian_elimination(a,b,error)
    implicit none
    ! This subroutine performs Gaussian elimination on
    ! a set of linear equations
        !Dummy arguments
        ! a contains the coefficients
        ! b contains the right-hand side
        real,dimension(:,:),intent(in out) :: a
        real,dimension(:),intent(in out)  :: b
        integer,intent(out)                :: error
        ! Local variables
        real,dimension(size(a,1)) :: temp_array
        integer,dimension(1)      :: ksave
        integer                   :: i,j,k,n
        real                      :: temp,m
        !
        ! Validity check
        !
        n=size(a,1)
        if (n==0) then
            error=-1
            return
        endif
        if (n/=size(a,2)) then
            error=-2
            return
        endif
        if (n/=size(b)) then
            error=-3
            return
        endif
        !
        ! Dimensions of arrays are OK, so go ahead with
        ! Gausssian elimination
        !
        error=0
        do i=1,n-1
            ! Find row with largest value of |a(i,j)|,
            ! j=1,...,n
            ksave=maxloc(abs(a(i:n,i)))
            !
            ! Check whether largest |a(i,j)| is zero
            !
            k=ksave(1)+i-1
            if (a(k,i)==0.0) then
                error=-4
                return
            endif
            !
            ! Interchange row i and k, if necessary
            !
            if (k/=i) then
                temp_array=a(i,:)
                a(i,:)    =a(k,:)
                a(k,:)    =temp_array
                ! Interchange corresponding elements of b
                temp=b(i)
                b(i)=b(k)
                b(k)=temp
            endif
            !
            ! Substract multiples of row i from subsequent
            ! rows to zero all subsequent coefficients of x_i
            !
            do j=i+1,n
                m=a(j,i)/a(i,i)
                a(j,:)=a(j,:)-m*a(i,:)
                b(j)=b(j)-m*b(i)
            enddo
        enddo
    end subroutine gaussian_elimination

    subroutine back_substitution(a,b)
    implicit none
    ! This subroutine performs back substitution once a set
    ! of equations has been reduced by Gaussian elimination
        ! Dummy arguments
        ! The array a contains the coefficients
        ! The array b contains the right-hand side
        ! coefficients and will contain the solution on exit
        real,dimension(:,:),intent(in out)::a
        real,dimension(:),intent(in out)  ::b
        ! Local variables
        real::s
        integer::i,j,n
        n=size(b)
        !
        ! Solve for each variable in turn
        do i=n,1,-1
           s=b(i)
           do j=i+1,n
              s=s-a(i,j)*b(j)
           enddo
           b(i)=s/a(i,i)
        enddo
    end subroutine back_substitution
end module linear_equations
