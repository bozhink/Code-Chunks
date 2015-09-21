funcprot(0);

C = [1 1 0 0; 0 1 1 0; 0 0 1 1; 1 0 0 1; 1 0 1 0; 0 1 0 1];
K = 6;
L = 4;
N = 2;
chain = [0 0 0 0];
chain_old = chain;
p = 0.5;
q = 0.5;

function z=get_state_number(chain)
    [n,m]=size(chain);
    if n>m then
        chain=chain';
    end
    z=0;
    for i=1:K
        if and(chain==C(i,:)) then
            z=i;
            return;
        end
    end
endfunction

function [z,c,zo]=bsu_step(i,j,p,q,chain,chain_old)
    z=chain;
    zo=chain_old;
    c=zeros(1,L);
    pr = p;
    if zo(i)==1 then
        pr = q;
    end
    if (chain(j)==0) & (chain(i)==1) & (rand()<pr) then
        z(j)=1;
        z(i)=0;
        c(j)=1;
        zo(i)=1;
        zo(j)=1;
    else
        c(i)=1;
        zo(i)=1;
    end
endfunction

function [z,c]=bsu_update(p,q,chain)
    zo=chain;
    c=zeros(1,L);
    ic=c;
    z=chain;
    // (4,1),(3,4),(2,3),(1,2)
    [z,ic,zo]=bsu_step(L,1,p,q,z,zo);
    c=c+ic;
    for i=L:-1:2
        [z,ic,zo]=bsu_step(i-1,i,p,q,z,zo);
        c=c+ic;
    end
endfunction

function pm=bsu_probability_matrix(p,q,num_of_iterations)
    pm=zeros(K,K);
    for k=1:K // for each possible initial configuration
        for iter=1:num_of_iterations
            chain=C(k,:);
            [z,c]=bsu_update(p,q,chain);
            kk=get_state_number(z);
            pm(k,kk)=pm(k,kk)+1;
        end
    end
    for k=1:K
        pm(:,k)=pm(:,k)/sum(pm(:,k));
    end
endfunction
