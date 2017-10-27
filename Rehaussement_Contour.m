function [Ir] = Rehaussement_Contour(I,K)
%Prend en entr�e une image et le param�tre K, puis retourne l�image rehauss�e
%I : image d'entr�e
%K : param�tre du filtre
%Ir: image r�hauss�e

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
%Apr�s tests, une transformation affine telle que celle ci-dessous att�nue
%trop le contraste de l'image. 
%Ir = Ir - min(min(Ir));
%Ir = 255 * Ir/max(max(Ir));
%On choisit donc tout simplement de ramener les valeurs n�gatives � 0 et 
%celles sup�rieures � 255 � 255 (ce qu'aurait fait une conversion en uint8
% "brutale" de toute mani�re) 
%La transformation est non lin�aire mais permet de conserver un contraste
%�lev�.

Ir(Ir < 0) = 0;
Ir(Ir > 255) = 255;



end

