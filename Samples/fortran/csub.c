typedef struct { float r, i;} Complex;

void csub_ (i, d, a, s, c, slen)
int *i;
double *d;
float a[];
char *s;
Complex *c;
int slen;

{
printf ("The value of i is %d\n", *i);
printf ("The value of d is %f\n", *d);
printf ("The value of a[3] is %f\n", a[3]);
printf ("The value of s is %s\n", s);
printf ("The value of slen is %d\n", slen);
printf ("The value of c is (%f, %f)\n", c->r, c->i);
}
