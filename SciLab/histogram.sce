funcprot(0);

function [hist,boundaries]=histogram(z,nbins)
    [m,n]=size(z);
    Z=gsort(z,'g','i');
    zmin=Z(1);
    zmax=Z(n*m);
    zh=(zmax-zmin)/nbins;
    boundaries(1)=zmin;
    for i=2:nbins+1
        boundaries(i)=boundaries(i-1)+zh;
    end
    hist=zeros(nbins,1);
    k=1;
    for i=1:m*n
        if Z(i)>boundaries(k+1) then
            k=k+1;
        end;
        hist(k)=hist(k)+1;
    end
endfunction

function [Z,indeces,boundaries]=histogram2d(z,nbins)
    indeces=zeros(2,nbins);
    boundaries=zeros(2,nbins+1);
    [m,n]=size(z);
    Z=z;
    if n<m then
        Z=z';
    end
    [m,n]=size(Z);
    if m<>2 then
        disp('ERROR: Input matrix must be of type 2xN');
        return;
    end
    Z=gsort(Z,'lc','i');
    xmin=Z(1,1);
    xmax=Z(1,n);
    xh=(xmax-xmin)/nbins;
    ymin=min(Z(2,:));
    ymax=max(Z(2,:));
    yh=(ymax-ymin)/nbins;
    boundaries(1,1)=xmin;
    boundaries(2,1)=ymin;
    for i=2:nbins+1
        boundaries(1,i)=boundaries(1,i-1)+xh;
        boundaries(2,i)=boundaries(2,i-1)+yh;
    end
    //indeces=Z;
    k=1;
    indeces(1,1)=1;
    for i=1:n
        if Z(1,i)>boundaries(1,k+1) then
            indeces(2,k)=i-1;
            indeces(1,k+1)=i;
            k=k+1;
        end
    end
    indeces(2,n)=n;
endfunction
