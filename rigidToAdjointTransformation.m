function adjoint = rigidToAdjointTransformation(rigidTransformation)
% Adjoint operator for rigid transformations
%
% adjoint = RIGIDTOADJOINTTRANSFORMATION(g) transforms a 4x4 rigid 
%           transformation g into the corresponding 6x6 adjoint 
%           transformation Ad_g
%
% See also ADJOINTTORIGIDTRANSFORMATION, INVERTADJOINTTRANSFORMATION


  % extract componenets
  rotation = rigidTransformation(1:3, 1:3);
  translation = rigidTransformation(1:3, 4);
  translation_wedge_times_rotation = wedgeAxis(translation) * rotation;

  % concatenate to form adjoint
  adjoint = [rotation translation_wedge_times_rotation; zeros(3, 3) rotation];
end

