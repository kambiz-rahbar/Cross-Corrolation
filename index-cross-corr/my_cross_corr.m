function [nr,r,normalized_r] = my_cross_corr(n1,x1,n2,x2,disp_res)
% n1 & n2: sample indexes
% x1 & x2: signals

if length(n1)~=length(x1)
    n1 = 1:length(x1);
end

if length(n2)~=length(x2)
    n2 = 1:length(x2);
end

if ~exist('disp_res','var')
    disp_res = 0;
end

[~,~,~,rx0] = my_auto_corr([],x1);
[~,~,~,ry0] = my_auto_corr([],x2);

x2_flip = flip(x2);
r = conv(x1,x2_flip);

normalized_r = r ./sqrt(rx0*ry0);

nr = 1: length(x1)+length(x2)-1;
nr = nr - ceil(length(nr)/2);

nr = nr + min(n1);

if disp_res
    figure(disp_res);
    subplot(2,2,1); stem(n1,x1); xlim([min(n1) max(n1)]);  title('x1');
    subplot(2,2,2); stem(n2,x2); xlim([min(n2) max(n2)]);  title('x2');
    subplot(2,2,3); stem(nr,r); xlim([min(nr) max(nr)]); title('XC');
    subplot(2,2,4); stem(nr,normalized_r); xlim([min(nr) max(nr)]); title('NXC');
end
