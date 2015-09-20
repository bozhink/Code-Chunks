/*
  Created: 10.05.09 21:37:53 by SecondAccount

  $Id: C\040Console.c,v 1.1.2.1 2003/08/13 00:38:46 neum Exp $
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>

void Usage(char *programName)
{
  fprintf(stderr, "%s usage:\n", programName);
  fprintf(stderr, "rundll [-hH?] <dll_name>\n");
  fprintf(stderr, "        -h  shows help message\n");
  fprintf(stderr, "        -H  shows help message\n");
  fprintf(stderr, "        -?  shows help message\n");
  fprintf(stderr, "       <dll_name> name of the library to be run\n");
}

int HandleOptions(int argc, char *argv[])
{
  int i, firstnonoption = 0;

  for (i = 1; i < argc; i++) {
    if (argv[i][0] == '/' || argv[i][0] == '-') {
      switch (argv[i][1]) {
        case '?':
          Usage(argv[0]);
          break;
        case 'h':
        case 'H':
          if (!stricmp(argv[i] + 1, "help")) {
            Usage(argv[0]);
            break;
          }
        default:
          fprintf(stderr, "unknown option %s\n", argv[i]);
          break;
      }
    }
    else {
      firstnonoption = i;
      break;
    }
  }
  return firstnonoption;
}

int main(int argc, char *argv[])
{
  if (argc == 1) {
    Usage(argv[0]);
    return 1;
  }
  int k = HandleOptions(argc, argv);
  if (!k==0){
    HINSTANCE hInst = LoadLibrary(TEXT(argv[k]));
    if (hInst == 0) {
      printf("ERROR: Unable to load \"%s\"",argv[k]);
      return 2;
    }
    FreeLibrary(hInst);
  }
  return 0;
}

