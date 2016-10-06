function cs = ContrastStreching( I )
%inisialisasi variable
I=imread(I); %membaca Image sebagai inputan variabel I
R=I(:,:,1); %mengambil nilai R(Red) dari I(image)
G=I(:,:,2); %mengambil nilai G(Green) dari I(image)
B=I(:,:,3); %mengambil nilai B(Blue) dari I(image)
abu = (0.3*R)+(0.5*G)+(0.2*B);  %proses merubah image menjadi grey level
abu=double(abu);
s=size(abu);
%inisialisasi input titik-titik transformasi CS
a2= input('masukkan point awal 2[x,-] : ');
b2= input('masukkan point ubah 2[-,x] : ');
a3= input('masukkan point awal 3[x,-] : ');
b3= input('masukkan point ubah 3[-,x] : ');
%titik-titik masukan user dimasukkan dalam variable p
p1=[0,0]; 
p2=[a2,b2]; 
p3=[a3,b3]; 
p4=[255,255];
%perhitungan gradient antar 2 titik
m1=(p1(1,2)-p2(1,2))/(p1(1,1)-p2(1,1));
m2=(p2(1,2)-p3(1,2))/(p2(1,1)-p3(1,1));
m3=(p3(1,2)-p4(1,2))/(p3(1,1)-p4(1,1));
%perhitungan untuk nilai c
c1=p1(1,2)-m1*p1(1,1);
c2=p2(1,2)-m2*p2(1,1);
c3=p3(1,2)-m3*p3(1,1);
%looping dan perhitungan transformasi untuk nilai titik yang sesuai dengan masukan user
t=[];
for x=0:255 %dikondisikan x=0:255
    if(x<=p2(1,1)) %jika x kurang dari p2(1,1) 
        t=[t (m1*x+c1)];
    end
    if(x>p2(1,1) && x<=p3(1,1)) %jika x lebih dari p2(1,1) dan x kurang dari sama dengan p3(1,1)
        t=[t (m2*x+c2)];
    end
    if(x>p3(1,1) && x<=p4(1,1)) %jika x lebih dari p3(1,1) dan x kurang dari sama dengan p4(1,1)
        t=[t (m3*x+c3)];
    end
end
for n=1:s(1,1) %dikondisikan untuk n=1:s(1,1)
    for m=1:s(1,2) %dikondisikan untuk n=1:s(1,2)
        st(n,m)=t(abu(n,m)+1); 
    end
end
%menampilkan hasil image dan histogram
figure()
%imshow(uint8(I)),title('citra asli')
imshow(uint8(st)),title('Contrast stretching');
figure,imhist(uint8(st)),title('Histogram Contrast');


end

