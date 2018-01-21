[X,Y] = cancer_dataset;

addpath('./lib')  

k = 2;%% number of clusters
H = MakingHypMat(X);%%Making a hypergraph representation node x edge matrix


LZhou = HypLap(H,'Zhou');
[ErrZhou,~] = GraphClustering(LZhou,k,Y);
fprintf('Error for Zhou is %f\n', ErrZhou)

LRod = HypLap(H,'Rod');
[ErrRod,~] = GraphClustering(LRod,k,Y);
fprintf('Error for Rodriguez is %f\n', ErrRod)

LSaito = HypLap(H,'Saito');
[ErrSaito,~] = GraphClustering(LSaito,k,Y);
fprintf('Error for Saito is %f\n', ErrSaito)

