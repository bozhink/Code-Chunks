function [pp,qq]=baker(p,q)
    if 0<=q & q <= 0.5 then
        pp = p/2;
        qq = 2*q;
    elseif 0.5 < q & q <= 1 then
        pp = (p+1)/2;
        qq = 2*q-1;
    else
        disp("Error: q must be in interval [0,1): q="+string(q));
        pp=0;
        qq=0;
    end
endfunction

function [pp,qq]=BakerCode(n,p,q)
    pp(1) = p;
    qq(1) = q;
    for i = 2:n
        [pp(i),qq(i)] = baker(pp(i-1),qq(i-1));
    end
endfunction