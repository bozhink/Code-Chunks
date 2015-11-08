aaa=[631200 780143.766831 2373680.0708
631196 780143.766831 2373680.0708
630915 780535.103072 2373588.16789
630934 781272.611854 2373443.69326
631143 781272.611854 2373443.69326
631177 780535.103072 2373588.16789
631181 780535.103072 2373588.16789
631219 781272.611854 2373443.69326
631257 780535.103072 2373588.16789
631272 781731.820967 2373387.22376
631276 781731.820967 2373387.22376
631295 782271.440297 2373268.56034
631310 781272.611854 2373443.69326
631447 781272.611854 2373443.69326
631466 782271.440297 2373332.34712
631485 780535.103072 2373588.16789
631519 781272.611854 2373443.69326
631542 780535.103072 2373608.16789
631580 782461.025319 2373300.35196
631599 782271.440297 2373268.56034
631618 782271.440297 2373268.56034
631637 780143.766831 2373680.0708
631656 781272.611854 2373443.69326
631675 781272.611854 2373443.69326
631694 781272.611854 2373443.69326
631728 780535.103072 2373588.16789
631732 780535.103072 2373588.16789
631751 781272.611854 2373443.69326
631808 781272.611854 2373443.69326
631846 780535.103072 2373608.16789
631865 781272.611854 2373443.69326
631884 780535.103072 2373608.16789
631903 780143.766831 2373680.0708
630896 781272.611854 2373393.69326
630892 781272.611854 2373393.69326
630911 780535.103072 2373588.16789
630930 781272.611854 2373443.69326
630953 781272.611854 2373443.69326
630949 781272.611854 2373443.69326
630972 782271.440297 2373268.56034
630968 782271.440297 2373268.56034
630991 781272.611854 2373443.69326
630987 781272.611854 2373443.69326
631010 781272.611854 2373443.69326
631006 781272.611854 2373443.69326
631029 781272.611854 2373443.69326
631025 781272.611854 2373443.69326
631048 780143.766831 2373700.0708
631044 780143.766831 2373700.0708
631063 781272.611854 2373443.69326
631086 781272.611854 2373443.69326
631082 781272.611854 2373443.69326
631101 781272.611854 2373443.69326
631124 781272.611854 2373443.69326
631120 781272.611854 2373443.69326
631139 781272.611854 2373443.69326
631158 781272.611854 2373443.69326
631215 781272.611854 2373443.69326
631238 781731.820967 2373387.22376
631234 781731.820967 2373387.22376
631253 780535.103072 2373588.16789
631291 782271.440297 2373268.56034
631314 781272.611854 2373443.69326
631333 780143.766831 2373680.0708
631329 780143.766831 2373680.0708
631352 780143.766831 2373740.0708
631348 780143.766831 2373740.0708
631371 780535.103072 2373673.16789
631367 780535.103072 2373673.16789
631390 781272.611854 2373443.69326
631386 781272.611854 2373443.69326
631409 782271.440297 2373268.56034
631405 782271.440297 2373268.56034
631428 781272.611854 2373443.69326
631424 781272.611854 2373443.69326
631443 781272.611854 2373443.69326
631462 782271.440297 2373332.34712
631481 780535.103072 2373588.16789
631504 781272.611854 2373443.69326
631500 781272.611854 2373443.69326
631523 781272.611854 2373443.69326
631538 780535.103072 2373608.16789
631561 781272.611854 2373443.69326
631557 781272.611854 2373443.69326
631576 782461.025319 2373300.35196
631595 782271.440297 2373268.56034
631614 782271.440297 2373268.56034
631633 780143.766831 2373680.0708
631652 781272.611854 2373443.69326
631671 781272.611854 2373443.69326
631690 781272.611854 2373443.69326
631713 781272.611854 2373443.69326
631709 781272.611854 2373443.69326
631747 781272.611854 2373443.69326
631770 781272.611854 2373443.69326
631766 781272.611854 2373443.69326
631789 781272.611854 2373523.69326
631785 781272.611854 2373523.69326
631804 781272.611854 2373443.69326
631827 781272.611854 2373443.69326
631823 781272.611854 2373443.69326
631842 780535.103072 2373608.16789
631861 781272.611854 2373443.69326
631880 780535.103072 2373608.16789
631899 780143.766831 2373680.0708
631067 781272.611854 2373443.69326
631105 781272.611854 2373443.69326
631162 781272.611854 2373443.69326];

