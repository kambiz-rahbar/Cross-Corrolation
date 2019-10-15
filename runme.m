clc
clear
close all

x = rand(3,1);
y = rand(2,1);


% test auto correlation
% [rxx,~,~] = my_auto_corr(x);
% disp('matlab results:'); disp(xcorr(x,x)')
% disp('my results:'); disp(rxx')


% test cross correlation
[r,normalized_r] = my_cross_corr(x,y);
disp('matlab results:'); disp(xcorr(x,y)')
disp('my results:'); disp(r')
