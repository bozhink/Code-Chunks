nx = 10;
ny = 10;

A = int(4*rand(nx,ny));

rect = [];

hx = 1;
hy = 1;
colors = [];
for i = 0:nx-1
    for j = 0:ny-1
        indx = i*nx + j + 1;
        rect(indx, 1) = i*hx;
        rect(indx, 2) = j*hy;
        rect(indx, 3) = hx;
        rect(indx, 4) = hy;
        colors(indx) = A(i+1,j+1)+1;
    end
end

clf();
g = gca();
g.data_bounds=[0,0;10,10];
xrects(rect',colors);