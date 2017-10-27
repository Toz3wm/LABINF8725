function [ hist ] = imhistReDef( img )
%IMHISTREDEF redéfinit imhist
%   Detailed explanation goes here

hist = zeros(256,1);
for i = 1:256
    [a, b] = size(img(img == i));
    hist(i) = a;
end

end

