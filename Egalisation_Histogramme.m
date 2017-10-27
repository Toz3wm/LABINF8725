function [Ieq] = Egalisation_Histogramme(I)
%Fonction qui renvoie l'image �galis�e
% I image d'entr�e
% Ieq image de sortie �galis�e

hist=imhistReDef(I);

[N,M]=size(I);
Ieq=zeros(N,M);
for i=1:N
    for j=1:M
        Ieq(i,j)=255*sum(hist(1:I(i,j)+1))/(N*M);
    end
end

Ieq=uint8(Ieq);


end

