% Experiment 11: Overflow effects and signal scaling in digital filters
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
N=4; B=8; xmax=1-2^(-(B-1)); x=1.5*sin(2*pi*(0:199)/30); b=ones(1,N)/N;
y=filter(b,1,x); ysat=min(max(y,-xmax),xmax); span=2*xmax; ywrap=mod(y+xmax,span)-xmax; scale=0.55; ys=filter(b,1,scale*x);
figure; plot(y,'k'); hold on; plot(ysat); plot(ywrap); plot(ys); grid on
legend('Ideal','Saturation','Wrap-around','Scaled input'); title('Finite word length overflow behavior'); xlabel('Sample'); ylabel('Amplitude');
