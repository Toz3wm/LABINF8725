%% Exercice 1

clear all 
close all
clc

%% Question 1
image=imread('theArtist','png');
image_eq=Egalisation_Histogramme(image);
imshow(image_eq)

%% Question 2/3

M_g=1/90*[1 2 1 2 1;
        2 4 8 4 2;  
        1 8 18 8 1;
        2 4 8 4 2;
        1 2 1 2 1];
    
image_conv=Convolution(image_eq,M_g);
imshow(uint8(image_conv))

%% Question 4

K=1.2;
Ir=Rehaussement_Contour(image_conv,K);
imshow(uint8(Ir))

%% Question 5
% Voir cours : 
%- Filtre médian? (contre le grain de poivre)
%- Filtrage spectral (toute une partie sur le traitement du bruit)

%% Exercice 2

clear all
close all
clc

%% Question 1
image=imread('pieces','jpg');
image_gray=0.2989*image(:,:,1)+0.5870*image(:,:,2)+0.1140*image(:,:,3); % On affiche la luminance Y
imshow(image_gray)

%% Question 2

seuil=250;
image_b=Binariser(image_gray,seuil);
image_b=255-image_b;
imshow(image_b)

%% Question 3

el_struct=Element_Structure_Circulaire(9);
image_f=Fermeture_Binaire(image_b,el_struct);
imshow(image_f)
%% Méthodes alternatives : 
% % 1 : imclose
% el_struct2 = strel('disk',9);
% image_f2 = imclose(image_b,el_struct2);
% % 2 : imerode et imdilate
% el_struct3=Element_Structure_Circulaire(9);
% image_f3=imerode(imdilate(image_b,el_struct3),el_struct3);
% imshow(image_f3)




