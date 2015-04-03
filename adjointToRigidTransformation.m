function rigidTransformation = adjointToRigidTransformation(adjoint)
% Inverse of the adjoint operator for rigid transformations
%
% g = ADJOINTTORIGIDTRANSFORMATION(g) transforms a 6x6 adjoint
%           transformation Ad_g into the corresponding 4x4 rigid  
%           transformation g
%
% See also RIGIDTOADJOINTTRANSFORMATION, INVERTADJOINTTRANSFORMATION
    rotation = adjoint(1:3, 1:3);
    position = veeAxis(adjoint(1:3, 4:6) * rotation^(-1));

    rigidTransformation = [rotation position; 0 0 0 1];
end