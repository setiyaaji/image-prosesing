function contrast = contrast(I)
    I=imread(I); %membaca Image sebagai inputan variabel I
    I=double(I);
    s=size(I);
    %menentukan titik titik transformasi
        p1=[0,0]; 
        p2=[100,120]; p22=[100,50];  p222=[80,50];
        p3=[150,200]; p33=[120,200]; p333=[90,180];
        p4=[255,255]; p44=[255,255]; p444=[255,255];
    %perhitungan gradient untuk Contrast pertama
        m1=(p1(1,2)-p2(1,2))/(p1(1,1)-p2(1,1));
        m2=(p2(1,2)-p3(1,2))/(p2(1,1)-p3(1,1));
        m3=(p3(1,2)-p4(1,2))/(p3(1,1)-p4(1,1));
    %perhitungan gradient untuk Contrast kedua
        m11=(p1(1,2)-p22(1,2))/(p1(1,1)-p22(1,1));
        m22=(p22(1,2)-p33(1,2))/(p22(1,1)-p33(1,1));
        m33=(p33(1,2)-p44(1,2))/(p33(1,1)-p44(1,1));
    %perhitungan gradient untuk Contrast ketiga
        m111=(p1(1,2)-p222(1,2))/(p1(1,1)-p222(1,1));
        m222=(p222(1,2)-p333(1,2))/(p222(1,1)-p333(1,1));
        m333=(p333(1,2)-p444(1,2))/(p333(1,1)-p444(1,1));
    %perhitungan fungsi
        c1=p1(1,2)-m1*p1(1,1);
        c2=p2(1,2)-m2*p2(1,1);
        c3=p3(1,2)-m3*p3(1,1);
        c11=p1(1,2)-m11*p1(1,1);
        c22=p22(1,2)-m22*p22(1,1);
        c33=p33(1,2)-m33*p33(1,1);
        c111=p1(1,2)-m111*p1(1,1);
        c222=p222(1,2)-m222*p222(1,1);
        c333=p333(1,2)-m333*p333(1,1);

    %looping untuk perhitungan transformasi Contrast pertama
        stA=[];
        for x=0:255
            if(x<=p2(1,1)) %jika x kurang dari sama dengan p2(1,1) 
                stA=[stA (m1*x+c1)];
            end
            if(x>p2(1,1) && x<=p3(1,1))%jika x lebih dari sama dengan p2(1,1) dan x kurang dari p3(1,1)
                stA=[stA (m2*x+c2)];
            end
            if(x>p3(1,1) && x<=p4(1,1))%jika x lebih dari sama dengan p3(1,1) dan x kurang dari p4(1,1)
                stA=[stA (m3*x+c3)];
            end
        end

        for n=1:s(1,1)
            for m=1:s(1,2)
                st1(n,m)=stA(I(n,m)+1);%inisialisasi value contrast pertama
            end
        end
        %looping untuk perhitungan transformasi Contrast kedua
        stB=[];
        for x=0:255
            if(x<=p22(1,1)) %jika x kurang dari sama dengan p22(1,1) 
                stB=[stB (m11*x+c11)];
            end
            if(x>p22(1,1) && x<=p33(1,1)) %jika x lebih dari sama dengan p22(1,1) dan x kurang dari p33(1,1)
                stB=[stB (m22*x+c22)];
            end
            if(x>p33(1,1) && x<=p44(1,1)) %jika x lebih dari sama dengan p33(1,1) dan x kurang dari p44(1,1)
                stB=[stB (m33*x+c33)];
            end
        end

        for n=1:s(1,1)
            for m=1:s(1,2)
                st2(n,m)=stB(I(n,m)+1); %inisialisasi value contrast kedua
            end
        end
        stC=[];
        for x=0:255
            if(x<=p222(1,1)) %jika x kurang dari sama dengan p222(1,1) 
                stC=[stC (m111*x+c111)];
            end
            if(x>p222(1,1) && x<=p333(1,1)) %jika x lebih dari sama dengan p222(1,1) dan x kurang dari p333(1,1)
                stC=[stC (m222*x+c22)];
            end
            if(x>p333(1,1) && x<=p444(1,1)) %jika x lebih dari sama dengan p333(1,1) dan x kurang dari p444(1,1)
                stC=[stC (m333*x+c33)]; %inisialisasi value contrast ketiga
            end
        end

        for n=1:s(1,1)
            for m=1:s(1,2)
                st3(n,m)=stC(I(n,m)+1);
            end
        end
  
    subplot(3,2,1),imshow(st1./255),title('Contrast 1'); 
    subplot(3,2,3),imshow(st2./255),title('Contrast 2');
    subplot(3,2,5),imshow(st3./255),title('Contrast 3');
     
    subplot(3,2,2),imhist(st1/255),title('Histogram contrast 1');
    subplot(3,2,4),imhist(st2/255),title('Histogram contrast 2');
    subplot(3,2,6),imhist(st3/255),title('Histogram contrast 3');

  
end

