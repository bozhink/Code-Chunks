Reduce (Free CSL version), 10-Apr-11 ...

1: operator x,p,comm,delta;

2: noncom x,p;

3: antisymmetric comm;

4: for all a,b such that a neq b and numberp a and numberp b
4: let delta(a,b)=0;

5: for all a let delta(a,a)=1;

6: for all a,b,c let comm(x(a),x(b))=0, comm(p(a),p(b))=0,
6: comm(x(a),p(b))=hbar*i*delta(a,b),
6: comm(a+b,c)=comm(a,c)+comm(b,c),
6: comm(a**2,b) = a*comm(a,b)+comm(a,b)*a;

7: x2:= for l:=1:3 sum x(l)**2;
$Ž†€ x_{2}\mathrm{:=}x\left(3\right)^2+x\left(2\right)^2+x\left(1\right)^2

8: p2:=for l:=1:3 sum(p(l)**2);
$°Œ€ p_{2}\mathrm{:=}p\left(3\right)^2+p\left(2\right)^2+p\left(1\right)^2

9: for l:=1:3 cpllect comm(x2,p(l));

for l:=1:3 cpllect comm(x2,p(l))$$$;

***** ; invalid in for statement 

10: for l:=1:3 collect comm(x2,p(l));
$Ç–€ \left\{2\*\mathrm{hbar}\*i\*x\left(1\right)\,\mathrm{,\,}\,2\*\mathrm{hbar}\*i\*x\left(2\right)\,\mathrm{,\,}\,2\*\mathrm{hbar}\*i\*x\left(3\right)\right\}

11: for l:=1:3 collect comm(p2,x(l));
$¼¢€ \left\{-2\*\mathrm{hbar}\*i\*p\left(1\right)\,\mathrm{,\,}\,-2\*\mathrm{hbar}\*i\*p\left(2\right)\,\mathrm{,\,}\,-2\*\mathrm{hbar}\*i\*p\left(3\right)\right\}

12: 