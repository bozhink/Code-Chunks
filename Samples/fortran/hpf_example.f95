! Compile with -hpf option

program p
use hpf_library
print *, sum_prefix((/2,4,3,9/))
end program p
