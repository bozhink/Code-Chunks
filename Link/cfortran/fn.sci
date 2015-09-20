A            = diag(10*ones(10,1));
A(1:$-1,2:$) = A(1:$-1,2:$) + diag(6*ones(9,1));
A(2:$,1:$-1) = A(2:$,1:$-1) + diag(6*ones(9,1));

B = eye(10,10);
k = 8;
sigma = 'SM';
opts.cholB = %t;

d = eigs(A)
[d, v] = eigs(A)

d = eigs(A, B, k, sigma)
[d, v] = eigs(A, B, k, sigma)

d = eigs(A, B, k, sigma, opts)
[d, v] = eigs(A, B, k, sigma, opts)

// With sparses
AS = sparse(A);
BS = sparse(B);

d = eigs(AS)
[d, v] = eigs(AS)

d = eigs(AS, BS, k, sigma)
[d, v] = eigs(AS, BS, k, sigma)

d = eigs(AS, BS, k, sigma, opts)
[d, v] = eigs(AS, BS, k, sigma, opts)

// With function
clear opts
function y=fn(x)
   y = A * x;
endfunction

opts.isreal = %t;
opts.issym = %t;

d = eigs(fn, 10, [], k, 'LM', opts)

function y=fn(x)
   y = A \ x;
endfunction

d = eigs(fn, 10, [], k, 'SM', opts)

function y=fn(x)
   y = (A - 4 * eye(10,10)) \ x;
endfunction

d = eigs(fn, 10, [], k, 4, opts)
