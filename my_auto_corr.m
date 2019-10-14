function [r,normalized_r,signal_energy] = my_auto_corr(x)

t = 1:length(x);

figure;
subplot(2,2,1); stem(t,x); title('main signal');

tr = -length(t)+1:length(t)-1;
r = xcorr(x,x);

subplot(2,2,2); stem(tr,r); title('AC');

idx = 0; % r_xx[0]
corr_idx = idx + length(t);
signal_energy = r(corr_idx);

normalized_r = r./signal_energy;
subplot(2,2,3); stem(tr,normalized_r); title('NAC');
