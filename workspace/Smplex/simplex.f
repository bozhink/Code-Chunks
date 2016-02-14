      SUBROUTINE SIR(A,M,N,IBASIS)
      IMPLICIT NONE
C
C     SUBROUTINE SET INDEX ROW
C
C     STRUCTURE OF MATRIX A
C     +----+---+
C     | 0  | C | C  -- 1xN ROW VECTOR
C     +----+---+ A0 -- Mx1 COLUMN VECTOR
C     | A0 | A | A  -- MxN MATRIX
C     +----+---+ DELTA -- 1xN+1 INDEX ROW
C     | DELTA  |
C     +--------+
C
C     Z = C.x
C     A.X = A0
C
      INTEGER M,N
      INTEGER IBASIS(1:N)
      DOUBLE PRECISION A(0:M+1,0:N)
      INTEGER I,J,MP1
      MP1=M+1
      DO J=0,N
      A(MP1,J)=-A(0,J)
      DO I=1,M
      A(MP1,J)=A(MP1,J)+A(I,J)*A(0,IBASIS(I))
      ENDDO
      ENDDO
      RETURN
      END

      SUBROUTINE GKC(A,M,N,KC,FLAG)
      IMPLICIT NONE
C     SUBROUTINE GET KEY COLUMN
C
C     STRUCTURE OF MATRIX A
C     +----+---+
C     | 0  | C | C  -- 1xN ROW VECTOR
C     +----+---+ A0 -- Mx1 COLUMN VECTOR
C     | A0 | A | A  -- MxN MATRIX
C     +----+---+ DELTA -- 1xN+1 INDEX ROW
C     | DELTA  |
C     +--------+
C
C     Z = C.x
C     A.X = A0
C
      INTEGER M,N,KC
      DOUBLE PRECISION A(0:M+1,0:N)
      CHARACTER*3 FLAG
      INTEGER J,MP1
      DOUBLE PRECISION ZERO
      PARAMETER (ZERO=1.0D-290)
      KC=1
      MP1=M+1
      IF (FLAG.EQ.'MIN') THEN
         DO J=1,N
            IF (A(MP1,J).GT.A(MP1,KC)) KC=J
         ENDDO
         IF (A(MP1,KC).GT.0.D0) THEN
            RETURN
         ELSE
            KC=0
            RETURN
         ENDIF
      ELSEIF (FLAG.EQ.'MAX') THEN
         DO J=1,N
            IF (A(MP1,J).LT.A(MP1,KC)) KC=J
         ENDDO
         IF (A(MP1,KC).LT.0.D0) THEN
            RETURN
         ELSE
            KC=0
            RETURN
         ENDIF
      ELSE
         PRINT*,'GKC: ERROR INVALID FLAG: IT MUST BE "MAX" OR "MIN"'
         KC=0
         RETURN
      ENDIF
      END

      SUBROUTINE GKR(A,M,N,KC,KR)
      IMPLICIT NONE
C     SUBROUTINE GET KEY COLUMN
C
C     STRUCTURE OF MATRIX A
C     +----+---+
C     | 0  | C | C  -- 1xN ROW VECTOR
C     +----+---+ A0 -- Mx1 COLUMN VECTOR
C     | A0 | A | A  -- MxN MATRIX
C     +----+---+ DELTA -- 1xN+1 INDEX ROW
C     | DELTA  |
C     +--------+
C
C     Z = C.x
C     A.X = A0
C
      INTEGER M,N,KC,KR
      DOUBLE PRECISION A(0:M+1,0:N)
      INTEGER I,MP1,K
      MP1=M+1
      KR=0
      K=1
      DO WHILE(KR.EQ.0.AND.K.LE.M)
         IF (A(K,KC).GT.0.D0) KR=K
         K=K+1
      ENDDO
      IF (KR.EQ.0) THEN
         PRINT*,"GKR: ERROR: CANNOT FIND KEY ROW"
         RETURN
      ENDIF
      DO I=K+1,M
         IF (A(I,KC).GT.0.D0) THEN
            IF ((A(I,0)/A(I,KC)).LT.(A(KR,0)/A(KR,KC))) KR=I
         ENDIF
      ENDDO
      RETURN
      END

      SUBROUTINE UDB(IBASIS,KR,KC)
      IMPLICIT NONE
C     SUBROUTINE UPDATE BASIS
      INTEGER KR,KC,IBASIS(*)
      IBASIS(KR)=KC
      RETURN
      END

      SUBROUTINE GMR(A,M,N,KR,KC,MR)
      IMPLICIT NONE
C     SUBROUTINE GET MAIN ROW
C
C     STRUCTURE OF MATRIX A
C     +----+---+
C     | 0  | C | C  -- 1xN ROW VECTOR
C     +----+---+ A0 -- Mx1 COLUMN VECTOR
C     | A0 | A | A  -- MxN MATRIX
C     +----+---+ DELTA -- 1xN+1 INDEX ROW
C     | DELTA  |
C     +--------+
C
C     Z = C.x
C     A.X = A0
C
      INTEGER M,N,KR,KC
      DOUBLE PRECISION A(0:M+1,0:N),MR(0:N)
      INTEGER J
      DO J=0,N
         MR(J)=A(KR,J)/A(KR,KC)
      ENDDO
      RETURN
      END

      SUBROUTINE UDT(A,MR,M,N,KR,KC)
      IMPLICIT NONE
