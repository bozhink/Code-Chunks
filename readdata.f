      subroutine raddata(ldx,n,x,ierr)
*
* Reads data from STDIN in matrix x
*
* 'ldx' -- input; leading dimension of x
* 'n'   -- input; secondary dimension of x
* 'x'   -- output; array in wich readed data is stored
* 'ierr' -- output; error flag
*
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(ldx,n)
      ierr=0
*
      do i=1,lda
      k=i
      read(unit=*,fmt=*,iostat=ierr,err=10) (x(i,j),j=1,n)
      enddo
*
      return
   10 write(unit=0,fmt=*,err=100)
     * "ERROR in readdata: Invalid data at row: ",k
      return
  100 print*,"ERROR: Cannot write to STDERR"
      stop "Cannot write to STDERR"
      end
