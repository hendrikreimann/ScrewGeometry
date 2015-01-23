% exponential map so(3) -> SO(3), using Rodriguez' formula
% Transforms a normed axis and an angle of rotation to the corresponding
% rotation matrix.
function rotationMatrix = expAxis(axis, angle)
    omega_wedge = wedgeAxis(axis);
    rotationMatrix = eye(3, 3) + (omega_wedge * sin(angle)) + (omega_wedge * omega_wedge * (1 - cos(angle)));
end