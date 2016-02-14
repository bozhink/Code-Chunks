program test_vectors
    use vectors

    integer :: dot
    real, dimension(3) :: a
    real, dimension(20) :: b
    type(vector) :: v, w
    integer :: i

    ! Initialize arrays and convert to vectors
    a = (/1.0, 2.0, 3.0/)
    b = (/2.0, 3.0, 4.0, 5.0, (0.0, i=1, 16) /)
    v = create_vector(a)
    w = create_vector(b(1:3))

    ! Print details of vectors
    print*,"Length of v is ", vector_size(v)
    print*,"Its elements are (", vector_array(v), ")"
    print*,"Length of w is ", vector_size(w)
    print*,"Its elements are (", vector_array(w), ")"

    ! Calculate and print their scalar product
    print*,"Their scalar product is ", scalar_product(v, w)

    ! Test error messages
    w = create_vector(b)
    w = create_vector(b(1:9))
    dot = scalar_product(v,w)
end program test_vectors
