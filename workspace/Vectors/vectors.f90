module vectors
    public :: create_vector, vector_size, vector_array, &
              scalar_product

    ! Maximum length for vectors
    integer, parameter, private :: max_length = 10

    ! Derived type definition
    type, public :: vector
        integer :: length
        real, dimension(max_length) :: elements
    end type vector

contains

    function create_vector(array) result(v)
    ! This function creates a vector from elements
    ! of an array
    !
        ! Dummy arguments
        real, dimension(:), intent(in) :: array

        ! Result
        type(vector) :: v

        ! Validity check
        if (size(array) > max_length) then
            print*,"Error: Vector of length ", size(array), &
                   " requested"
            print*,"Maximum permitted is ", max_length
            v%length = 0
        else
            ! OK - copy array to vector
            v%length = size(array)
            v%elements(1:v%length) = array
        endif
    end function create_vector

    function vector_size(v) result (vec_size)
    ! This function returns the size of a vector
    !
        ! Dummy argument
        type(vector), intent(in) :: v

        ! Result
        integer :: vec_size

        vec_size = v%length
    end function vector_size

    function vector_array(v) result(arr)
    ! This function returns the elements of a vector
    ! as an array
    !
        ! Dummy arguments
        type(vector), intent(in) :: v

        ! Result
        real, dimension (v%length) :: arr

        arr = v%elements(1:v%length)
    end function vector_array

    function scalar_product(v1, v2) result (p)
    ! This function returns the scalar product of
    ! two vectors
    !
        ! Dummy arguments
        type(vector), intent(in) :: v1, v2

        ! Result
        real :: p

        ! Local variables
        integer :: i

        ! Validity check
        if (v1%length /= v2%length) then
            ! Vectors have different lengths
            print*,"Error: Vectors are of different lengths",&
                v1%length, " and ", v2%length
            print*,"Zero result returned"
            p=0.0
        else
            ! OK - calculate dot product
            p = 0.0
            do i = 1, v1%length
               p = p + v1%elements(i)*v2%elements(i)
            enddo
        endif
    end function scalar_product

end module vectors
