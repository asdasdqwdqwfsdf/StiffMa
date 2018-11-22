function [iK, jK] = IndexVector(elements)
% Computation of the row/column indices of the sparse matrix K (VECTOR)
elements = uint32(elements);        % Converts the precision data
nel = size(elements,1);             % Number of FEs
iK  = zeros(300*nel,1,'uint32');    % Store row indices
jK  = zeros(300*nel,1,'uint32');    % Store column indices
for e = 1:nel
    n = elements(e,:);
    temp = 0;
    for j = 1:24
        for i = j:24
            idx = temp + i + 300*(e-1);
            iK(idx) = n(i);
            jK(idx) = n(j);
        end
        temp = temp + i-j;
    end
end
