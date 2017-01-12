%     This file is part of the ScrewGeometry library
%     Copyright (C) 2017 Hendrik Reimann <hendrikreimann@gmail.com>
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.


function angle = normalizeAngle(angle)
% normalizes an angle in radian to the interval (-pi, pi]
%
% phi_normalized = NORMALIZEANGLE(phi) subtracts or adds 2PI to each
% element in phi. Phi can be a scalar or a multi-dimensional array.

while any(any(angle <= -pi))
    angle(angle <= -pi) = angle(angle <= -pi) + 2*pi;
end
while any(any(angle > pi))
    angle(angle > pi) = angle(angle > pi) - 2*pi;
end
    