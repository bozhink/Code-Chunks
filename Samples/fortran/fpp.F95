! fpp -DX fpp.F95

! F -DX fpp.F95

! F fpp.F95

program p

#if defined(X)
print *, 1.1
#else
print *, 2.2
#endif

#define FF 5
print *, FF.FF
#if FF!=5
print *, "YES"
#else
print *, "NO"
#endif

#if .TRUE. .EQV. .TRUE.
print *, "eqv"
#endif

#if .NOT. (.TRUE. .NEQV. .TRUE.)
print *, "neqv"
#endif

end program p
