#include <stdlib.h>
#include <stdio.h>


typedef char* Item;
typedef struct node* link;
struct node { Item item; link next; };


int main(int argc, char**argv)
{
	Item line = NULL;
	size_t len = 0;
	ssize_t read;
	
	link p, h, t;
	h = NULL;
	p = malloc(sizeof *p); p->next=NULL;
	t = malloc(sizeof *t);
	
	while ((read = getline(&line, &len, stdin)) != -1)
	{
		p->item = line;
		p = (p->next = malloc(sizeof *p));
		p->next = NULL;
	}
	for ( ; p != NULL; p=p->next)
	{
		t=p->next;
		p->next=p->next->next;
		printf("%s", t->item);
		free(t);
	}
	return 0;
}

