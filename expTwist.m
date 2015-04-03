function transformationMatrix = expTwist(twist, angle)
% Exponential map se(3) -> SE(3)
%
% T = EXPTWIST(xi, theta) transforms a twist xi and angle theta
%     into the 4x4 rigid transformation matrix T representing rotation by 
%     theta around xi. The twist can be given in matrix or coordinate
%     representation.
%
% See also LOGTWIST, EXPAXIS
    
    if (size(twist, 1) == 4) && (size(twist, 2) == 4)
        twist = wedgeTwist(twist);
    end
    if (size(twist, 1) ~= 6) || (size(twist, 2) ~= 1)
        error('twist must be a 4x4 twist matrix or 6x1 twist coordinate vector.')
    end
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