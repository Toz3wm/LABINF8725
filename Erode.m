function [image_e] = Erode(image,el_struct)
%Renvoie une image dilat� par l'�l�ment structurel
%INPUT : 
%   image : image d'entr�e
%   el_struct : �l�ment structurel 
%OUTPUT : 
%   image: image dilat�e

%% Z�ro padding
[image_pad,n_padx,n_pady]=Zero_padding(image,el_struct);
image_pad=boolean(image_pad);

image_e=boolean(zeros(size(image_pad)));


%% Erosion
[ind_x,ind_y]=find(image_pad); % Cherche les �l�ments blancs
for k=1:numel(ind_x)
    i=ind_x(k);
    j=ind_y(k);
    % Pour chaque �l�ment, on regarde si l'�l�ment structurel fait parti
    % des �l�ments blancs (si la multiplication du masque du voisinage avec
    % l'�l�ment structurel est �gal � l'�l�ment structurel)
    if isequal(image_pad(i-n_padx:i+n_padx,j-n_pady:j+n_pady).*el_struct,el_struct)
        % Dans ce cas, on ajoute le pixel central � l'image �rod�e.
        image_e(i,j)=1;
    end
end



%% R�duction de l'image
image_e=uint8(255*image_e(n_padx+1:end-n_padx,n_pady+1:end-n_pady));


end

