
N0 = 0; //km northern; = 10000 km southern
k0 = 0.9996;
E0 = 500; // km





function [phi, lambda, k, gamma1]=utm2latlong(E,N,Zone,Hemi)
    // Hemi = +1 for Northern
    // Hemi = -1 for Southern
    N0 = 0; //km northern; = 10000 km southern
    k0 = 0.9996;
    E0 = 500; // km
    a = 6378.137; // km, equatorial radius
    f = 1/(298.257223563); // 1/f = inverse flattening
    
    n = f/(2-f);
    J = [1;2;3];
    A = a/(1+n)*(1 + n**2/4 + n**4/64);
    alpha0 = [n/2-2*n*n/3+5*n*n*n/16; 13*n*n/48-3*n*n*n/5; 61*n*n*n/240]; //disp(alpha0);
    beta0 = [n/2-2*n*n/3+37*n*n*n/96; n*n/48+n*n*n/15; 17*n*n*n/480]; //disp(beta0);
    delta0 = [2*n-2*n*n/3-2*n*n*n; 7*n*n/3-8*n*n*n/5; 56*n*n*n/15]; //disp(delta0);
    
    xi = (N-N0)/(k0*A);
    eta = (E-E0)/(k0*A);

    xi1 = xi - sum(beta0.*sin(2*J*xi).*cosh(2*J*eta));
    eta1 = eta - sum(beta0.*cos(2*J*xi).*sinh(2*J*eta));

    sigma1 = 1 - sum(2*J.*beta0.*sin(2*J*xi).*cosh(2*J*eta));
    tau1 = sum(2*J.*beta0.*sin(2*J*xi).*sinh(2*J*eta));
    
    chi = asin(sin(xi1)/cosh(eta1));
    
    phi = chi + sum(delta0.*sin(2*J*chi));
    lambda0 = Zone*6 - 183;
    lambda = lambda0 + atan(sinh(eta1)/cos(xi1));
    
    k=0;
    gamma1=0;
    
    
    //k = k0*A/a * sqrt()
    
endfunction

E = 781272.611;
N  = 2373393.69;
Zone = 15;
Hemim = 1;

    // Hemi = +1 for Northern
    // Hemi = -1 for Southern
    N0 = 0; //km northern; = 10000 km southern
    k0 = 0.9996;
    E0 = 500; // km
    a = 6378.137; // km, equatorial radius
    f = 1/(298.257223563); // 1/f = inverse flattening
    
    n = f/(2-f);
    J = [1;2;3];
    A = a/(1+n)*(1 + n**2/4 + n**4/64);
    alpha0 = [n/2-2*n*n/3+5*n*n*n/16; 13*n*n/48-3*n*n*n/5; 61*n*n*n/240]; //disp(alpha0);
    beta0 = [n/2-2*n*n/3+37*n*n*n/96; n*n/48+n*n*n/15; 17*n*n*n/480]; //disp(beta0);
    delta0 = [2*n-2*n*n/3-2*n*n*n; 7*n*n/3-8*n*n*n/5; 56*n*n*n/15]; //disp(delta0);
    
    xi = (N-N0)/(k0*A);
    eta = (E-E0)/(k0*A);

    xi1 = xi - sum(beta0.*sin(2*J*xi).*cosh(2*J*eta));
    eta1 = eta - sum(beta0.*cos(2*J*xi).*sinh(2*J*eta));

    sigma1 = 1 - sum(2*J.*beta0.*sin(2*J*xi).*cosh(2*J*eta));
    tau1 = sum(2*J.*beta0.*sin(2*J*xi).*sinh(2*J*eta));
    
    chi = asin(sin(xi1)/cosh(eta1));
    
    phi = chi + sum(delta0.*sin(2*J*chi));
    lambda0 = Zone*6 - 183;
    lambda = lambda0 + atan(sinh(eta1)/cos(xi1));
    
    k=0;
    gamma1=0;
