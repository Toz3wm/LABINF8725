function [image_b] = Binariser(image,seuil)
%met � 0 tous les pixels se trouvant en dessous du seuil, et � 255 tous les pixels se trouvant sur le seuil ou au dessus.
% image : image d'entr�e
% seuil : seuil de d�cision
% image_b : image de sortie

image_b=image;
image_b(image<seuil)=0;
image_b(image>=seuil)=255;

end

