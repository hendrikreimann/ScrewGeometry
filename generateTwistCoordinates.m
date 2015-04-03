function twist = generateTwistCoordinates(supportPoint, axis)
% Generate a twist representation from support point and axis
%
% xi = GENERATETWISTCOORDINATES(p, omega) generates a 6x1 coordinate
%      representation of a twist corresponding to rotation around the axis
%      with direction omega through the support point p.
%
% See also EXPTWIST

    if (size(supportPoint, 1) ~= 3) || (size(supportPoint, 2) ~= 1)
        error('supportPoint must be a 3x1 vector.')
    end
    if (size(axis, 1) ~= 3) || (size(axis, 2) ~= 1)
        error('axis must be a 3x1 vector.')
    end
    twist = [-cross(axis, supportPoint); axis * 1 / norm(axis)];
end