clc
clear
close all

x = rand(100,1);
y = rand(50,1);

[r,normalized_r] = my_cross_corr(x,y);

