%% decide if a number is close enough to zero to be considered zero

function is_zero = isZero(number)
    epsilon = 1e-8;
    is_zero = (abs(number) < epsilon);
end