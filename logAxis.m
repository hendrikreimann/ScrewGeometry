%% logAxis
% inverse of exp: so(3) -> SO(3)
% Transforms a rotation matrix to its axis and angle of rotation, by
% default the angle is positive.
function [axis, angle] = logAxis(rotationMatrix, useNegativeTheta)
    axis = zeros(3, 1);
    if nargin < 2
        useNegativeTheta = false;
    end
    try
        rotation_matrix_trace = trace(rotationMatrix);
        % calculate rotation angle
        angle = acos((rotation_matrix_trace - 1.0) / 2.0);
        if (rotation_matrix_trace <= -1.0)
            % capture numeric failures for rotation_matrix_trace very close to one
            angle = pi;
        end
        if useNegativeTheta
            angle = 2.0 * pi - angle;
        end    
        % calculate axis of rotation
        sin_theta = sin(angle);
        cos_theta = cos(angle);
        axis(1, 1) = 1 / (2 * sin_theta) * (rotationMatrix(3, 2) - rotationMatrix(2, 3));
        axis(2, 1) = 1 / (2 * sin_theta) * (rotationMatrix(1, 3) - rotationMatrix(3, 1));
        axis(3, 1) = 1 / (2 * sin_theta) * (rotationMatrix(2, 1) - rotationMatrix(1, 2));
        axis = axis * (1 / norm(axis));

        if (isZero(angle - pi))
            % easy way of calculating axis fails for numerical reasons, choose different formula, depending on signs
            if ((rotationMatrix(2, 1) > 0) && (rotationMatrix(3, 1) > 0) && (rotationMatrix(3, 2) > 0))

              axis(1, 1) = + sqrt((rotationMatrix(1, 1) - cos_theta) / (1-cos_theta));
              axis(2, 1) = + sqrt((rotationMatrix(2, 2) - cos_theta) / (1-cos_theta));
              axis(3, 1) = + sqrt((rotationMatrix(3, 3) - cos_theta) / (1-cos_theta));
            end
            if ((rotationMatrix(2, 1) > 0) && (rotationMatrix(3, 1) > 0) && (rotationMatrix(3, 2) < 0))

              axis(1, 1) = + sqrt((rotationMatrix(1, 1) - cos_theta) / (1-cos_theta));
              axis(2, 1) = + sqrt((rotationMatrix(2, 2) - cos_theta) / (1-cos_theta));
              axis(3, 1) = - sqrt((rotationMatrix(3, 3) - cos_theta) / (1-cos_theta));
            end
            if ((rotationMatrix(2, 1) < 0) && (rotationMatrix(3, 1) > 0) && (rotationMatrix(3, 2) < 0))

              axis(1, 1) = + sqrt((rotationMatrix(1, 1) - cos_theta) / (1-cos_theta));
              axis(2, 1) = - sqrt((rotationMatrix(2, 2) - cos_theta) / (1-cos_theta));
              axis(3, 1) = + sqrt((rotationMatrix(3, 3) - cos_theta) / (1-cos_theta));
            end
            if ((rotationMatrix(2, 1) < 0) && (rotationMatrix(3, 1) < 0) && (rotationMatrix(3, 2) > 0))

              axis(1, 1) = + sqrt((rotationMatrix(1, 1) - cos_theta) / (1-cos_theta));
              axis(2, 1) = - sqrt((rotationMatrix(2, 2) - cos_theta) / (1-cos_theta));
              axis(3, 1) = - sqrt((rotationMatrix(3, 3) - cos_theta) / (1-cos_theta));
            end
        end
        angle = normalizeAngle(angle);
    catch exception
        rethrow(exception);
    end


