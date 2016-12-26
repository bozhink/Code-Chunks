! gcc -c csub.c
! F csub.o f_calls_c.f95
! ./a.out
! The value of i is 42
! The value of d is 4.200000
! The value of a[3] is 3.300000
! The value of s is abc
! The value of slen is 3
! The value of cr, ci is (1.100000, 2.200000)

program f_calls_c
   integer, parameter :: n = 42
   integer, parameter :: double = selected_real_kind(9)
   real(kind=double), pointer :: dp
   integer :: i
   real, dimension(0:9) :: ra = ( (/ (1.1*i, i=0,9) /) )
   character(len=3) :: s = "abc"
   complex :: c = (1.1, 2.2)

   allocate (dp)
   dp = 4.2_double
   call csub (n, dp, ra, s, c)
end program f_calls_c

! file csub.c:

! typedef struct { float r, i;} Complex;
! 
! void csub_ (i, d, a, s, c, slen)
! int *i;
! double *d;
! float a[];
! char *s;
! Complex *c;
! int slen;
! 
! {
! printf ("The value of i is %d\n", *i);
! printf ("The value of d is %f\n", *d);
! printf ("The value of a[3] is %f\n", a[3]);
! printf ("The value of s is %s\n", s);
! printf ("The value of slen is %d\n", slen);
! printf ("The value of c is (%f, %f)\n", c->r, c->i);
! }
