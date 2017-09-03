d = 2; // dimension
nc = 3; // number of clusters
nic = 20; // number of items per cluster


clusters = list();

for i = 1:nc
    clusters(i) = rand(nic, d);
    clusters(i)(:,1) = clusters(i)(:,1) - 0.5*i;
    clusters(i)(:,2) = clusters(i)(:,2) + i;
end

scf(1);
clf();
plot2d(clusters(1)(:,1), clusters(1)(:,2), [-5]);
plot2d(clusters(2)(:,1), clusters(2)(:,2), [-4]);
plot2d(clusters(3)(:,1), clusters(3)(:,2), [-6]);

all_points = [];
for i = 1:nc
    all_points = [all_points; clusters(i)];
end

centers = rand(nc, d);

function kmeans(data, centers)
    [n, m] = size(centers);
    [nd, md] = size(data);
    if md <> m then
        error('Invalid dimentions');
    end

    dict = [];
    for i = 1:nd

        // Find the index of the nearest center
        dist_min = %inf;
        k_min = 1;
        for k = 1:n
            delta = data(i, :) - centers(k, :);
            dist = sqrt(delta * delta');
            if dist < dist_min then
                dist_min = dist;
                k_min = k;
            end
        end

        // Here k_min is the index of the nearest center
        // Update the dictionary dict
        dict(i) = k_min;
    end
    disp(dict);

    // Here dict is the mapping between a data point to its nearest center
    // Re-calculate the amss of each center
    cc = zeros(centers);
    nn = zeros(n, 1);
    for i = 1:nd
        k = dict(i);
        cc(k, :) = cc(k, :) + data(i, :);
        nn(k) = nn(k) + 1;
    end
    z = centers;
    for k = 1:n
        z(k, :) = cc(k, :) / nn(k);
    end
    
    return z;
endfunction

