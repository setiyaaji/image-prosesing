function cs = ContrastStreching( I )
I=imread(I);   %membaca Image pada variabel I
R=I(:,:,1); %mengambil nilai R(Red) dari I(image)
G=I(:,:,2); %mengambil nilai G(Green) dari I(image)
B=I(:,:,3); %mengambil nilai B(Blue) dari I(image)
abu = (0.3*R)+(0.5*G)+(0.2*B);  %proses merubah image menjadi grey level
abu=double(abu);    %membaca array citra keabuan dalam type double
[baris kolom] = size(abu);    %menentukan size matrik dari citra
%inisialisasi titik-titik transformasi Contrast Streching dengan masukkan user
x1= input('masukkan point x1 [x,-] : ');
y1= input('masukkan point y1 [-,y] : ');
x2= input('masukkan point x2 [x,-] : ');
y2= input('masukkan point y2 [-,y] : ');

L=(2)^8;   %inisialisasi citra keabuan 8 bit
Maks = L-1;
%proses iterasi untuk setiap baris dan kolom matrik
for i = 1:baris;
    for j = 1:kolom;
        baru = abu(i,j);     %definisi untuk citra baru
        if ( baru < x1)      %jika nilai citra baru lebih kecil dari x1
            baru = round((y1/x1)* baru);
        elseif (baru <= x2)  %jika nilai citra baru diantara x1 dan x2
            baru = y1 + round((baru - x1)*(y2 - y1)/(x2 - x1));
        else    %jika nilai baru >= r2 dan baru <= Maks
            baru = y2 + round((baru - x2)*(Maks - y2)/(Maks - x2));
        end
        abu(i,j) = baru;   %memasukkan nilai baru pada titik(i,j)
    end
end
%menampilkan hasil image dan histogram
figure,imshow(uint8(abu)),title('Contrast Streching');
figure,imhist(uint8(abu)),title('Histogram Contrast');
end

