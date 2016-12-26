program Quaternions
  use Quaternions_module
  type(quaternion) :: u, v
  u=quaternion(1,2,3,4)
  v=quaternion(5,6,7,8)
  call quaternion_print(u+v)
  print *, 3+4
  print *
  call quaternion_print(u-v)
  print *, 3-4
  print *
  call quaternion_print(3.0*u)
  call quaternion_print(u*v)
  print *, 3*4
  print *
  call quaternion_print(conjg(u))
  print *, conjg((3,4))
  print *
  print *, (abs(u))
  print *, abs((3,4))
end program Quaternions
