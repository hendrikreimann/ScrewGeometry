%% logTwist
% inverse of exp: se(3) -> SE(3)
% Transforms a rigid transformation matrix to a twist matrix and angle of
% rotation, by default the angle is positive.

function [twist, angle] = logTwist(transformationMatrix, useNegativeTheta)
    if nargin < 2
        useNegativeTheta = false;
    end

    % extract rotation and translation
    rotation = transformationMatrix(1:3, 1:3);
    translation = transformationMatrix(1:3, 4);

    % calculate exponential coordinates for R = exp(\wedge \omega \theta)
    [omega, angle] = logAxis(rotation, useNegativeTheta);

    % calculate v
    omega_wedge = wedgeAxis(omega);
    if isZero(norm(translation))
        v = zeros(3, 1);
    else
        v = ((eye(3, 3) - rotation) * omega_wedge + omega_wedge * omega_wedge' * angle)^(-1) * translation;
    end

    % concatenate omega and v to get twist coordinates
    twist = [v; omega];
end
