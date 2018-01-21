function [err, resvec] = GraphClustering(L,k,Y)
%%%
% Usage:    [err, resvec] = GraphClustering(L,Y)
%
% Input:
%   L: Hypergraph Laplacian matrix
%   k: number of clusters
%   Y: Lables for nodes
%
% Output:
%   err: error rate for graph clustering
%   resvec: the clusternig result assinged to each node
%%%
[U,~] = eig(L);
resvec = kmeans(U(:,1:k),k);
err = (100 - AccMeasure(resvec,Y(1,:)+1))/100;
end