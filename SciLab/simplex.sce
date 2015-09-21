function A=SetIndexRow(AA,C,IBASIS)
    [m,n]=size(AA);
    for j=1:n
        for i=1:m-1
            A(i,j)=AA(i,j);
        end
        A(m,j)=-C(j);
    end
    for j=1:n
        for i=1:m-1
            A(m,j)=A(m,j)+A(i,j)*C(IBASIS(i));
        end
    end
endfunction

function KC=GetKeyColumn(AA)
    [m,n]=size(AA);
    KC=1;
    for i=1:n-1
        //Minimum
        if AA(m,i)>AA(m,KC) then
            KC=i;
        end
    end
    if AA(m,KC)<=0 then
        KC=0; //This is used for convergence check
    end
endfunction

function KR=GetKeyRow(AA,KeyColumn)
    [m,n]=size(AA);
    KR=0; 
    k=1;
    while KR==0 & k<m
        if AA(k,KeyColumn)>0.0 then
            KR=k;
        end
        k=k+1;
    end
    if KR==0 then
        disp("ERROR in GetKeyRow: Cannot find Key row.");
        return;
    end
    for i=k+1:m-1
        if AA(i,KeyColumn)>0.0 then
            if AA(i,n)/AA(i,KeyColumn)<AA(KR,n)/AA(KR,KeyColumn) then
                KR=i;
            end
        end
    end
endfunction

function IB=UpdateBasis(IBASIS,KeyRow,KeyColumn)
    IB = IBASIS;
    IB(KeyRow) = KeyColumn;
endfunction

function MR=GetMainRow(AA,KeyRow,KeyColumn)
    [m,n]=size(AA);
    for j=1:n
        MR(j) = AA(KeyRow,j)/AA(KeyRow,KeyColumn);
    end
endfunction

function A=UpdateTable(AA,MR,KeyRow,KeyColumn)
    [m,n]=size(AA);
    for i=1:m
        for j=1:n
            A(i,j)=AA(i,j)-MR(j)*AA(i,KeyColumn);
        end
    end
    for j=1:n
        A(KeyRow,j)=MR(j);
    end
endfunction

function [Z,X]=SimplexReturn(AA,IBASIS)
    [m,n]=size(AA);
    for j=1:n-1
        X(j)=0.0;
    end
    Z=AA(m,n);
    for i=1:m-1
        X(IBASIS(i))=AA(i,n);
    end
endfunction

function [A,IB,KR,KC]=SimplexStep(AA,C,IBASIS)
    A=AA;
    IB=IBASIS;
    KR=1;
    KC = GetKeyColumn(AA);
    if KC==0 then return; end;
    KR = GetKeyRow(AA,KC);
    IB = UpdateBasis(IBASIS,KR,KC);
    MR = GetMainRow(AA,KR,KC);
    A  = UpdateTable(AA,MR,KR,KC);
endfunction

function [Z,X]=SIMPLEX(AA,C,IBASIS)
    MaximumIterations=100;
    BASIS = IBASIS;
    A = SetIndexRow(AA,C,IBASIS);
    
    for Iteration = 1:MaximumIterations
        
        [A,BASIS,KeyRow,KeyColumn]=SimplexStep(A,C,BASIS);
        if KeyColumn==0 then
            [Z,X]=SimplexReturn(A,BASIS);
            return;
        end;
        
    end;
    disp("SIMPLEX exceeded maximum iterations.");
    Z=0.0;
    X=0.0*ones(C(1:max(size(C))));
    return;
endfunction