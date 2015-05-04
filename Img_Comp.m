%Encoder
clear all;
clc;

fprintf('Starting Image compression using EZW technique\n');

%Scaling for wavelet decomposition
ip_img_name = 'lena8.bmp';
ip_img = double(imread(ip_img_name));
%Wavelet decomposition 
scale = log2(size(ip_img,1));
[WC,S] = wavedec2(ip_img,scale,'db1');

fprintf('Wavelet co-efficients calcutlated for sacle of %d \n',scale);

S(:,3) = S(:,1).*S(:,2);

len = length(S);

WM = zeros(S(len,1),S(len,2));

% Finding the LL part
WM( 1:S(1,1) , 1:S(1,2) ) = reshape(WC(1:S(1,3)),S(1,1:2));


for i=2:1:len-1
    r = S(i,1);
    c = S(i,2);
    
    %fprintf('Finding the HL part\n')
    start =  S(i,3)+ 1;
    stop = 2*S(i,3);
    rows = (1:r);
    cols = (c+1:sum(S(1:i,2)));
    WM(rows,cols) = reshape(WC(start:stop),S(i,1:2));
    
    %fprintf('Finding the LH part\n');
    start =  stop+ 1;
    stop = start+S(i,3)-1;
    rows = (r+1:sum(S(1:i,1)));
    cols = (1:c);
    WM(rows,cols) = reshape(WC(start:stop),S(i,1:2));
    
    %fprintf('Finding the HH part\n');
    start =  stop+ 1;
    stop = start+S(i,3)-1;
    rows = (r+1:sum(S(1:i,1)));
    cols = (c+1:sum(S(1:i,2)));
    WM(rows,cols)  = reshape(WC(start:stop),S(i,1:2));
end

imwrite(WM,'lena_r1.bmp','bmp');

wavImg = WM;

%minimum threshold- When the maximum wavelet co-efficient is less than this threshold,wavelet encoding will be stopped.

min_threshols = 50;

%Morton scanning: The the wavelet matrix is scanned in the morton scanning
%order.

N = size(wavImg,1);
%Number of bits required to represent the image
nOfBits = log2(N*N);
%Pixel locations from 0 to N^2-1.
matLoc = 0: (N*N)-1;
%Pixel locations in binary
binLoc = dec2bin(matLoc(:),nOfBits);
%finding morton scan order
scanOrder = [bin2dec(binLoc(:,(1:2:nOfBits-1))),bin2dec(binLoc(:,2:2:nOfBits))];

%Dominant pass
[significantMat, subordinateList,newMat] = domPass(
 
 %Subordinate pass
 
 
 %Arithmatic coding
 
 
 
 %Generate Bitstream
 
 
 
 %Decoder
 
 %Image display
 
 