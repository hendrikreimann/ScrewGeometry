
%% vee operator for axes of a rotation
% Maps a skew symmetric matrix encoding the cross product with a vector
% to that vector.

function axis = veeAxis(matrix)
    axis = zeros(3, 1);
    if isequal(matrix, -matrix')
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
