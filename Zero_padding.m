function [image_pad,n_padx,n_pady] = Zero_padding(image,masque)
%Applique un z�ro padding � une image 2D en noir et blanc. Le padding est
%adapt� pour des masques centr�s.
% INPUT :
%   image : image d'entr�e
%   masque: masque utilis�e
% OUTPUT :
%   image_pad : image padd�e adapt�e pour le masque
%   n_padx : nombre de pixels padd�s dans la direction verticale
%   n_pady : nombre de pixels padd�s dans la direction horizontale


[n,m]=size(image);
[n_Mx,n_My]=size(masque);
n_padx=(n_Mx-1)/2;
n_pady=(n_My-1)/2;

image_pad=[zeros(n+n_Mx-1,n_pady) [zeros(n_padx,m); image; zeros(n_padx,m)] zeros(n+n_Mx-1,n_pady)];

end

