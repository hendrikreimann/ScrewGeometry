%% rigidToAdjointTransformation
% creates the adjoint transformation corresponding to a rigid
% transformation.
function adjoint = rigidToAdjointTransformation(rigidTransformation)


  % extract componenets
  rotation = rigidTransformation(1:3, 1:3);
  translation = rigidTransformation(1:3, 4);
  translation_wedge_times_rotation = wedgeAxis(translation) * rotation;

  % concatenate to form adjoint
  adjoint = [rotation translation_wedge_times_rotation; zeros(3, 3) rotation];
end

