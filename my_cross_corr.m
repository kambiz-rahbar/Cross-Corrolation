function [r,normalized_r] = my_cross_corr(x,y)

[~,~,rx0] = my_auto_corr(x);
[~,~,ry0] = my_auto_corr(y);

y = flip(y);
r = conv(x,y);

normalized_r = r ./sqrt(rx0*ry0);

tx = 1:length(x);
ty = 1:length(y);
tr = 1: length(x)+length(y)-1;
tr = tr - ceil(length(tr)/2);

figure;
subplot(2,2,1); stem(tx,x); title('x');
subplot(2,2,2); stem(ty,y); title('y');
subplot(2,2,3); stem(tr,r); title('XC');
subplot(2,2,4); stem(tr,normalized_r); title('NXC');

