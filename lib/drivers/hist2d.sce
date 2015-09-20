Lib = home + '/tmp/libhist2d.so'
ulink();
link(Lib,['hist2d','bhist2d','hist2ds','bhist2ds','bool2d'],'f');

m = 10000;
X = linspace(-%pi,%pi,m);
Y = sin(X);

nx = 15; ny = nx;

[Xmin,Xmax,Ymin,Ymax,bordX,bordY,iCount] = call('bhist2d',nx,1,'i',ny,2,'i',m,3,'i',X,4,'d',Y,5,'d','out',[1,1],6,'d',[1,1],7,'d',[1,1],8,'d',[1,1],9,'d',[1,nx],10,'d',[1,ny],11,'d',[nx,ny],12,'i');