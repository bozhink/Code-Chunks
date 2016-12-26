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

! Solve the nqueens problem using the Backtrack Tree method
! described by Martin Richards in
! "Backtracking Algorithms in MCPL using Bit Patterns and Recursion"
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
integer :: size_mask
integer :: stat
integer :: time_start, time_end, count_rate

! Get command line argument
if (command_argument_count() < 1) then
  print *, "Usage: nq-bttree boardSize"
  stop
  end if
call get_command_argument (1, cmdarg, status=stat)
if (stat /= 0) then
  print *, "Invalid boardSize"
  stop
  end if
read (cmdarg,*,iostat=stat) size
if ((stat /= 0) .or. (size < 1) .or. (size > 32)) then
  print *, "Error: boardSize must be between 1 and 32"
  stop
  end if

! Begin
print 101, "Starting backtrack tree solver for size ", size
101 format (A,I0,A)
! Create bitmask with low order "size" bits set to 1
size_mask = (2**size) - 1

!Begin
call system_clock (time_start)
call solve (0,0,0)
call system_clock (time_end, count_rate)
print 101, "Number of solutions: ", nrOfSolutions
print 101, "Calculations took ", (time_end-time_start) / (count_rate/1000), "ms."

contains

recursive subroutine solve (row, leftdiag, rightdiag)
  implicit none
  integer, intent(in) :: row, leftdiag, rightdiag
  integer :: position, p

  if (row == size_mask) then
    nrOfSolutions = nrOfSolutions + 1
  else
    position = iand(size_mask, inot(ior(row, ior(leftdiag,rightdiag))))
    do while (position /= 0)
      p = iand(position,-position)
      position = position - p
      call solve (row+p, ishft(leftdiag+p,1), ishft(rightdiag+p,-1))
    end do
  end if
end subroutine solve

end program NQueens