with Ada.Numerics.Generic_Elementary_Functions;

package body calc_eigen
is
   procedure jacobi(d : in out Matrix; e : in out Matrix; itmax : in Integer)
   is
     package Math is new Ada.Numerics.Generic_Elementary_Functions(Real);
     function Sqrt(X: Real) return Real renames Math.Sqrt;
     
     i, iter,  ir, ic : Integer;
     yy, zz, yyy, zzz, dif, tanz, cosz, sinz : Real;

   begin
     for ii in 1 .. N loop
       for jj in 1 .. N loop
         e(ii,jj) := 0.0;
       end loop;
       e(ii,ii) := 1.0;
     end loop;

     iter := 0;
     loop
       exit when iter >= itmax;
       yy := 0.0;
       zz := 0.0;
       for ii in 1 .. N-1 loop
         for jj in ii+1 .. N loop
           if abs(d(ii,jj)) > zz then
             zz := abs(d(ii,jj));
             ir := ii;
             ic := jj;
            end if;
          end loop;
        end loop;
        if (iter /= 0) then yy := zz * eps; end if;
        if zz <= yy then return; end if;
        
        dif := d(ir,ir) - d(ic,ic);
        tanz := 0.5 * (-dif + Sqrt(dif*dif + 4.0*zz*zz)) / d(ir,ic);
        cosz := 1.0 / Sqrt(1.0 + tanz*tanz);
        sinz := cosz * tanz;
        
        for ii in 1 .. N loop
          zzz := e(ii,ir);
          e(ii,ir) := cosz * zzz + sinz * e(ii,ic);
          e(ii,ic) := cosz * e(ii,ic) - sinz * zzz;
        end loop;
        
        i := 1;
        loop
          exit when i = ir;
          yyy := d(i,ir);
          d(i,ir) := cosz * yyy + sinz * d(i,ic);
          d(i,ic) := cosz * d(i,ic) - sinz * yyy;
          i := i + 1;
        end loop;
        
        i := ir + 1;
        loop
          exit when i = ic;
          yyy := d(ir,i);
          d(ir,i) := cosz * yyy + sinz * d(i, ic);
          d(i,ic) := cosz * d(i,ic) - sinz * yyy;
          i := i + 1;
        end loop;
        
        i := ic + 1;
        loop
          exit when i > N;
          zzz := d(ir,i);
          d(ir,i) := cosz * zzz + sinz * d(ic,i);
          d(ic,i) := cosz * d(ic,i) - sinz * zzz;
          i := i + 1;
        end loop;
        
        yyy := d(ir,ir);
        d(ir,ir) := yyy * cosz*cosz + d(ir,ic) * 2.0*cosz*sinz + d(ic,ic) * sinz*sinz;
        d(ic,ic) := d(ic,ic) * cosz*cosz - d(ir,ic) * 2.0*cosz*sinz + yyy * sinz*sinz;
        d(ir,ic) := 0.0;
        
        iter := iter + 1;
      end loop;
   end jacobi;

end calc_eigen;
