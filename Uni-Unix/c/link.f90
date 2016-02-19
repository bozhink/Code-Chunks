      module types
        type, public :: node
          integer :: value
          type(node), pointer :: next
        end type node
      end module types

      program links_2_3_4
      use types
      integer :: num, status
      type(node), pointer :: list, current
      nullify(list)
      do
          read*,num
          if(num .eq. 0) exit
          allocate(current, stat=status)
          current%value = num
          current%next => list
          list => current
      enddo
      current => list
      do
          if(.not. associated(current)) exit
          print*, current%value
          current => current%next
      enddo
end

