void hist2ds(int*nx,int*ny,int*m,double*x,double*y,
             double*xmin,double*xmax,double*ymin,double*ymax,
             double*bordx,double*bordy,int**icount)
{
/*
c
c This subroutine calculates number of occurencies in 2d array
c 2D HISTOGRAM
c Slow version algorithm
c
c 'nx' -- input; number of intervals in x dirextion
c 'ny' -- input; number of intervals in y direction
c 'm'  -- input; number of input data points
c 'x'  -- input; x-axis data points
c 'y'  -- input; y-axis data points
c WARNING: It is not supposes data points are sorted in 'x' - array
c 'xmin' -- output; minimal x-value; xmin = x(1)
c 'xmax' -- output; maximal x-value; xmax = x(m)
c 'ymin' -- output; minimal y-value
c 'ymax' -- output; maximal y-value
c 'bordx' -- output; array of x-mid-interval values
c 'bordy' -- output; array of y-mid-interval values
c 'icount' -- output; 2D array: histogram data
c
*/
      double hx,hy,hx2,hy2,brdx
      int i, j, k, ix, iy
      for (i=0;i<*nx;i++) for (j=0;j<*ny;j++) icount[i][j]=0;
      *xmin=x[1]
      *xmax=x[1]
      *ymin=y[1]
      *ymax=y[1]
      for (i=0;i<*m;i++)
      {
         if (*xmin > x[i]) *xmin=x[i]
         if (*xmax < x[i]) *xmax=x[i]
         if (*ymin > y[i]) *ymin=y[i]
         if (*ymax < y[i]) *ymax=y[i]
      }
      hx = (*xmax-*xmin)/(*nx)
      hy = (*ymax-*ymin)/(*ny)
      hx2 = 0.5*hx
      hy2 = 0.5*hy
      bordx[1] = *xmin+hx2
      bordy[1] = *ymin+hy2
      for (i=0;i<*nx;i++) bordx[i] = bordx[i-1] + hx
      for (i=0;i<*ny;i++) bordy[i] = bordy[i-1] + hy
      
      for (j=0;j<*m;j++) for (ix=0;ix<*nx;ix++) for (iy=0;iy<*ny;iy++)
        if ((bordx[ix]-hx2)<=x[j] && (bordx[ix]+hx2)>x[j] && (bordy[iy]-hy2)<=y[j] && (bordy[iy]+hy2)>y[j])
            icount(ix,iy)++;
}