C     SUBROUTINE UPDATE TABLE
C
C     STRUCTURE OF MATRIX A
C     +----+---+
C     | 0  | C | C  -- 1xN ROW VECTOR
C     +----+---+ A0 -- Mx1 COLUMN VECTOR
C     | A0 | A | A  -- MxN MATRIX
C     +----+---+ DELTA -- 1xN+1 INDEX ROW
C     | DELTA  |
C     +--------+
C
C     Z = C.x
C     A.X = A0
C
      INTEGER M,N,KR,KC
      DOUBLE PRECISION A(0:M+1,0:N),MR(0:N),DKC
      INTEGER I,J
      DO I=1,M+1
      DKC=A(I,KC)
      DO J=0,N
      A(I,J)=A(I,J)-MR(J)*DKC
      ENDDO
      ENDDO
      DO J=0,N
      A(KR,J)=MR(J)
      ENDDO
      RETURN
      END

      SUBROUTINE SRETURN(A,IBASIS,M,N,Z,X)
      IMPLICIT NONE
C     SUBROUTINE SIMPLEX RETURN
C
C     STRUCTURE OF MATRIX A
C     +----+---+
C     | 0  | C | C  -- 1xN ROW VECTOR
C     +----+---+ A0 -- Mx1 COLUMN VECTOR
C     | A0 | A | A  -- MxN MATRIX
C     +----+---+ DELTA -- 1xN+1 INDEX ROW
C     | DELTA  |
C     +--------+
C
C     Z = C.x
C     A.X = A0
C
      INTEGER M,N
      INTEGER IBASIS(1:M)
      DOUBLE PRECISION A(0:M+1,0:N),X(1:N),Z
      INTEGER I,J
      DO J=1,N
        X(J)=0.D0
      ENDDO
      Z=A(M+1,0)
      DO I=1,M
         X(IBASIS(I))=A(I,0)
      ENDDO
      RETURN
      END

      SUBROUTINE SSTEP(A,IBASIS,M,N,KR,KC,FLAG)
      IMPLICIT NONE
C     SUBROUTINE SIMPLEX STEP
C
C     STRUCTURE OF MATRIX A
C     +----+---+
C     | 0  | C | C  -- 1xN ROW VECTOR
C     +----+---+ A0 -- Mx1 COLUMN VECTOR
C     | A0 | A | A  -- MxN MATRIX
C     +----+---+ DELTA -- 1xN+1 INDEX ROW
C     | DELTA  |
C     +--------+
C
C     Z = C.x
C     A.X = A0
C
      CHARACTER*3 FLAG
      INTEGER M,N,KR,KC
      INTEGER IBASIS(1:M)
      DOUBLE PRECISION A(0:M+1,0:N)
      DOUBLE PRECISION MR(0:N)
      KR=1
      CALL GKC(A,M,N,KC,FLAG)
      IF (KC.EQ.0) RETURN
      CALL GKR(A,M,N,KC,KR)
      CALL UDB(IBASIS,KR,KC)
      CALL GMR(A,M,N,KR,KC,MR)
      CALL UDT(A,MR,M,N,KR,KC)
      RETURN
      END

      SUBROUTINE SIMPLEX(AA,A0,C,IBASIS,M,N,Z,X,FLAG)
      IMPLICIT NONE
      INTEGER M,N
      INTEGER IBASIS(1:M)
      CHARACTER*3 FLAG
      DOUBLE PRECISION AA(1:M,1:N)
      DOUBLE PRECISION A0(1:M)
      DOUBLE PRECISION C(1:N)
      DOUBLE PRECISION Z, X(1:N)
      DOUBLE PRECISION A(0:M+1,0:N)
      INTEGER I,J,MP1,ITMAX,ITER
      INTEGER KR,KC
      PARAMETER(ITMAX=100)
      MP1=M+1
      A(0,0)=0.D0
      DO J=1,N
         A(0,J)=C(J)
      ENDDO
      DO I=1,M
         A(I,0)=A0(I)
      ENDDO
      DO I=1,M
      DO J=1,N
         A(I,J)=AA(I,J)
      ENDDO
      ENDDO
      DO J=0,N
        A(MP1,J)=0.D0
      ENDDO
      CALL SIR(A,M,N,IBASIS)

*      print*,'xxxxxxxxxxxxxxxxxxxxxxxxx'
*      do i=0,m+1
*      print "(6(f8.2,1x))",(A(i,j),j=0,n)
*      enddo
C
      DO ITER=1,ITMAX
         CALL SSTEP(A,IBASIS,M,N,KR,KC,FLAG)

*      print*,'xxxxxxxxxxxxxxxxxxxxxxxxx'
*      do i=0,m+1
*      print "(5(f8.2,1x))",(A(i,j),j=0,n)
*      enddo
*      print*,'kr kc',kr,kc

         IF (KC.EQ.0) THEN
            CALL SRETURN(A,IBASIS,M,N,Z,X)
            RETURN
         ENDIF
      ENDDO
C
      PRINT*,'SIMPLEX EXCEEDED MAXIMUM ITERATIONS'
      Z=0.D0
      DO J=1,N
         X(J)=0.D0
      ENDDO
      RETURN
      END
