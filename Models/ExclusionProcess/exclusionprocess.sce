
L = 10;
N = 5;
p = 0.5;

Niter = 1000;

histogram = zeros(1,L);
currentJ  = zeros(1,L);

global chain;
chain = zeros(1,L);
chain_new = zeros(1,L);

function genstate()
    global chain;
    chain = zeros(1,L);
    // Generation of new particles
    pos = int(rand()*L)+1;
    chain(pos) = 1;
    for j = 2:N
        while (chain(pos)==1)
            pos = int(rand()*L)+1;
        end
        chain(pos) = 1;
    end
endfunction


for iter = 1:Niter
    genstate();
    while chain(L)==0
        genstate();
    end
    //
    // Scanning the chain
    for i = L:-1:1
        if chain(i)==1 then
            //inext = i+1;
            //if i==L then
            //    inext = 1;
            //end
            inext = modulo(i+L, L) + 1;
            if chain(inext)==0 & rand()<p then
                chain(i)=0;
                chain(inext)=1;
                currentJ(i) = currentJ(i)+1;
            end
        end
    end
    histogram = histogram + chain;
end

dos = histogram / Niter;
J   = currentJ / Niter;

mdos = mean(dos);  sdos = stdev(dos);
mJ   = mean(J);    sJ   = stdev(J);
