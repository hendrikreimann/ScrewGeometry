% calculates the rigid from the given adjoint transformation

function rigidTransformation = adjointToRigidTransformation(adjoint)
    rotation = adjoint(1:3, 1:3);
    position = veeAxis(adjoint(1:3, 4:6) * rotation^(-1));

    rigidTransformation = [rotation position; 0 0 0 1];
end