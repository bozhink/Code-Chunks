 use Win32::Registry;
 $| = 1;
 $key = "HARDWARE";
 $HKEY_LOCAL_MACHINE->Open($key, $nextKeyList);
 listKeys($nextKeyList);
 sub listKeys(){
    $count++;
    my ($keyList) = @_;
    my ($nextObj, @subKeys, $subKey);
    $keyList->GetKeys(\@subKeys);
    foreach $subKey (@subKeys){
       $tabString = "   " x $count;
       print "$tabString $subKey\n";
       $keyList->Open($subKey, $nextKeyList);
       listKeys($nextKeyList);
       $count--;
    }
    $keyList->Close();
 }