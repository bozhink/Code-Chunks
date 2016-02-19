double det(double **a,int n)
{
   int i, j, j1, j2, s;
   double d;
   double **b = NULL;

   if (n < 1) return 0.0;
   else if (n == 1) return a[0][0];
   else if (n == 2) return a[0][0] * a[1][1] - a[1][0] * a[0][1];
   else {
      det = 0;
      for (j1=0;j1<n;j1++)
      {
         b = malloc( (n-1)*sizeof(double *) );
         for (i=0; i<n-1;i ++) b[i] = malloc( (n-1)*sizeof(double) );
         for (i=1; i<n; i++) {
            j2 = 0;
            for (j=0; j<n; j++) {
               if (j == j1) continue;
               b[i-1][j2] = a[i][j];
               j2++;
            }
         }
         if(j1%2 == 0) s = 1; else s = -1;
         d += ((double) s) * a[0][j1] * det(m,n-1);
         for (i=0;i<n-1;i++) free(m[i]);
         free(m);
      }
   }
   return d;
}

