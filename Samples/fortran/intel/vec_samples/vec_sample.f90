! Copyright (C) 2008 Intel Corporation. All Rights Reserved.
!
! The source code contained or described herein and all
! documents related to the source code ("Material") are owned by
! Intel Corporation or its suppliers or licensors. Title to the
! Material remains with Intel Corporation or its suppliers and
! licensors. The Material is protected by worldwide copyright
! laws and treaty provisions.  No part of the Material may be
! used, copied, reproduced, modified, published, uploaded,
! posted, transmitted, distributed,  or disclosed in any way
! except as expressly provided in the license provided with the
! Materials.  No license under any patent, copyright, trade
! secret or other intellectual property right is granted to or
! conferred upon you by disclosure or delivery of the Materials,
! either expressly, by implication, inducement, estoppel or
! otherwise, except as expressly provided in the license
! provided with the Materials.
!
! [DESCRIPTION]
! Demonstrates functions that are able to be vectorized,
! and generates only the object file.
!
! Note: This sample is not meant to generate an executable.
!
! [COMPILE]  
! Compile on IA-32 and Intel(R) 64 architectures only. 
! Use the following compiler options to compile: 
!
! Windows*: /c /QxSSSE3 /Qvec-report:3
!
! Linux* and Mac OS* X: -c -xSSSE3 -vec-report3
! 

subroutine vectorization_few_terms(a,b)
  implicit none
  integer, parameter :: NUM=10
  integer :: i
  real, dimension(NUM), intent(inout) :: a, b
  do i=1,NUM 
    a(i) = a(i) * b(i) 
  end do
end subroutine vectorization_few_terms

subroutine vectorization_many_terms(a,b)
  implicit none
  integer, parameter :: NUM=10
  integer :: i
  real, dimension(NUM), intent(inout) :: a, b
  do i=1,NUM 
    a(i) = 2 * a(i) * b(i) + sin(a(i))   
  end do
end subroutine vectorization_many_terms

subroutine inner_most_loop(a,b,c)
  implicit none
  integer, parameter :: NUM=10
  integer :: i, j, k
  real, intent(inout), dimension(NUM,NUM) :: a, b, c
  ! Outer loops don't vectorize -- try parallelizer.
  do i=1,NUM
    do k=1,NUM
      ! Inner-most loop is vectorized.
      do j=1,NUM
        c(j,i) = c(j,i) + a(j,k) * b(k,i)
      end do
    end do
  end do
end subroutine inner_most_loop

subroutine long_enough_trip_count(y)
  implicit none
  integer :: i
  real, dimension(100), intent(inout) :: y
  ! Not much work to do, but sufficiently long trip count.
  do i=1,100
    y(i) = y(i) + i
  end do
end subroutine long_enough_trip_count

function func(n)
  implicit none
  integer :: func, n
  func = n*n - 1 
end function func

subroutine top_test_determinable(y,n)
  implicit none
  integer, intent(in) :: n
  real, intent(inout) :: y(n)
  integer :: i, func
  ! Vectorized since termination condition hoisted
  ! for single evaluation.
  do i=1,func(n)
    y(i) = y(i) * 2.0 
  end do
end subroutine top_test_determinable

function withinborder(x,y,n)
  implicit none
  integer, intent(in) :: n
  real, intent(inout) :: x(n), y(n)
  real :: dist
  integer :: i, withinborder
  withinborder=0
  do i=1,n
    dist = sqrt(x(i)*x(i) + y(i)*y(i)) 
    if (dist<5) withinborder = withinborder+1
  end do
end function withinborder
