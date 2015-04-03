function inverse = invertAdjointTransformation(adjoint)
% Calculates the inverse of the adjoint of a rigid transformation
%
% B = INVERTADJOINTTRANSFORMATION(A) inverts the 6x6 adjoint
%           transformation A.
%
% This function is faster than directly inverting the 6x6 matrix A.
%
% See also RIGIDTOADJOINTTRANSFORMATION, ADJOINTTORIGIDTRANSFORMATION

    inverse = [adjoint(1:3, 1:3)', -adjoint(1:3, 1:3)' * adjoint(1:3, 4:6) * adjoint(1:3, 1:3)'; zeros(3, 3) adjoint(1:3, 1:3)'];
end
