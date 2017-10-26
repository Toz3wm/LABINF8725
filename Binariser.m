function [image_b] = Binariser(image,seuil)
%met à 0 tous les pixels se trouvant en dessous du seuil, et à 255 tous les pixels se trouvant sur le seuil ou au dessus.
% image : image d'entrée
% seuil : seuil de décision
% image_b : image de sortie

image_b=image;
image_b(image<seuil)=0;
image_b(image>=seuil)=255;

end

