function rotationMatrix = expAxis(axis, angle)
% Exponential map so(3) -> SO(3), using Rodriguez' formula
%
% R = EXPAXIS(omega, theta) transforms a normed axis omega and angle theta
%     into the 3x3 matrix representing rotation by theta around omega.
%
% See also LOGAXIS, EXPTWIST

    if (size(axis, 1) ~= 3) || (size(axis, 2) ~= 1)
        error('omega must be a 3x1 vector.')
    end

    omega_wedge = wedgeAxis(axis);
    rotationMatrix = eye(3, 3) + (omega_wedge * sin(angle)) + (omega_wedge * omega_wedge * (1 - cos(angle)));
end