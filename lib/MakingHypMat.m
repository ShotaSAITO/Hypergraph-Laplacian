function [H] = MakingHypMat(X)

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

end