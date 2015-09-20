# Using explicit run-time linking
import ctypes

myDll = ctypes.cdll.LoadLibrary("Example.dll")

# The following "restype" method specification is needed to make
# Python understand what type is returned by the function.
myDll.AddNumbers.restype = ctypes.c_double

p = myDll.AddNumbers(ctypes.c_double(1.0), ctypes.c_double(2.0))

print "The result was: ", p
