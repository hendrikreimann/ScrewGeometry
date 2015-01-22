%% wedgeTwist
% Transforms the 6d coordinate vector of a twist to the matrix representation.

function twistMatrix = wedgeTwist(twistCoordinates)
    twistMatrix = zeros(4, 4);
    try
        twistMatrix(1, 2) = -twistCoordinates(6);
        twistMatrix(1, 3) = twistCoordinates(5);
        twistMatrix(2, 1) = twistCoordinates(6);
        twistMatrix(2, 3) = -twistCoordinates(4);
        twistMatrix(3, 1) = -twistCoordinates(5);
        twistMatrix(3, 2) = twistCoordinates(4);

        twistMatrix(1, 4) = twistCoordinates(1);
        twistMatrix(2, 4) = twistCoordinates(2);
        twistMatrix(3, 4) = twistCoordinates(3);
    catch exception
        if length(twistMatrix) ~= 6
            error('twistCoordinates must be a vector of length 6')
        else
            rethrow(exception)
        end
    end
end