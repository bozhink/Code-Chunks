#include <stdio.h>
#include <stdlib.h>
#include "./inc/item.h"
#include "./inc/link.h"

main(int argc, char *argv[])
{
	FILE *fp = fopen(argv[1],"r");
	int i=0;
	link p, h, t;
	h = NULL;
	p = malloc(sizeof *p); p->next=NULL;
	t = malloc(sizeof *t);
	while (!feof(fp))
	{
		fscanf(fp, "%s",    p->item.rect);
		fscanf(fp, "%lf", &(p->item.decl));
		fscanf(fp, "%s",    p->item.name);
		fscanf(fp, "%lf", &(p->item.j));
		fscanf(fp, "%lf", &(p->item.dj));
		fscanf(fp, "%lf", &(p->item.h));
		fscanf(fp, "%lf", &(p->item.dh));
		fscanf(fp, "%lf", &(p->item.k));
		fscanf(fp, "%lf", &(p->item.dk));
		fscanf(fp, "%d",  &(p->item.status));

		if (i==0) { h = p; i=1; }
		p = (p->next = malloc(sizeof *p));
		p->next = NULL;
	}
	
	for (p = h; p != NULL; p = p->next)
	{
		printf("%s\n",  p->item.rect);
		
	}
	
	for (p = h; p != NULL; p = p->next)
	{
		t = p->next;
		p->next = p->next->next;
		free(t);
	}
	free(h);
	//free(t);
	free(p);
	fclose(fp);
	return 0;
}

