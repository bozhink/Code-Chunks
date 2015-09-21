//Virasoro anomaly-like functions

function z=VirAn(A1,A2,x,n)
    //A1 and A2 must be detrmining functions: A=A(x)
    m=max(size(x));
    for j=1:m
        z(1,j)=A1(x(j));
        z(2,j)=A2(x(j));
    end
    for i=2:n-1
        b=(i+2)/(i-1);
        c=-(2*i+1)/(i-1);
        ii=i+1;
        for j=1:m
            z(ii,j)=b*z(i,j)+c*z(1,j);
        end
    end
endfunction
