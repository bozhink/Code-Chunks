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
! Demonstrates functions that are not able to be vectorized.
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

subroutine flow_dependence(y)
  implicit none
  integer :: i
  real, dimension(10), intent(inout) :: y
  ! Flow dependency y accesses.
  do i=2,10
    y(i) = y(i-1) + 1 
  end do
end subroutine flow_dependence

subroutine short_trip_count(y)
  implicit none
  integer :: i
  real, dimension(5), intent(inout) :: y
  ! Not enough work here to bother vectorizing.
  do i=1,5
    y(i) = y(i) + i
  end do
end subroutine short_trip_count
