function [Ir] = Rehaussement_Contour(I,K)
%Prend en entrée une image et le paramètre K, puis retourne l’image rehaussée
%I : image d'entrée
%K : paramètre du filtre
%Ir: image réhaussée

G=1/16*[1 2 1; 2 4 2; 1 2 1];
L2=[-1 -1 -1;-1 8 -1;-1 -1 -1];
Ig=Convolution(I,G);
Il=Convolution(Ig,L2);
Il(Il<0)=0;
Ir=Ig+K*Il;

end

