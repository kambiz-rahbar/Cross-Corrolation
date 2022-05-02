clc
clear
close all

n1 = 1:3;
x1 = rand(3,1);
n2 = 1:2;
x2 = rand(2,1);

% n1 = (10 : 0.5 : 14)';
% x1 = sin(0.1*n1);
% 
% n2 = (14 : 0.5 : 18)';
% x2 = cos(0.1*n2);

% test auto correlation
 [nx, rxx,~,~] = my_auto_corr(n1,x1,1);
% disp('matlab results:'); disp(xcorr(x1,x1)');
% disp('my results:'); disp(rxx');

% test cross correlation
[~,r,normalized_r] = my_cross_corr(n1,x1,n2,x2,2);
disp('matlab results:'); disp(xcorr(x1,x2)');
disp('my results:'); disp(r');
