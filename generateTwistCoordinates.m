function twist = generateTwistCoordinates(supportPoint, axis, type)
% Generate a twist representation from support point and axis
%
% xi = GENERATETWISTCOORDINATES(p, omega, type) generates a 6x1 coordinate
%      representation of a twist corresponding to rotation around the axis
%      with direction omega through the support point p for type one, or
%      corresponding to translation in the direction given by axis
%
% See also EXPTWIST

    if nargin < 3
        type = 1;
    end
    if type == 1
        if (size(supportPoint, 1) ~= 3) || (size(supportPoint, 2) ~= 1)
            error('supportPoint must be a 3x1 vector.')
        end
        if (size(axis, 1) ~= 3) || (size(axis, 2) ~= 1)
            error('axis must be a 3x1 vector.')
        end
        twist = [-cross(axis, supportPoint); axis * 1 / norm(axis)];
    elseif type == 2
        if (size(axis, 1) ~= 3) || (size(axis, 2) ~= 1)
            error('axis must be a 3x1 vector.')
        end
        twist = [axis; zeros(3, 1)];
    else
        error('incorrect joint type specified - please use "1" for revolute joints, "2" for prismatic joints');
        
    end
end