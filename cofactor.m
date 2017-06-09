
function d = cofactor(a)
%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%Input : a, Any matrix with size nxn                     /
%Output: d, cofactor determinant of a matrix of size nxn / 
%/////////////////////////////////////////////////////////

[n,z] = size(a);

if n == 1
    d = a;
else
    d = 0;
    for k = 1:n
        m = a;
        m(1,:) = [];
        m(:,k) = [];
        d = d+(-1)^(1+k)*a(1,k)*cofactor(m);
    end
end

end