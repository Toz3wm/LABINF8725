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



