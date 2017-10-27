function [el_struct] = Element_Structure_Circulaire(R)
%Définit un élément structurel circulaire centré
%INPUT : 
%   R: Rayon du cercle
%OUTPUT : 
%   el_struct : élément structurel


el_struct=zeros(2*R+1,2*R+1);

for i=1:2*R+1
    for j=1:2*R+1
        if((i-(R+1))^2+(j-(R+1))^2<=R^2) % Equation du cercle
           el_struct(i,j)=1; 
        end
    end
end



end

