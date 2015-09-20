import ctypes
 
my_dll = ctypes.cdll.LoadLibrary("Example.dll")
 
# The following "restype" method specification is needed to make
# Python understand what type is returned by the function.
my_dll.AddNumbers.restype = ctypes.c_double
 
p = my_dll.AddNumbers(ctypes.c_double(1.0), ctypes.c_double(2.0))
 
print "The result was:", p