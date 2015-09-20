#include <stdio.h>
#include <stdlib.h>
#include "sys.h"

main()
{
    unsigned StatusAddress=0x379;
    int StatusPort;
    StatusPort = inp(StatusAddress);
    printf("Satus port = %Xh\n",StatusPort);
}
