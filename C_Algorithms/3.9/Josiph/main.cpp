#include <stdlib.h>
#include <stdio.h>

typedef struct node* link;
struct node { int item; link next; } ;

int main (int argc, char*argv[])
{
  int i, N = atoi(argv[1]), M = atoi(argv[2]);
  link t = (link) malloc (sizeof (*t)), x, tmp;
  t->item = 1;
  t->next = t;
  x = t;
  for (i=2; i<=N; i++)
  {
    x = (x->next = (link) malloc (sizeof (*x)));
    x->item = i;
    x->next = t;
  }
  while (x != x->next)
  {
    for (i=1; i<M; i++) x = x->next;
    tmp = x->next;
    x->next = x->next->next;
    free(tmp);
    N--;
  }
  printf("%d\n", x->item);
  free(x);
  free(t);
  return 0;
}

