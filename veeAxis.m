function axis = veeAxis(matrix)
% Vee-operator so(3) --> R^3
%
% transforms a skew-symmetric matrix representing the cross
% product with a vector to that vector
%
% omega = VEEAXIS(omegaHat) transforms a 3x3 skew-symmetric matrix into a 
%                           3d vector omega
%
% See also WEDGEAXIS
    axis = zeros(3, 1);
    if isZero(matrix + matrix')
        try
            axis(1, 1) = matrix(3, 2);
            axis(2, 1) = matrix(1, 3);
            axis(3, 1) = matrix(2, 1);
        catch exception
            if (size(matrix, 1) ~= 3) || (size(matrix, 2) ~= 3)
                error('matrix must be 3x3')
            else
                rethrow(exception);
            end
        end
    else        
        error('matrix must be skew-symmetric')
    end
end
