function [image_f] = Fermeture_Binaire(image,el_struct)
%Fermeture de l'image par un élément structurel
%Cette fonction réalise successivement la dilatation de l'image par
%l'élément structurel puis l'érosion de l'image dilatée par le même élément
%structurel. 
% On utilise un zéro padding pour traiter les contours.
% Semblable à imerode(imdilate(image_b,el_struct),el_struct)
%
% INPUT :
%   image : image de départ
%   el_struct : élément structurel
% OUTPUT : 
%   image_f : image fermée


%% Dilatation 
disp('Début dilatation')

image_d=Dilate(image,el_struct);

%% Erosion
disp('Début érosion')

image_f=Erode(image_d,el_struct);


end

