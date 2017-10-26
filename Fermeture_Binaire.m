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

%% Padding de l'image 

[n,m]=size(image);
[n_Mx,n_My]=size(el_struct);
n_padx=(n_Mx-1)/2; 
n_pady=(n_My-1)/2; 

image_pad=[zeros(n+n_Mx-1,n_pady) [zeros(n_padx,m); image; zeros(n_padx,m)] zeros(n+n_Mx-1,n_pady)];
image_pad=boolean(image_pad);

%% Dilatation 
disp('Début dilatation')

image_d=boolean(zeros(size(image_pad)));

[ind_x,ind_y]=find(image_pad); %% Cherche les éléments blancs
for k=1:numel(ind_x) % On parcourt les éléments blancs
    i=ind_x(k);
    j=ind_y(k); 
    % Pour chaque élément, on recopie l'élément structurel dans le masque
    % autour du pixel en question.
    image_d(i-n_padx:i+n_padx,j-n_pady:j+n_pady)=el_struct+image_d(i-n_padx:i+n_padx,j-n_pady:j+n_pady); 
end


% Pour retrouver l'image dilatée (inutile car image paddée directement réutilisée)
% image_b2=255*image_b2(n_pad+1:end-n_pad,n_pad+1:end-n_pad); 
%% Erosion (il faudrait refaire le padding mais on ne rogne pas b2)
disp('Début érosion')

image_e=zeros(size(image_d));

[ind_x,ind_y]=find(image_d); % Cherche les éléments blancs
for k=1:numel(ind_x)
    i=ind_x(k);
    j=ind_y(k);
    % Pour chaque élément, on regarde si l'élément structurel fait parti
    % des éléments blancs (si la multiplication du masque du voisinage avec
    % l'élément structurel est égal à l'élément structurel)
    if isequal(image_d(i-n_padx:i+n_padx,j-n_pady:j+n_pady).*el_struct,el_struct)
        % Dans ce cas, on ajoute le pixel central à l'image érodée.
        image_e(i,j)=1;
    end
end



%% Image finale convertie en uint8

image_f=255*image_e(n_padx+1:end-n_padx,n_pady+1:end-n_pady);





end

