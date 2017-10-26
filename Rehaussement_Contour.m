function [Ir] = Rehaussement_Contour(I,K)
%Prend en entr�e une image et le param�tre K, puis retourne l�image rehauss�e
%I : image d'entr�e
%K : param�tre du filtre
%Ir: image r�hauss�e

G=1/16*[1 2 1; 2 4 2; 1 2 1];
L2=[-1 -1 -1;-1 8 -1;-1 -1 -1];
Ig=Convolution(I,G);
Il=Convolution(Ig,L2);
Il(Il<0)=0;
Ir=Ig+K*Il;

end

