; IDEPlugInAsActiveX.def : Declares the module parameters.

LIBRARY      "IDEPlugInAsActiveX.DLL"

EXPORTS
	DllCanUnloadNow     @1 PRIVATE
	DllGetClassObject   @2 PRIVATE
	DllRegisterServer   @3 PRIVATE
	DllUnregisterServer	@4 PRIVATE
