% Experiment 8: FIR realization using direct cascade and linear phase structures
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
b=[1 2 1]/4; x=[1 zeros(1,39)]; yDirect=filter(b,1,x);
% Cascade factors multiply to the same FIR transfer function.
sos=[1 1 0 1 0 0; 0.25 0.25 0 1 0 0]; yCascade=sosfilt(sos,x);
figure; subplot(2,1,1); stem(0:39,yDirect,'filled'); hold on; stem(0:39,yCascade,'o'); grid on; legend('Direct','Cascade'); title('Impulse responses');
[H,w]=freqz(b,1,512); subplot(2,1,2); plot(w/pi,unwrap(angle(H))); grid on; xlabel('Normalized frequency'); ylabel('Phase (rad)'); title('Linear phase response');
