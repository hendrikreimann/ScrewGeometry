function skewMatrix = wedgeAxis(axis)
% Wedge-operator R^3 --> so(3)
%
% transforms a vector to the skew-symmetric matrix representing the cross
% product with that vector
%
% omegaHat = WEDGEAXIS(omega) transforms a 3d axis vector omega into a 
%                        3x3 skew-symmetric matrix
%
% See also VEEAXIS, EXPAXIS


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
