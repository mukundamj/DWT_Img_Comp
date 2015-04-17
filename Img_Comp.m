%Encoder
clear all;
clc;

fprintf('Starting Image compression using EZW technique\n');

%Scaling for wavelet decomposition
scale = 2;
img = imread('lena256','bmp');

%Wavelet decomposition 
[Wlet_Coeff,S] = wavedec2(img,scale,'db1');

fprintf('Wavelet co-efficients calcutlated for sacle of %d \n',scale);
 
 %Dominant pass
 
 
 %Subordinate pass
 
 
 %Arithmatic coding
 
 
 
 %Generate Bitstream
 
 
 
 %Decoder
 
 %Image display
 
 