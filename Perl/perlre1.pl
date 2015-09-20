#!/usr/bin/perl
$_      = "!!!!";
$char   = "!";
$insert = "AAA";

s{
    ($char)             # look for the specified character.

    (?=$char)           # look for it again, but don't include
                        # it the matched string, so the next
}                       # search will also find it.
{
    $char . $insert     # concatenate the specified character
                        # with the string to insert.

}xeg;                   # use extended mode, evaluate the
                        # replacement pattern, and match all
                        # possible strings.

print("$_\n");

