[X,Y] = cancer_dataset;

k = 2;%% number of clusters


% to identify size of the hypergraph representation matrix
% This matrix should be node x edge
tmp = 0;
for i = 1:size(X,1)
    tmp = tmp + max(X(i,:));
end
H = zeros(size(X,2),tmp);

% to fill 1 to H if the node is connected to edge
tmp = 0;
for i = 1:size(X,1)
    jj = unique(X(i,:));
    for j = 1:size(jj,2)
        tmp = tmp + 1;
        H(X(i,:) == jj(j),tmp) = 1;
    end
end


LZhou = HypLap(H,'Zhou');
[UZhou,~] = eig(LZhou);
ClusterZhou = kmeans(UZhou(:,1:k),k);
AccZhou = (100 - AccMeasure(ClusterZhou,Y(1,:)+1))/100;
fprintf('Error for Zhou is %f\n', AccZhou)

LRod = HypLap(H,'Rod');
[URod,~] = eig(LRod);
ClusterRod = kmeans(URod(:,1:k),k);
AccRod = (100 - AccMeasure(ClusterRod,Y(1,:)+1))/100;
fprintf('Error for Rodriguez is %f\n', AccRod)

LSaito = HypLap(H,'Saito');
[USaito,~] = eig(LSaito);
ClusterSaito = kmeans(USaito(:,1:k),k);
AccSaito = (100 - AccMeasure(ClusterSaito,Y(1,:)+1))/100;
fprintf('Error for Saito is %f\n', AccSaito)

