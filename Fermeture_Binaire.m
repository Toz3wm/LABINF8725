function [image_f] = Fermeture_Binaire(image,el_struct)
%Fermeture de l'image par un �l�ment structurel
%Cette fonction r�alise successivement la dilatation de l'image par
%l'�l�ment structurel puis l'�rosion de l'image dilat�e par le m�me �l�ment
%structurel. 
% On utilise un z�ro padding pour traiter les contours.
% Semblable � imerode(imdilate(image_b,el_struct),el_struct)
%
% INPUT :
%   image : image de d�part
%   el_struct : �l�ment structurel
% OUTPUT : 
%   image_f : image ferm�e


%% Dilatation 
disp('D�but dilatation')

image_d=Dilate(image,el_struct);

%% Erosion
disp('D�but �rosion')

image_f=Erode(image_d,el_struct);


end

