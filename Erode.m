function [image_e] = Erode(image,el_struct)
%Renvoie une image dilaté par l'élément structurel
%INPUT : 
%   image : image d'entrée
%   el_struct : élément structurel 
%OUTPUT : 
%   image: image dilatée

%% Zéro padding
[image_pad,n_padx,n_pady]=Zero_padding(image,el_struct);
image_pad=boolean(image_pad);

image_e=boolean(zeros(size(image_pad)));


%% Erosion
[ind_x,ind_y]=find(image_pad); % Cherche les éléments blancs
for k=1:numel(ind_x)
    i=ind_x(k);
    j=ind_y(k);
    % Pour chaque élément, on regarde si l'élément structurel fait parti
    % des éléments blancs (si la multiplication du masque du voisinage avec
    % l'élément structurel est égal à l'élément structurel)
    if isequal(image_pad(i-n_padx:i+n_padx,j-n_pady:j+n_pady).*el_struct,el_struct)
        % Dans ce cas, on ajoute le pixel central à l'image érodée.
        image_e(i,j)=1;
    end
end



%% Réduction de l'image
image_e=uint8(255*image_e(n_padx+1:end-n_padx,n_pady+1:end-n_pady));


end

