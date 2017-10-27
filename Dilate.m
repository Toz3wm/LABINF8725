function [image_d] = Dilate(image,el_struct)
%Renvoie une image dilat� par l'�l�ment structurel
%INPUT : 
%   image : image d'entr�e
%   el_struct : �l�ment structurel 
%OUTPUT : 
%   image_d: image dilat�e

%% Z�ro padding
[image_pad,n_padx,n_pady]=Zero_padding(image,el_struct);
image_pad=boolean(image_pad);

image_d=boolean(zeros(size(image_pad)));


%% Dilatation
[ind_x,ind_y]=find(image_pad); %% Cherche les �l�ments blancs
for k=1:numel(ind_x) % On parcourt les �l�ments blancs
    i=ind_x(k);
    j=ind_y(k); 
    % Pour chaque �l�ment, on recopie l'�l�ment structurel dans le masque
    % autour du pixel en question.
    image_d(i-n_padx:i+n_padx,j-n_pady:j+n_pady)=el_struct+image_d(i-n_padx:i+n_padx,j-n_pady:j+n_pady); 
end

%% R�duction de l'image
image_d=uint8(255*image_d(n_padx+1:end-n_padx,n_pady+1:end-n_pady)); 



end

