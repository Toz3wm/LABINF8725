function [Ir] = Rehaussement_Contour(I,K)
%Prend en entrée une image et le paramètre K, puis retourne l’image rehaussée
%I : image d'entrée
%K : paramètre du filtre
%Ir: image réhaussée

G=1/16*[1 2 1;
        2 4 2;
        1 2 1];
L2=[-1 -1 -1;
    -1 8 -1;
    -1 -1 -1];
Ig=Convolution(I,G);
Il=Convolution(Ig,L2);


Ir=Ig+K*Il;

min(min(Ir));
max(max(Ir));

%On constate que les valeurs de l'image oscillent entre -63 et +420.
%Il faut donc ramener les valeurs entre 0 et 255.
%Après tests, une transformation affine telle que celle ci-dessous atténue
%trop le contraste de l'image. 
%Ir = Ir - min(min(Ir));
%Ir = 255 * Ir/max(max(Ir));
%On choisit donc tout simplement de ramener les valeurs négatives à 0 et 
%celles supérieures à 255 à 255 (ce qu'aurait fait une conversion en uint8
% "brutale" de toute manière) 
%La transformation est non linéaire mais permet de conserver un contraste
%élevé.

Ir(Ir < 0) = 0;
Ir(Ir > 255) = 255;



end

