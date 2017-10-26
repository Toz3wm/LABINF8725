function [image_conv] = Convolution(image,M)
%Prend en argument une image et un masque et fait la convolution des deux
% ATTENTION : résultat pas en uint8
% image : image d'entrée
% M : masque
% image_conv : image convoluée

n_M=length(M);
n_pad=(n_M-1)/2; %Masque symétrique
[n,m]=size(image);

%% Padding de l'image 
image_pad=[zeros(n+n_M-1,n_pad) [zeros(n_pad,m); image; zeros(n_pad,m)] zeros(n+n_M-1,n_pad)];
image_pad=double(image_pad);
[n_ipad,m_ipad]=size(image_pad);

%% Convolution avec le masque
image_conv=zeros(size(image_pad));
for i=1+n_pad:n_ipad-n_pad
    for j=1+n_pad:m_ipad-n_pad
         image_conv(i,j)=sum(sum(image_pad(i-n_pad:i+n_pad,j-n_pad:j+n_pad).*M));
    end
end

image_conv=image_conv(n_pad+1:end-n_pad,n_pad+1:end-n_pad);



end

