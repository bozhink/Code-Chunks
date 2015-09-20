* DLLSAMP.DLL
*
* Comilation & link: wfc386 -bd dllsamp.for
*
* Before we can link aour example, we must create a linker directive
* file that describes the attributes and entry points of our dynamic
* link library. The following is a linker directive file, called
* dllsamp.lnk, that can be used to create the dynamic link library.
*
* system nt_dll initinstance terminstance
* export DLL_ENTRY_1
* export DLL_ENTRY_2
* file dllsamp
*
* We can now create our dynamic link library by issuing the following command.
*
* wlink @dllsamp
*
* Let us create an import library for our DLL. We do this by issuing 
* the following command
*
* wlib dllsamp +dllsamp.dll
*
* Suppose the following sample program, contained in the file dlltest.for,
* calls the function from our sample dynamic link library

* * DLLTEST.FOR
* *
*        call dll_entry_1()
*        call dll_entry_2()
*        end
*
* We can compile and link our sample application by issuing
* the following command.
*
* wfl386 -l=nt dlltest dllsamp.lib
*
*
* If we had created a linker directive file of "IMPORT" directives
* instead of an import library for the dynamic library, the linker
* directive file, say dllimps.lnk, would be as follows.
*
* import DLL_ENTRY_1 dllsamp
* import DLL_ENTRY_2 dllsamp
*
* To compile & link or sample applicationq we would issue the
* following comman.
*
* wfl386 -l=nt dlltest -"@dllimps"
*
      integer function __fdll_initialize_()
*     Called from LibMain during "DLL PROCESS ATTACH"
*
*     do process initialization
      print *, 'Hi from process attach'
*
*     returning 0 indicates failure
      __fdll_initialize_ = 1
      return
      end
      
      integer function __fthrd_initialize_()
*     Called from LibMain during "DLL THREAD ATTACH"
*
*     do thread initialization
      print *, 'Hi from thread attach'
*
*     returning 0 indicates failure
      __fthrd_initialize_ = 1
      return
      end
      
      integer function __fthrd_terminate_()
*     Called from LibMain during "DLL THREAD DETACH"
*
*     do thread cleanup
      print *, 'Hi from thread detach'
*
*     returning 0 indicates failure
      __fthrd_terminate_ = 1
      return
      end
      
      integer function __fdll_terminate_()
*     Called from LibMain during "DLL PROCESS DETACH"
*
*     do process cleanup
      print *, 'Hi from process detach'
*
*     returning 0 indicates failure
      __fdll_terminate_ = 1
      return
      end
      
      subroutine dll_entry_1()
      print *, 'Hi from dll entry #1'
      end
      
      subroutine dll_entry_2()
      print *, 'Hi from dll entry #2'
      end
