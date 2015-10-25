        function Declarations(){
          //Symbols as used in USGS PP 1395: Map Projections - A Working Manual
          DatumEqRad = [6378137.0,6378137.0,6378137.0,6378135.0,6378160.0,6378245.0,6378206.4,6378388.0,6378388.0,6378249.1,6378206.4,6377563.4,6377397.2,6377276.3];
          DatumFlat = [298.2572236, 298.2572236, 298.2572215, 298.2597208, 298.2497323, 298.2997381, 294.9786982,296.9993621, 296.9993621, 293.4660167, 294.9786982, 299.3247788, 299.1527052, 300.8021499];
          Item = 0;//Default
          k0 = 0.9996;//scale on central meridian
          a = DatumEqRad[Item];//equatorial radius, meters.
          f = 1/DatumFlat[Item];//polar flattening.
          b = a*(1-f);//polar axis.
          e = Math.sqrt(1 - b*b/a*a);//eccentricity
          drad = Math.PI/180;//Convert degrees to radians)
          latd = 0;//latitude in degrees
          phi = 0;//latitude (north +, south -), but uses phi in reference
          e0 = e/Math.sqrt(1 - e*e);//e prime in reference
          N = a/Math.sqrt(1-Math.pow(e*Math.sin(phi)),2);
          T = Math.pow(Math.tan(phi),2);
          C = Math.pow(e*Math.cos(phi),2);
          lng = 0;//Longitude (e = +, w = -) - can't use long - reserved word
          lng0 = 0;//longitude of central meridian
          lngd = 0;//longitude in degrees
          M = 0;//M requires calculation
          x = 0;//x coordinate
          y = 0;//y coordinate
          k = 1;//local scale
          utmz = 30;//utm zone
          zcm = 0;//zone central meridian
          DigraphLetrsE = "ABCDEFGHJKLMNPQRSTUVWXYZ";
          DigraphLetrsN = "ABCDEFGHJKLMNPQRSTUV";
          document.getElementById("EqRadBox").value = a;
          document.getElementById("PolRadBox").value = b;
          document.getElementById("FlatBox").value = f;
          document.getElementById("RecipBox").value = 1/f;
          OOZok = false;
        }//Close declarations

        

        function MakeDigraph(){
          //Inputs y utmz
          //alert(utmz);
          Letr = Math.floor((utmz-1)*8 + (x)/100000);
          Letr = Letr - 24*Math.floor(Letr/24)-1;
          Digraph = DigraphLetrsE.charAt(Letr);
          //alert("x= "+x);
          //alert(DigraphLetrsE.charAt(Letr));
          //First (Easting) Character Found
          Letr = Math.floor(y/100000);
          //Odd zones start with A at equator, even zones with F
          if (utmz/2 == Math.floor(utmz/2)){Letr = Letr+5;}
          Letr = Letr - 20*Math.floor(Letr/20);
          Digraph = Digraph + DigraphLetrsN.charAt(Letr);
        }//End MakeDigraph

        
        
        
        function DDtoDMS(){
          //Input= xd(long) and yd(lat)
          //Output = xdd xm xs (long) and ydd ym ys (lat)
          ydd = Math.floor(Math.abs(yd));
          ym = Math.floor(60*(Math.abs(yd) - ydd));
          ys = 3600*(Math.abs(yd)-ydd - ym/60);
          if (yd<0){ydd=-ydd;}
          xdd = Math.floor(Math.abs(xd));
          xm = Math.floor(60*(Math.abs(xd) - xdd));
          xs = 3600*(Math.abs(xd)-xdd - xm/60);
          if (xd<0){xdd=-xdd;}
        }//End DDtoDMS\
        
        
        

        function UTMtoGeog(){
          //Convert UTM Coordinates to Geographic
          Declarations();
          console.log(a);
          k0 = 0.9996;//scale on central meridian
          b = a*(1-f);//polar axis.
          e = Math.sqrt(1 - (b/a)*(b/a));//eccentricity
          e0 = e/Math.sqrt(1 - e*e);//Called e prime in reference
          esq = (1 - (b/a)*(b/a));//e squared for use in expansions
          e0sq = e*e/(1-e*e);// e0 squared - always even powers
          // -->>
          x = parseFloat(document.getElementById("UTMeBox1").value);
          if (x<160000 || x>840000){alert("Outside permissible range of easting values \n Results may be unreliable \n Use with caution");}
          // -->>
          y = parseFloat(document.getElementById("UTMnBox1").value);
          //alert(y)
          if (y<0){alert("Negative values not allowed \n Results may be unreliable \n Use with caution");}
          if (y>10000000){alert("Northing may not exceed 10,000,000 \n Results may be unreliable \n Use with caution");}
          
          // -->>
          utmz = parseFloat(document.getElementById("UTMzBox1").value);
          zcm = 3 + 6*(utmz-1) - 180;//Central meridian of zone
          e1 = (1 - Math.sqrt(1 - e*e))/(1 + Math.sqrt(1 - e*e));//Called e1 in USGS PP 1395 also
          M0 = 0;//In case origin other than zero lat - not needed for standard UTM
          M = M0 + y/k0;//Arc length along standard meridian.
          if (document.getElementById("SHemBox").checked === true){M=M0+(y-10000000)/k;}
          mu = M/(a*(1 - esq*(1/4 + esq*(3/64 + 5*esq/256))));
          phi1 = mu + e1*(3/2 - 27*e1*e1/32)*Math.sin(2*mu) + e1*e1*(21/16 -55*e1*e1/32)*Math.sin(4*mu);//Footprint Latitude
          phi1 = phi1 + e1*e1*e1*(Math.sin(6*mu)*151/96 + e1*Math.sin(8*mu)*1097/512);
          C1 = e0sq*Math.pow(Math.cos(phi1),2);
          T1 = Math.pow(Math.tan(phi1),2);
          N1 = a/Math.sqrt(1-Math.pow(e*Math.sin(phi1),2));
          R1 = N1*(1-e*e)/(1-Math.pow(e*Math.sin(phi1),2));
          D = (x-500000)/(N1*k0);
          phi = (D*D)*(1/2 - D*D*(5 + 3*T1 + 10*C1 - 4*C1*C1 - 9*e0sq)/24);
          phi = phi + Math.pow(D,6)*(61 + 90*T1 + 298*C1 + 45*T1*T1 -252*e0sq - 3*C1*C1)/720;
          phi = phi1 - (N1*Math.tan(phi1)/R1)*phi;
          //Output Latitude
          document.getElementById("DDLatBox0").value = Math.floor(1000000*phi/drad)/1000000;
          //Longitude
          lng = D*(1 + D*D*((-1 -2*T1 -C1)/6 + D*D*(5 - 2*C1 + 28*T1 - 3*C1*C1 +8*e0sq + 24*T1*T1)/120))/Math.cos(phi1);
          lngd = zcm+lng/drad;
          //Output Longitude
          document.getElementById("DDLonBox0").value = Math.floor(1000000*lngd)/1000000;
          //Parse DMS
          xd = lngd;
          yd = phi/drad;
          DDtoDMS();
          document.getElementById("DLatBox0").value = Math.floor(ydd);
          document.getElementById("MLatBox0").value = ym;
          document.getElementById("SLatBox0").value = Math.floor(1000*ys)/1000;
          document.getElementById("DLonBox0").value = Math.floor(xdd);
          document.getElementById("MLonBox0").value = xm;
          document.getElementById("SLonBox0").value = Math.floor(1000*xs)/1000;
          document.getElementById("UTMLonZoneBox2").value = utmz;
          //document.getElementById("UTMLatZoneBox2").value = DigraphLetrsE[latz];
          document.getElementById("UTMeBox2").value = Math.round(10*(x-100000*Math.floor(x/100000)))/10;
          document.getElementById("UTMnBox2").value = Math.round(10*(y-100000*Math.floor(y/100000)))/10;
          MakeDigraph();
          document.getElementById("UTMDgBox2").value = Digraph;
        }