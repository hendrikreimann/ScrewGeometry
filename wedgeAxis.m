%% wedgeAxis
% wedge-operator for axes of a rotation.
% Maps an axis vector to the skew symmetric matrix encoding the cross
% product with the axis vector. Inverse of the vee-operator
function skewMatrix = wedgeAxis(axis)
    skewMatrix = zeros(3, 3);
    try
        skewMatrix(1, 1) = 0;
        skewMatrix(1, 2) = -axis(3);
        skewMatrix(1, 3) = axis(2);
        skewMatrix(2, 1) = axis(3);
        skewMatrix(2, 2) = 0;
        skewMatrix(2, 3) = -axis(1);
        skewMatrix(3, 1) = -axis(2);
        skewMatrix(3, 2) = axis(1);
        skewMatrix(3, 3) = 0;
    catch exception
        if length(axis) ~= 3
            error('axis must be a vector of length 3')
        else
            rethrow(exception)
        end
    end
end
