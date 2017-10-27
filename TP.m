<<<<<<< HEAD
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
%Sur l'image réhaussée, une partie du bruit qui avait été atténué par le
%filtrage gaussien est revenu; ce qui est logique puisque le
%réhaussement des contours réhausse également les contours du bruit. On
%note cependant qu'il semble de fréquence plus basse qu'auparavant. On
%remarque également que le bruit de type "poivre et sel" qui existait sur
%l'image est toujours bien présent.

% Le filtrage gaussien, s'il a réduit le bruit, n'a fait que "diluer" le
% bruit de type "poivre et sel" qui existe sur l'image. 
%Pour atténuer ce bruit poivre et sel, on pourrait utiliser un filtrage
%médian ou médian adaptatif qui est plus puissant. Ce genre de filtre est
%extrêmement efficace pour atténuer le bruit de type "poivre et sel", et
%les versions adaptatives ne dégradent pas trop les contours. Si malgré
%tout les contours étaient trop dégradées, on pourrait appliquer le filtre
%médian avant d'utiliser le filtre gaussian et le réhaussement. Ainsi le
%bruit "poivre et sel" ne serait pas dilué par le filtre gaussien, et la
%dégradation des contours occasionnée par le filtre médian pourrait être
%atténuée par le rehaussement des contours que nous venons de voir.
%Eventuellement, il serait aussi possible d'utiliser un filtrage spectral
%passe-bas qui peut également gérer ce bruit, mais le filtre médian semble
%plus pertinent.
%% Exercice 2

clear all
close all
clc

%% Question 1
image=imread('pieces','jpg');
%Formule donnant l'image en niveau de gris. 
%Après vérifications, le résultat est le même que celui renvoyé par
%rgb2grey
image_gray=0.2989*image(:,:,1)+0.5870*image(:,:,2)+0.1140*image(:,:,3);

% On affiche la luminance Y
imshow(image_gray)

%% Question 2

seuil=250;
image_b=Binariser(image_gray,seuil);
image_b=255-image_b;
imshow(image_b)

%% Question 3



n_pad=2;
%el_struct=zeros(2*n_pad+1,2*n_pad+1);
el_struct=[0 0 1 0 0;0 1 1 1 0;1 1 1 1 1;0 1 1 1 0; 0 0 1 0 0];


n_M=length(el_struct);
n_pad=(n_M-1)/2; %Masque symétrique
[n,m]=size(image_b);

%% Padding de l'image 
image_pad=[zeros(n+n_M-1,n_pad) [zeros(n_pad,m); image_b; zeros(n_pad,m)] zeros(n+n_M-1,n_pad)];
image_pad=double(image_pad);
[n_ipad,m_ipad]=size(image_pad);
count=1;

image_b2=double(image_b);

[ind_x,ind_y]=find(image_b==255);
for k=1:numel(ind_x)
    i=ind_x(k);
    j=ind_y(k);
    image_b2(i-n_pad:i+n_pad,j-n_pad:j+n_pad)=el_struct+image_b2(i-n_pad:i+n_pad,j-n_pad:j+n_pad); % Un peu moche mais bon
    disp(count/numel(ind_x))
    count=count+1;
end

image_b2(image_b2>0)=255;
image_b2=image_b2(n_pad+1:end-n_pad,n_pad+1:end-n_pad);

%%
SE = strel('disk',10);

IM2 = imclose(image_b,SE);
imshow(IM2)



=======
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




>>>>>>> 2555d7d292715211e4f2521aff3fa6cfd3bc1c89
