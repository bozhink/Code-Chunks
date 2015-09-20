c strip.for
c Reads in a FORTRAN code and deletes all comments
c starting with the non-fortran-77 standart delimiter: "!";
c also deletes all blank lines
c
      character*80 line
      character*80 infile,outfil
      character*80 answer,first
      logical exst,opn,found
      integer space
      integer term,ounit,iunit
      integer i,ascii,nonblk
c
      excl=ichar('!')
      space=ichar(' ')
c
c units for keyboard, INFILE and OUTFIL (change these if necessary)
      term=5
      iunit=10
      ounit=20
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
   10 continue
c
c get name of input file and open file
c
      print*,'Enter name of FORTRAN program'
      read (term,60) infile
c
   20 inquire(file=infile,exist=exst,opened=opn)
         if (exst.eqv..false.) then
            print*,'File does not exist'
            print*,'Enter naother name'
            read(term,60) infile
         elseif (opn.eqv..false.) then
            open (unit=iunit,file=infile,status='old')
            opn=.true.
         endif
      if (opn.eqv..false.) goto 20
c
c get name of output file and open
c
      print*,'Enter name of new file'
      read (term,60) outfil
c
c this line is for a VAX only
c      open(unit=ounit,file=outfil,status='new',carriagecontrol='list')
c this line is for any other machine
      open (unit=ounit,file=outfil,status='new')
c
c read each line of input file and search for "!"
   35 read (iunit,60,end=50) line
         found=.false.
         i=0
         nonblk=0
   45    if ((found.eqv..false.).and.(i.lt.80)) then
            i=i+1
            ascii=ichar(line(i:i))
            if (ascii.eq.exclm) then
               found=.true.
            elseif (ascii.ne.space) then
               nonblk=i
            endif
         goto 45
         endif
c
c        print up to last nonblank character, exclude "!"
         if (nonblk.gt.0) write(ounit,60) line(1:nonblk)
c
      goto 35
   50 continue
c
      close(unit=ounit)
      close(unit=iunit)
c
c allow for another file
      print*,'Do you wish to standardize another file? [Y]'
      read (term,60) answer
c
      first=answer(1:1)
      if ((first.eq.'N').or.(first.eq.'n')) stop
c
      goto 10
c
   60 format(a)
      end
