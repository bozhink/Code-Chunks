
a1 = csvRead("banana.csv");
[b1,renum] = gsort(a1(:,3));
label_vector = a1(:,3);
instance_matrix = [a1(:,1), a1(:,2)];
model = libsvm_svmtrain(label_vector, instance_matrix);

x1 = linspace(-4,3);
x2 = linspace(-3,4);

rho = model.rho;
gamma = model.Parameters(4);
sv_coef = model.sv_coef;
SVs = model.SVs;
nSV = length(sv_coef);
f = ones(100,100);

for k = 1:100
    for i = 1:100
        mat = ones(nSV,2);
        mat(:,1) = x1(k);
        mat(:,2) = x2(i);
        mat = mat - SVs;
        mat = (mat(:,1).^2) + (mat(:,2).^2);
        a = (sv_coef' * exp(-gamma * mat)) - rho;
        
        f(i, k) = a;
    end
end

fig = scf();
fig.color_map = summercolormap(32);

plot(instance_matrix(1:2376,1), instance_matrix(1:2376,2), 'y+');
plot(instance_matrix(2377:5300,1), instance_matrix(2377:5300,2), 'b+');

//surf(x1,x2,f);
contour(x1,x2,f',[0 30]);
