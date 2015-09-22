funcprot(0);
p = 0.2;
N = 200;
global chain;// = zeros(1,N);
chain = int(2*rand(1,N));

function UpdateStep(i,j,p)
    global chain;
    if chain(i)>0 & chain(j)==0 & rand()<p then
        chain(i)=0;
        chain(j)=1;
    end
endfunction

function UpdateBackwardSequental(N,p)
    global chain;
    UpdateStep(N,1,p);
    for i=N-1:-1:1
        UpdateStep(i,i+1,p);
    end
endfunction

evolution = zeros(N,N);
evolution(1,1:N) = chain(1:N);
for i = 2:N
    UpdateBackwardSequental(N,p);
    evolution(i,1:N) = chain(1:N);
end

