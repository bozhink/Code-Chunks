funcprot(0);
p = 0.5;
q = 1.0;
N = 200;
global chain;// = zeros(1,N);
global chain_old;
global current;
global icurrent;
chain = int(2*rand(1,N));
current = zeros(1,N);
icurrent = zeros(1,N);


function UpdateStep(i,j,p,q)
    global chain;
    global chain_old;
    global icurrent;
    prob = p;
    if chain_old(j)>0 then
        prob = q;
    end
    if chain(i)>0 & chain(j)==0 & rand()<prob then
        chain(j)=chain(i);
        chain(i)=0;
        chain_old(i)=chain(i);
        icurrent(j)=1;
    else
        icurrent(i)=1;
    end
endfunction

function UpdateBackwardSequental(N,p,q)
    UpdateStep(N,1,p,q);
    for i=N-1:-1:1
        UpdateStep(i,i+1,p,q);
    end
endfunction

evolution = zeros(N,N);
evolution(1,1:N) = chain(1:N);
current = zeros(1,N);
for i = 2:N
    icurrent = zeros(1,N);
    //chain_old=chain;
    chain_old = zeros(1,N);
    UpdateBackwardSequental(N,p,q);
    evolution(i,1:N) = chain(1:N);
    current = current + icurrent;
end

