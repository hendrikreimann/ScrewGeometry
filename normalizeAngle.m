function angle = normalizeAngle(angle)
% normalizes an angle in radian to the interval (-pi, pi]
%
% phi_normalized = NORMALIZEANGLE(phi) subtracts or adds 2PI to each
% element in phi. Phi can be a scalar or a multi-dimensional array.

while any(any(angle <= -pi))
    angle(angle <= -pi) = angle(angle <= -pi) + 2*pi;
end
while any(any(angle > pi))
    angle(angle > pi) = angle(angle > pi) - 2*pi;
end
    