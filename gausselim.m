
function d = gausselim(a)
%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%Input : a, Any matrix with size nxn                     /
%Output: d, determinant of a matrix of size nxn          / 
%/////////////////////////////////////////////////////////
n = length(a);    

for j = 1:n
    den = a(j,j);
    for i = j+1:n
        mult = a(i,j)/den;
        a(i,j+1:n) = a(i,j+1:n)-mult*a(j,j+1:n);
    end
end
d = zeros(1,n);
for j = 1:n
d(j) = a(j,j);  
end

d = prod(d);

end