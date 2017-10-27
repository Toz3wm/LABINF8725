%% Exercice 3 : Transformée de Fourier 2D


clear all 
close all
clc

%% Question 1

b_ver = imread('Barres_Verticales','png');
b_hor = imread('Barres_Horizontales','png');
b_obl = imread('Barres_Obliques','png');

figure
imshow(b_ver);
figure
imshow(b_hor);
figure
imshow(b_obl);

%% Question 2
fft_ver = fftshift(abs(fft2(b_ver)));
fft_hor = fftshift(abs(fft2(b_hor)));
fft_obl = fftshift(abs(fft2(b_obl)));

fft_ver_norm = fft_ver;
fft_hor_norm = log(1+fft_hor/max(max(fft_hor)));
fft_obl_norm = log(1+fft_obl);

imshow(fft_ver_norm,[]);
figure
imshow(fft_hor_norm,[]);
figure
imshow(fft_obl_norm,[]);
















