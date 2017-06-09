%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%/////////////////////////////////////////////////////////
clc; close all; clear all
%% Observing Difference between Runtimes of our two methods
n  = 8; %Setting this above ~8 will make the script run VERY LONG!
t1 = zeros(1:length(n),1);t2 = zeros(1:length(n),1);

fprintf('Iteration        T1              T2       \r')
fprintf('          Gauss Determinant   Cofactors   \r')   
fprintf('------------------------------------------\r')
for i = 1:n
    A = magic(i);
    tic; gaussdet(A); t1(i) = toc;
    tic; cofactor(A); t2(i) = toc;
    fprintf('#%g              %.04f         %.04f      \r',i,t1(i),t2(i));
end

figure(1)
subplot(2,1,1)
plot(1:n,t1,'r')
title('Gaussdet Function'); xlabel('Matrix Size');ylabel('Time (seconds)')

subplot(2,1,2)
plot(1:n,t2,'b')
title('Cofactor Function'); xlabel('Matrix Size');ylabel('Time (seconds)')

figure(2)
hold on
plot(1:n,t1,'rx'); plot(1:n,t2,'b:')
title('Combined Functions'); xlabel('Matrix Size'); ylabel('Time (seconds)'); legend('gaussdet','cofactor'); hold off

clear t1 t2 A n
%% Finding the Condition number of a Matrix and plotting against its Volume


n = 4 ; % Matrix Size
k = 1000; %Iterations
Volume = zeros(1,k);
condPlot = zeros(1,k);
for i = 1:k
    A = rand(n);
    A = A*diag(1./sqrt(sum(A.*A)));
    
    Volume(i) = abs(det(A));
    condPlot(i) = 1/cond(A);
end
maxVol = max(Volume);
minVol = min(Volume);
[ maxVol , con_maxVol] = max(Volume);
[ minVol , con_minVol] = min(Volume);
conMaxV = condPlot(con_maxVol);
conMinV = condPlot(con_minVol);
c = linspace(1,10,length(Volume));
figure(3)
hold on
colorData = uint8([210:5:255; 0:28:252; [0:10:50,40:-10:10]; 200:-10:110]);
plot(maxVol,conMaxV,'xr','MarkerSize',10)
plot(minVol,conMinV,'diamondr','MarkerSize',10)
scatter(Volume,condPlot,[],c);

string1 = sprintf('Vol= %g\nCond= %g',maxVol,conMaxV);
string2 = sprintf('Vol= %g\nCond= %g',minVol,conMinV);
xlabel('Volume');ylabel('1/Condition #')
legend( [] ,string1,string2)
hold off

fprintf('    Volume    Cond # \n')
fprintf('---------------------\n')
fprintf('Max %.03f     %.03f  \n',maxVol,conMaxV)
fprintf('Min %.03f     %.03f  \n',minVol,conMinV)