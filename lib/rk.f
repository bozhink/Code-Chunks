      subroutine rk4s(t0,x0,t,x,h,func)
c Runge-Kutta 4 -step
c func = f(t,x)
      implicit double precision(a-h,o-z),integer(i-n)
      external func
      dimension a(4),dk(4)
      a(1)=1.d0/6.d0
      a(2)=2.d0/6.d0
      a(3)=2.d0/6.d0
      a(4)=1.d0/6.d0

      hh=0.5d0*h
      dk(1) = func( t0, x0 )
      dk(2) = func( t0 + hh, x0 + hh*dk(1) )
      dk(3) = func( t0 + hh, x0 + hh*dk(2) )
      dk(4) = func( t0 + h, x0 + h*dk(3) )

      s=0.d0
      do i=1,4
         s = s + dk(i)*a(i)
      enddo
      x = x0 + h*s

      return
      end

      SUBROUTINE RK4F0(IDIMV,T0,X0,H,N,FIELD,T,X)
C RUNGA-KUTTA 4-ORDER METHOD, FULL VERSION, TYPE 0
C IDIMV - INPUT; DIMENSION OF VECTOR FIELD
C T0 - INPUT; INITIAL TIME MOMENT
C X0 - INPUT; INITIAL COORDINATES
C H  - INPUT; TIME STEP
C N  - INPUT; NUMBER OF REQUIRED POINTS
C FIELD - EXTERNAL; SUBROUTINE FIELD(IDIMV, T, X, RESULT)
C T - OUTPUT; RETURNED MOMENTS
C X - OUTPUT; RETURNED COORDINATES
      IMPLICIT NONE
      INTEGER IDIMV, N
      DOUBLE PRECISION T0, X0(IDIMV), H
      DOUBLE PRECISION T(N), X(N,IDIMV)
      EXTERNAL FIELD
      DOUBLE PRECISION K1(IDIMV), K2(IDIMV), K3(IDIMV), K4(IDIMV)
      INTEGER K, KP1
      DOUBLE PRECISION H2
C INITIALIZATION
      T(1) = T0
      X(1,:) = X0(:)
      H2 = 0.5D0*H
C
      DO K = 1, N-1
         KP1=K+1
         T(KP1) = T(K) + H
         CALL FIELD(IDIMV, T(K)   , X(K,:)      , K1)
         CALL FIELD(IDIMV, T(K)+H2, X(K,:)+H2*K1, K2)
         CALL FIELD(IDIMV, T(K)+H2, X(K,:)+H2*K2, K3)
         CALL FIELD(IDIMV, T(KP1) , X(K,:)+H*K3 , K4)
         X(KP1,:) = X(K,:) + H*(K1+2.D0*(K2+K3)+K4)/6.D0
      ENDDO
C
      RETURN
      END

      SUBROUTINE RK4F1(IDIMV,T0,X0,H,N,FIELD,T,X)
C RUNGA-KUTTA 4-ORDER METHOD, FULL VERSION, TYPE 1
C IDIMV - INPUT; DIMENSION OF VECTOR FIELD
C T0 - INPUT; INITIAL TIME MOMENT
C X0 - INPUT; INITIAL COORDINATES
C H  - INPUT; TIME STEP
C N  - INPUT; NUMBER OF REQUIRED POINTS
C FIELD - EXTERNAL; SUBROUTINE FIELD(IDIMV, T, X, RESULT)
C T - OUTPUT; RETURNED MOMENTS
C X - OUTPUT; RETURNED COORDINATES
      IMPLICIT NONE
      INTEGER IDIMV, N
      DOUBLE PRECISION T0, X0(IDIMV), H
      DOUBLE PRECISION T(N), X(N,IDIMV)
      EXTERNAL FIELD
      DOUBLE PRECISION K1(IDIMV), K2(IDIMV), K3(IDIMV), K4(IDIMV)
      INTEGER K, KP1
      DOUBLE PRECISION H3, H1
C INITIALIZATION
      T(1) = T0
      X(1,:) = X0(:)
      H1 = H/1.5D0
      H3 = H/3.0D0
C
      DO K = 1, N-1
         KP1=K+1
         T(KP1) = T(K) + H
         CALL FIELD(IDIMV, T(K)   , X(K,:)             , K1)
         CALL FIELD(IDIMV, T(K)+H3, X(K,:)+H3*K1       , K2)
         CALL FIELD(IDIMV, T(K)+H1, X(K,:)+H3*(K1+K2)  , K3)
         CALL FIELD(IDIMV, T(KP1) , X(K,:)+H*(K1-K2+K3), K4)
         X(KP1,:) = X(K,:) + H*(K1+3.D0*(K2+K3)+K4)/8.D0
      ENDDO
C
      RETURN
      END

