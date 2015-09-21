function z=qSum(x)
    [n,m]=size(x);
    if n==4 then
        z(1)=sum(x(1,:));
        z(2)=sum(x(2,:));
        z(3)=sum(x(3,:));
        z(4)=sum(x(4,:));
    elseif m==4 then
        z(1)=sum(x(:,1));
        z(2)=sum(x(:,2));
        z(3)=sum(x(:,3));
        z(4)=sum(x(:,4));
    else
        disp("qSum: Error: one of dimension of x must be 4");
        z=0;
        return;
    end;
endfunction

function z=qProduct(x,y)
    z(1)=x(1)*y(1)-x(2)*y(2)-x(3)*y(3)-x(4)*y(4);
    z(2)=x(1)*y(2)+x(2)*y(1)+x(3)*y(4)-x(4)*y(3);
    z(3)=x(1)*y(3)-x(2)*y(4)+x(3)*y(1)+x(4)*y(2);
    z(4)=x(1)*y(4)+x(2)*y(3)-x(3)*y(2)+x(4)*y(1);
endfunction

function z=qAbs(x)
    z=sqrt(x(1)*x(1)+x(2)*x(2)+x(3)*x(3)+x(4)*x(4));
endfunction

function z=qSqAbs(x)
    z=x(1)*x(1)+x(2)*x(2)+x(3)*x(3)+x(4)*x(4);
endfunction

function z=qUnit(x)
    z=x/qAbs(x);
endfunction

function z=qConj(x)
    z(1)=x(1);
    z(2)=-x(2);
    z(3)=-x(3);
    z(4)=-x(4);
endfunction

function z=qInverse(x)
    xx=qSqAbs(x);
    z(1)=x(1)/xx;
    z(2)=-x(2)/xx;
    z(3)=-x(3)/xx;
    z(4)=-x(4)/xx;
endfunction