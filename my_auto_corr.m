function [nr, r, normalized_r, signal_energy] = my_auto_corr(n, x, disp_res)
% n: sample idx
% x: signal

if length(n)~=length(x)
    n = 1:length(x);
end

if ~exist('disp_res','var')
    disp_res = 0;
end

r = xcorr(x,x);

idx = 0; % r_xx[0]
corr_idx = idx + length(n);
signal_energy = r(corr_idx);

normalized_r = r./signal_energy;

nr = -length(n)+1:length(n)-1;
nr = nr + min(n);

if disp_res
    figure(disp_res);
    subplot(2,2,1); stem(n,x); xlim([min(n) max(n)]); title('main signal');
    subplot(2,2,2); stem(nr,r); xlim([min(nr) max(nr)]);  title('AC');
    subplot(2,2,3); stem(nr,normalized_r); xlim([min(nr) max(nr)]);  title('NAC');
end
