funcprot(0);
N=256;
A=int(4*rand(N,N));
//A=2*ones(N,N);

function z=btwUpdate(n,x)
    zc=4; // Threshold value
    zz=zeros(n+2,n+2);
    zz(2:n+1,2:n+1)=x;
    zz(n/2+1,n/2+1) = zz(n/2+1,n/2+1)+1;
    toppled=%T;
    while toppled
        toppled=%F;
        for i=2:n+1
            for j=2:n+1
                if zz(i,j)>=zc then
                    zz(i,j) = zz(i,j)-zc;
                    zz(i-1,j) = zz(i-1,j)+1;
                    zz(i+1,j) = zz(i+1,j)+1;
                    zz(i,j-1) = zz(i,j-1)+1;
                    zz(i,j+1) = zz(i,j+1)+1;
                    toppled=%T;
                end
            end
        end
    end
    z=zz(2:n+1,2:n+1);
endfunction

function z=btwRun(n,niter,x)
    z=x;
    for j=1:niter
        z=btwUpdate(n,z);
    end
endfunction

X = btwRun(N,10000,A);
Y = fftshift(fft(X));
set(gcf(),"color_map",jetcolormap(128));
clf();
grayplot(0:255,0:255,abs(Y));
