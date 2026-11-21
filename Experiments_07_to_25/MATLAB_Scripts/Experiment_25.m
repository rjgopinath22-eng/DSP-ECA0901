% Experiment 25: FFT based beamforming for 5G wireless communication
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
M=8; d=0.5; theta= -90:0.1:90; steer=20; m=(0:M-1)'; a=@(th) exp(1j*2*pi*d*m*sind(th)); w=a(steer)/M; pat=cellfun(@(z)abs(w'*z),arrayfun(@(th)a(th),theta,'UniformOutput',false)); pat=pat/max(pat);
figure; plot(theta,20*log10(pat+eps)); ylim([-50 0]); grid on; xlabel('Angle (degrees)'); ylabel('Normalized response (dB)'); title('8-element ULA beam steered to 20 degrees');
