% Experiment 23: Image enhancement compression and edge detection
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
I=im2double(imread('cameraman.tif')); enhanced=imgaussfilt(I,0.6); enhanced=imadjust(enhanced); compressed=im2double(im2uint8(enhanced)); edges=edge(I,'canny');
figure; tiledlayout(2,2); nexttile; imshow(I); title('Original'); nexttile; imshow(enhanced); title('Enhanced'); nexttile; imshow(compressed); title('8-bit compressed/reconstructed'); nexttile; imshow(edges); title('Canny edges');
fprintf('PSNR (8-bit reconstruction): %.2f dB\n',psnr(compressed,enhanced));
