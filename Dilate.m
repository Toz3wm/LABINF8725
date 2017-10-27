function [image_d] = Dilate(image,el_struct)
%Renvoie une image dilaté par l'élément structurel
%INPUT : 
%   image : image d'entrée
%   el_struct : élément structurel 
%OUTPUT : 
%   image_d: image dilatée

%% Zéro padding
[image_pad,n_padx,n_pady]=Zero_padding(image,el_struct);
image_pad=boolean(image_pad);

image_d=boolean(zeros(size(image_pad)));


%% Dilatation
[ind_x,ind_y]=find(image_pad); %% Cherche les éléments blancs
for k=1:numel(ind_x) % On parcourt les éléments blancs
    i=ind_x(k);
    j=ind_y(k); 
    % Pour chaque élément, on recopie l'élément structurel dans le masque
    % autour du pixel en question.
    image_d(i-n_padx:i+n_padx,j-n_pady:j+n_pady)=el_struct+image_d(i-n_padx:i+n_padx,j-n_pady:j+n_pady); 
end

%% Réduction de l'image
image_d=uint8(255*image_d(n_padx+1:end-n_padx,n_pady+1:end-n_pady)); 



end

