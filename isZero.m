function is_zero = isZero(number)
% decide if a number is close enough to zero to be considered zero
%
% Tolerance is preset to 1e-7

    epsilon = 1e-7;
    is_zero = (max(abs(reshape(number, 1, numel(number)))) < epsilon);
end