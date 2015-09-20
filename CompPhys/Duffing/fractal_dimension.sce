function [z]=Nb(x,y,x0,x1,y0,y1,b)
    n=max(size(x));
    nx=abs(int((x1-x0)/b))+1;
    ny=abs(int((y1-y0)/b))+1;
    for ix=1:nx
        for iy=1:ny
            imatrix(ix,iy)=0;
        end
    end
    b2=b*0.5;
    for i=1:n
        for ix=1:nx
            for iy=1:ny
                xpoint = x0+(2*ix-1)*b2;
                ypoint = y0+(2*iy-1)*b2;
                if (x(i)>xpoint-b2) & (x(i)<xpoint+b2) & (y(i)>ypoint-b2) & (y(i)<ypoint+b2) then
                    imatrix(ix,iy)=1;
                end
            end
        end
    end
    z=sum(imatrix);
endfunction

function [z]=SortedNb(x,y,x0,x1,y0,y1,b)
    n=max(size(x));
    nx=abs(int((x1-x0)/b))+1;
    ny=abs(int((y1-y0)/b))+1;
    [X,k]=gsort(x);
    Y=y(k);
    imatrix=[];
    k=1;
    ibounds(k)=1;
    xpoint=x0;
    for j=1:n
        for i=ibounds(k)+1:n
            if X(i)>xpoint+b then
                k=k+1;
                ibounds(k)=i;
                xpoint=xpoint+b;
                break;
            end
        end
    end
    z=ibounds;
endfunction