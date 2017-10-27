function [image_pad,n_padx,n_pady] = Zero_padding(image,masque)
%Applique un zéro padding à une image 2D en noir et blanc. Le padding est
%adapté pour des masques centrés.
% INPUT :
%   image : image d'entrée
%   masque: masque utilisée
% OUTPUT :
%   image_pad : image paddée adaptée pour le masque
%   n_padx : nombre de pixels paddés dans la direction verticale
%   n_pady : nombre de pixels paddés dans la direction horizontale


[n,m]=size(image);
[n_Mx,n_My]=size(masque);
n_padx=(n_Mx-1)/2;
n_pady=(n_My-1)/2;

image_pad=[zeros(n+n_Mx-1,n_pady) [zeros(n_padx,m); image; zeros(n_padx,m)] zeros(n+n_Mx-1,n_pady)];

end

