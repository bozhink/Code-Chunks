c:=299792458       $ % m s^{-1}
h:=6.626068e-34    $ % J s
hbar:=1.0545716e-34$ % J s
el:=1.6021765e-19  $ % C
me:=9.109382e-31   $ % kg
mp:=1.6726216e-27  $ %kg
GN:=6.674e-11      $ %m^3 kg^-1 s^-1
kB:=1.38065e-23    $ % J K^-1
AU:=149597870700   $ % m
%
on rounded$ precision 3$
%
%
% Mass of proton in eV
mp*c^2/el;
% Mass of electron in eV
me*c^2/el;
%
% Energy, calculated in K, i.e. eV->K
% kB*T = E [J] = E[eV]*el [J]
% T [K] = E[eV]*el / kB
el/kB;
%Temperature, calculated in [eV], i.e. K->eV
kB/el;
%
% Mass kg->eV
% m c^2 = E [J] => m = E[eV] * el/c^2
el/c^2;
%
% pc <--> AU
% 1 pc = 1 AU / 1''
pc := AU * 180 * 3600 /Pi;
%
% light year
ly:=3600*24*365.25*c;
pc/ly;
%
% Plank mass
MPl:=sqrt(hbar*c/GN);
% Plank Length
lPl:=sqrt(hbar*GN/c^3);
% Plank Time
tPl:=sqrt(hbar*GN/c^5);
