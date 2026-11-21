% Experiment 21: LMS and NLMS algorithms for adaptive echo cancellation and equalization
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
N=4000; u=randn(N,1); h=[0.7; zeros(7,1); 0.35]; d=filter(h,1,u)+0.03*randn(N,1); L=16; mu=0.01; w=zeros(L,1); e=zeros(N,1); y=zeros(N,1);
for k=L:N, xk=u(k:-1:k-L+1); y(k)=w'*xk; e(k)=d(k)-y(k); w=w+mu*e(k)*xk; end
wn=zeros(L,1); en=zeros(N,1); for k=L:N, xk=u(k:-1:k-L+1); yk=wn'*xk; en(k)=d(k)-yk; wn=wn+(0.5/(1e-6+xk'*xk))*en(k)*xk; end
figure; plot(10*log10(movmean(e.^2,100)+eps)); hold on; plot(10*log10(movmean(en.^2,100)+eps)); grid on; legend('LMS','NLMS'); xlabel('Sample'); ylabel('Smoothed error power (dB)'); title('Adaptive filter convergence');