bbb=aaa;

naaa = max(size(aaa));


function [X,Y]=UTMtoGeog(x,y,utmz,hemi)
    if (x<160000 | x>840000) then
        disp("Outside permissible range of easting values \n Results may be unreliable \n Use with caution");
        return;
    end;
    if (y<0) then
        disp("Negative values not allowed \n Results may be unreliable \n Use with caution");
        return;
    end;
    if (y>10000000) then
        disp("Northing may not exceed 10,000,000 \n Results may be unreliable \n Use with caution");
        return;
    end;
    DatumEqRad = [6378137.0,6378137.0,6378137.0,6378135.0,6378160.0,6378245.0,6378206.4,6378388.0,6378388.0,6378249.1,6378206.4,6377563.4,6377397.2,6377276.3];
    DatumFlat = [298.2572236, 298.2572236, 298.2572215, 298.2597208, 298.2497323, 298.2997381, 294.9786982,296.9993621, 296.9993621, 293.4660167, 294.9786982, 299.3247788, 299.1527052, 300.8021499];
    Item = 1;//Default
    a = DatumEqRad(Item);//equatorial radius, meters.
    f = 1/DatumFlat(Item);//polar flattening.
    drad = 4*atan(1.0)/180;//Convert degrees to radians)

    k0 = 0.9996;//scale on central meridian
    b = a*(1-f);//polar axis.
    e = sqrt(1 - (b/a)*(b/a));//eccentricity
    e0 = e/sqrt(1 - e*e);//Called e prime in reference
    esq = (1 - (b/a)*(b/a));//e squared for use in expansions
    e0sq = e*e/(1-e*e);// e0 squared - always even powers

    zcm = 3 + 6*(utmz-1) - 180;//Central meridian of zone
    e1 = (1 - sqrt(1 - e*e))/(1 + sqrt(1 - e*e));//Called e1 in USGS PP 1395 also
    M0 = 0;//In case origin other than zero lat - not needed for standard UTM
    M = M0 + y/k0;//Arc length along standard meridian.

    if hemi then
        M=M0+(y-10000000)/k;
    end;
    mu = M/(a*(1 - esq*(1/4 + esq*(3/64 + 5*esq/256))));
    phi1 = mu + e1*(3/2 - 27*e1*e1/32)*sin(2*mu) + e1*e1*(21/16 -55*e1*e1/32)*sin(4*mu);//Footprint Latitude
    phi1 = phi1 + e1*e1*e1*(sin(6*mu)*151/96 + e1*sin(8*mu)*1097/512);
    C1 = e0sq*(cos(phi1)**2);
    T1 = (tan(phi1)**2);
    N1 = a/sqrt(1-(e*sin(phi1))**2);
    R1 = N1*(1-e*e)/(1-(e*sin(phi1))**2);
    D = (x-500000)/(N1*k0);
    phi = (D*D)*(1/2 - D*D*(5 + 3*T1 + 10*C1 - 4*C1*C1 - 9*e0sq)/24);
    phi = phi + (D**6)*(61 + 90*T1 + 298*C1 + 45*T1*T1 -252*e0sq - 3*C1*C1)/720;
    phi = phi1 - (N1*tan(phi1)/R1)*phi;
    //Output Latitude
    X = floor(1000000*phi/drad)/1000000;
    //Longitude
    lng = D*(1 + D*D*((-1 -2*T1 -C1)/6 + D*D*(5 - 2*C1 + 28*T1 - 3*C1*C1 +8*e0sq + 24*T1*T1)/120))/cos(phi1);
    lngd = zcm+lng/drad;
    //Output Longitude
    Y = floor(1000000*lngd)/1000000;
endfunction



for i=1:naaa, [bbb(i,2),bbb(i,3)]=UTMtoGeog(aaa(i,2),aaa(i,3),15,%f);end;