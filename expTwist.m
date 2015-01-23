% exponential map se(3) -> SE(3)
% Transforms a twist matrix (corresponding to a normed axis and support
% point) to the rotation around that axis with the given angle.
function transformationMatrix = expTwist(twist, angle)
    v = twist(1:3, 1);
    omega = twist(4:6, 1);

    % rotation
    rotation = expAxis(omega, angle);

    % translation
    if (isZero(norm(omega))) % pure translation
        translation = v * theta;
    else % translation and rotation
        translation = (eye(3,3) - rotation)*(cross(omega, v)) + omega*omega'*v*angle;
    end
    transformationMatrix = [rotation translation; 0 0 0 1];
end