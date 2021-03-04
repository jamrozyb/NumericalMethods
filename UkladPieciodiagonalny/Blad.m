function [b] = Blad(A,b,p)
% obliczanie blędu do rysowania wykresu 
    %[x,det_A,det_A_inverse]=RozwiazanieUkladuPieciodiagonalna(A,b);
    [x,det_A,det_A_inverse]=RozwiazanieUkladuPieciodiagonalnaWyznaczenieOdwrotnej(A,b);
    A5=ObcinanieDo5Diagonali(A);
    x_wbudowane=A5\ b'
    b=norm(x,p)-norm(x_wbudowane,p)
end    

