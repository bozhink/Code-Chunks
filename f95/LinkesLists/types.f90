module types
    implicit none
    type,public::node
        integer::value           ! data field
        type(node),pointer::next ! pointer field
    end type node
end module types
