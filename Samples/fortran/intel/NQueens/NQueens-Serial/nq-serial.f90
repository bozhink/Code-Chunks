! Copyright (C) 2008 Intel Corporation. All Rights Reserved. 
!
! The source code contained or described herein and all documents related to the source code 
! ("Material") are owned by Intel Corporation or its suppliers or licensors. Title to the 
! Material remains with Intel Corporation or its suppliers and licensors.  The Material is 
! protected by worldwide copyright laws and treaty provisions. No part of the Material may be 
! used, copied, reproduced, modified, published, uploaded, posted, transmitted, distributed, 
! or disclosed in any way except as expressly provided in the license provided with the 
! Materials.  No license under any patent, copyright, trade secret or other intellectual 
! property right is granted to or conferred upon you by disclosure or delivery of the 
! Materials, either expressly, by implication, inducement, estoppel or otherwise, except as 
! expressly provided in the license provided with the Materials.
!
program NQueens

! Solve the nqueens problem - base serial version
!
! Original C++ code by Ralf Ratering & Mario Deilmann
! Fortran version by Steve Lionel
!
! Read http://en.wikipedia.org/wiki/Nqueens for background
!
! To set command line argument in Visual Studio, right click on the project name and select Properties.
! Under Debugging, enter the argument (board size) in Command Arguments.

implicit none

integer :: nrOfSolutions = 0 
integer :: size = 0

character(2) :: cmdarg
integer :: stat
integer :: time_start, time_end, count_rate
integer, allocatable :: queens(:)

! Get command line argument
if (command_argument_count() < 1) then
  print *, "Usage: nq-serial boardSize"
  stop
  end if
call get_command_argument (1, cmdarg, status=stat)
if (stat /= 0) then
  print *, "Invalid boardSize"
  stop
  end if
read (cmdarg,*,iostat=stat) size
if ((stat /= 0) .or. (size < 1)) then
  print *, "Error: boardSize must be between 1 and 99"
  stop
  end if

! Begin
print 101, "Starting serial recursive solver for size ", size
101 format (A,I0,A)
call system_clock (time_start)
allocate (queens(size))
call solve (queens)
call system_clock (time_end, count_rate)
print 101, "Number of solutions: ", nrOfSolutions
print 101, "Calculations took ", (time_end-time_start) / (count_rate/1000), "ms."
deallocate (queens)

contains

! Routine to print the board

subroutine print (queens)
  implicit none
  integer, intent(in) :: queens(:)
  integer :: row, col

  do row=1,size
    do col=1,size
      if (queens(row) == col) then
        write (*,'(A)',advance='no') "Q"
      else
        write (*,'(A)',advance='no') "-"
      end if
    end do
  write (*,'(A)')
  end do
write (*,*)
end subroutine print

! Recursive routine to set a queen on the board

recursive subroutine setQueen (queens, row, col)
  implicit none
  integer, intent(in) :: queens(:)
  integer, intent(in) :: row, col
  ! Declare local copy of queens array.  This will go
  ! on the stack - we could make it ALLOCATABLE if
  ! stack overflow might occur
  integer :: lcl_queens(ubound(queens,dim=1))
  integer :: i
  
  ! Make copy of queens array
  lcl_queens = queens
  
  do i=1,row
    ! vertical attacks
    if (lcl_queens(i) == col) return
    ! diagonal attacks
    if (abs(lcl_queens(i)-col) == (row-i)) return
    end do
    
  ! column is ok, set the queen
  lcl_queens(row) = col
  
  if (row == size) then
    nrOfSolutions = nrOfSolutions + 1
!DEC$ IF DEFINED(_DEBUG)
    call print(lcl_queens)
!DEC$ END IF
  else
    ! try to fill next row
    do i=1,size
      call setQueen (lcl_queens, row+1, i)
    end do
  end if
end subroutine SetQueen

! Main solver routine

subroutine solve (queens)
  implicit none
  integer, intent(inout) :: queens(:)
  integer i

  do i=1,size
    ! try all positions in first row
!DEC$ IF DEFINED(_DEBUG)
    print '(A,I0)', "Call SetQueen with: row:1, column: ", i
!DEC$ END IF
    call SetQueen (queens, 1, i)
  end do
end subroutine solve

end program nQueens