      PROGRAM HELLO
      INTEGER ID, NTHR
      INTEGER OMP_GET_THREAD_NUM, OMP_GET_NUM_THREADS
C$OMP PARALLEL PRIVATE(ID)
      ID = OMP_GET_THREAD_NUM()
      PRINT*,'HELLO WORLD FROM THREAD ', ID
C$OMP BARRIER
      IF (ID.EQ.0) THEN
         NTHR = OMP_GET_NUM_THREADS()
         PRINT*,'THERE ARE ',NTHR, ' THREADS'
      ENDIF
C$OMP END PARALLEL
      STOP
      END
