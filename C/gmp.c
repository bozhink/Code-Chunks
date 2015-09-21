#include <stdio.h>
#include <stdlib.h>

#include <gmp.h>

void foo(mpz_t result, const mpz_t param, unsigned long n)
{
   unsigned long i;
   mpz_mul_ui(result, param, n);
   for (i=1; i<n; i++)
      mpz_add_ui ( result, result, i*7);
}

int main (int argc, char**argv)
{
   /* nteger data */
   mpz_t sum;
   struct foo {mpz_t x, y;};
   mpz_t vec[20];
   /* Rational number */
   mpq_t quotient;
   /* Floating point number */
   mpf_t fp;
   
   mpz_t r, n;
   mpz_init (r);
   mpz_init_set_str (n, "123456", 0);
   foo (r, n, 200L);
   gmp_printf("%Zd\n",r);
   return 0;
}

