module sort_3_module
    implicit none
    real, private :: n1,n2,n3
    public :: read_numbers, &
              sort_numbers, &
              print_numbers
    private :: swap
contains
    subroutine read_numbers()
        print*,'Input numbers n1,n2,n3'
        read*,n1,n2,n3
        print*,'Input data n1:',n1
        print*,'Input data n2:',n2
        print*,'Input data n3:',n3
    end subroutine read_numbers
    !
    subroutine sort_numbers()
        if (n1>n2) then
            call swap(n1,n2)
        endif
        if (n1>n3) then
            call swap(n1,n3)
        endif
        if (n2>n3) then
            call swap(n2,n3)
        endif
    end subroutine sort_numbers
    !
    subroutine print_numbers()
        print*,'The numbers, in ascending order, are:'
        print*,n1,n2,n3
    end subroutine print_numbers
    !
    subroutine swap(a,b)
        real,intent(in out)::a,b
        real::temp
        temp=a
        a=b
        b=temp
    end subroutine swap
end module sort_3_module
