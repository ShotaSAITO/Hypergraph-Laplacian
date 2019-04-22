function [L] = HypLap(H,mode)
%%%
% Usage:    [L] = HypLap(H,mode)
%
% Input:
%   H: node x edge hypergraph representative matrix
%   mode:
%       Zhou; Zhou's hypergraph Laplacian
%              See Zhou, D., Huang, J., and Scho ?lkopf, B. 2006. Learning with hypergraphs: Clustering, classification, and embedding. In Proc. NIPS, 1601?1608.
%       Rod; Rodriguez's hypergraph Laplcian
%             See Rodriguez, J. A. 2002. On the Laplacian eigenvalues and metric parameters of hypergraphs. Linear Multilinear Algebra 50(1):1?14.
%       Saito; Saito's hypergraph Laplacian
%               See Saito, S, Mandic, D.P., and Suzuki, H. 2018 Hypergraph p-Laplacian: A Differential Geometry View. In Proc. AAAI to appear.
%               See also https://arxiv.org/abs/1711.08171
%%%

De = diag(sum(H,1));
Dn = diag(sum(H,2));
w = diag(ones(1,size(De,2)));

if strcmp(mode,'Zhou')
    DeZhou = De;
    AA = H*DeZhou^(-1)*w*H';
elseif strcmp(mode,'Rod')
    AA = H*w*H' - Dn;
    Dn = diag(sum(AA));
elseif strcmp(mode,'Saito')
    De = De - diag(ones(1,size(De,2)));
    A = H*De^(-1)*w*H';
    AA = A-diag(diag(A));
else
    error('You have to choose mode from either Zhou, Rod, or Saito')
end
L = Dn^(-1/2)*(Dn - AA)*Dn^(-1/2);

end