function GS = GreyScale( I )
I = imread(I);
R=I(:,:,1); %mengambil nilai R(Red) dari I(image)
G=I(:,:,2); %mengambil nilai G(Green) dari I(image)
B=I(:,:,3); %mengambil nilai B(Blue) dari I(image)
abu = (0.3*R)+(0.5*G)+(0.2*B);  %proses merubah image menjadi grey level
figure,imshow(abu);
figure,imhist(abu);
end

