function twistCoordinates = veeTwist(twistMatrix)
% Vee-operator se(3) --> R^6
%
% transforms twist matrices to the corresponding twist coordinates
%
% xiHat = VEETWIST(xi) transforms a 4x4 twist matrix xiHat into a 6d twist 
%                      coordinate vector xi
%                        
%
% See also WEDGETWIST
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




    
