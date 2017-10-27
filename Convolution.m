function [image_conv] = Convolution(image,M)
%Prend en argument une image et un masque et fait la convolution des deux
% ATTENTION : résultat pas en uint8
% image : image d'entrée
% M : masque
% image_conv : image convoluée

[n_Mx, n_My] =size(M);
%le masque doit être de taille impaire pour être centré sur un pixel
n_padx=(n_Mx-1)/2;
n_pady = (n_My-1)/2;

[n,m]=size(image);

%% Padding de l'image 
image_pad=[zeros(n+n_Mx-1,n_pady) [zeros(n_padx,m); image; zeros(n_padx,m)] zeros(n+n_Mx-1,n_pady)];
image_pad=double(image_pad);
[n_ipad,m_ipad]=size(image_pad);

%% Convolution avec le masque
image_conv=zeros(size(image_pad));
for i=1+n_padx:n_ipad-n_padx
    for j=1+n_pady:m_ipad-n_pady
         image_conv(i,j)=sum(sum(image_pad(i-n_padx:i+n_padx,j-n_pady:j+n_pady).*M));
    end
end

image_conv=image_conv(n_padx+1:end-n_padx,n_pady+1:end-n_pady);



end

