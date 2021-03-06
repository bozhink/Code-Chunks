      subroutine fproto(t,x,a,res,ierr)
c This subroutine provides suitable proto for fields
      implicit double precision(a-h,o-z),integer(i-n)
      external fields
      dimension x(12),a(6),res(12)
      dimension r1(3),r2(3),v1(3),v2(3),a1(3),a2(3)
      dimension field1(3),field2(3)
      r1(1)=x(1)
      r1(2)=x(2)
      r1(3)=x(3)
      r2(1)=x(4)
      r2(2)=x(5)
      r2(3)=x(6)
      v1(1)=x(7)
      v1(2)=x(8)
      v1(3)=x(9)
      v2(1)=x(10)
      v2(2)=x(11)
      v2(3)=x(12)
      call fields(r1,r2,v1,v2,a1,a2,field1,field2,ierr)
      res(1)=v1(1)
      res(2)=v1(2)
      res(3)=v1(3)
      res(4)=v2(1)
      res(5)=v2(2)
      res(6)=v2(3)
      res(7)=field1(1)
      res(8)=field1(2)
      res(9)=field1(3)
      res(10)=field2(1)
      res(11)=field2(2)
      res(12)=field2(3)
      return
      end
