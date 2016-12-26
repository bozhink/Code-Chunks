!  Contributed by Levent Kitis

!  This program prints a magic squares array, an n by n matrix in which
!  each integer 1, 2, ..., n*n appears exactly once and all columns, 
!  rows, and diagonals sum to the same number.

!  Here is the result of a sample run:

! Order of magic squares matrix? 7
!    30   39   48    1   10   19   28
!    38   47    7    9   18   27   29
!    46    6    8   17   26   35   37
!     5   14   16   25   34   36   45
!    13   15   24   33   42   44    4
!    21   23   32   41   43    3   12
!    22   31   40   49    2   11   20

module stdtypes

!  symbolic name for kind type of 4 byte integers

  integer, parameter, public :: i4 = selected_int_kind (9)

!  one-byte storage of logical values. if unavailable, use default
!  logical by uncommenting default logical definition above.

  integer (kind = i4), parameter, public :: lg = 1_i4

end module stdtypes

module indexCheckM
  use stdtypes

  private
  public :: indexChecker

contains

  function indexChecker (row, col, rowdim, coldim) result(indexCheck)
  integer (kind = i4), intent (in) :: row, col, rowdim, coldim
  logical (kind = lg)  :: indexCheck
  if (row >= 1 .and. row <= rowdim .and. col >= 1 .and. col <= coldim) then
    indexCheck = .true.
  else
    indexCheck = .false.
  end if
  end function  indexChecker

end module indexCheckM

program magicSquares

  use stdtypes
  use indexCheckM

  integer (kind = i4) :: matrixOrder, ios
  integer (kind = i4), dimension (:,:), pointer :: matrix
  integer (kind = i4) :: row, col, prow, pcol, k
  character (len = 32) :: rowformat

  write (unit = *, fmt = "(a)", iostat = ios, advance = "no") &
         "Order of magic squares matrix? "
  read (unit = *, fmt = *, iostat = ios) matrixOrder

  if (modulo(matrixOrder, 2) == 0) then
    print *, "Order of magic square matrix must be odd"
    stop
  end if

  allocate(matrix(matrixOrder, matrixOrder))  
  matrix = 0

  row = 1
  col = (matrixOrder - 1)/2 + 1
  matrix(row, col) = 1

  do k = 2, matrixOrder*matrixOrder
    prow = row - 1
    pcol = col + 1
    if (indexChecker(prow, pcol, matrixOrder, matrixOrder)) then
      if (matrix(prow, pcol) == 0) then
        row = prow
        col = pcol
      else
        row = row + 1
      end if
    else if (prow < 1 .and. indexChecker(1, pcol, matrixOrder, matrixOrder)) then
      row = matrixOrder
      col = pcol
    else if(indexChecker(prow, 1, matrixOrder, matrixOrder) .and. pcol > matrixOrder) then
      row = prow
      col = 1
    else if (prow == 0 .and. pcol == matrixOrder + 1) then
      row = row + 1
    end if
    matrix(row, col) = k
  end do

  write (unit = rowformat, fmt = "(i16)", iostat = ios) matrixOrder*matrixOrder
  k = len_trim(adjustl(rowformat)) + 3
  write (unit = rowformat, fmt = "(a1, i4, a1, i2, a1)", iostat = ios) &
       "(", matrixOrder, "i", k, ")"

  do k = 1, matrixOrder
    write (unit = *, fmt = rowformat, iostat = ios) matrix(k, 1:matrixOrder)
  end do

  deallocate (matrix)
  
end program magicSquares
