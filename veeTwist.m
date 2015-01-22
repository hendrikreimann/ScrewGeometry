%% veeTwist
% Vee operator for twists
% Transforms a twist in matrix form to the twist coordinate vector.

function twistCoordinates = veeTwist(twistMatrix)
    twistCoordinates = zeros(6, 1);
    try
        % position
        twistCoordinates(1) = twistMatrix(1, 4);
        twistCoordinates(2) = twistMatrix(2, 4);
        twistCoordinates(3) = twistMatrix(3, 4);
        % axis
        twistCoordinates(4) = twistMatrix(3, 2);
        twistCoordinates(5) = twistMatrix(1, 3);
        twistCoordinates(6) = twistMatrix(2, 1);
    catch exception
        if (size(matrix, 1) ~= 4) || (size(matrix, 2) ~= 4)
            error('matrix must be 4x4')
        else
            rethrow(exception);
        end
    end
end




    
