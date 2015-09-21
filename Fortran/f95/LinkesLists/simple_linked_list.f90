program simple_linked_list
    use types
    implicit none
    integer::num,status
    type(node),pointer::list,current ! build up the list
    nullify(list)                    ! initialy nullify list (empty)
    do
        print*,'Enter an integer'
        read*,num
        if (num==0) exit
        allocate(current,stat=status)! create new node
        current%value=num
        current%next=>list
        list => current
    enddo
    ! traverse the list and print values
    current=>list
    do
        if (.not.associated(current)) exit
        print*,current%value
        current=>current%next
    enddo
end program simple_linked_list
