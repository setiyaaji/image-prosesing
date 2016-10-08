function aritmatika = aritmatic( I, x ) %fungsi aritmatika dengan inputan I = file name dan nilai x
I = imread(I);
R=I(:,:,1); %mengambil nilai R(Red) dari I(image)
G=I(:,:,2); %mengambil nilai G(Green) dari I(image)
B=I(:,:,3); %mengambil nilai B(Blue) dari I(image)
abu = (0.3*R)+(0.5*G)+(0.2*B);  %proses merubah image menjadi grey level
    disp(' Pilih nomor untuk perhitungan aritmatika '); %menampilkan pilihan aritmatika yang akan dijalankan
    disp(' => Pilih 1 untuk Penjumlahan ');
    disp(' => Pilih 2 untuk Pengurangan ');
    disp(' => Pilih 3 untuk Perkalian ');
    disp(' => Pilih 4 untuk Pembagian ');
    disp(' ');
a = input ('Masukkan pilihan nomor :'); %input nilai a untuk menentukan pilihan aritmatika
    switch a
        case 1 %untuk pilihan 1, maka aritmatika yang dipilih adalah penjumlahan
            hasil = abu + x; %mencari nilai penjumlahan dengan ditambah dengan nilai x
        case 2 %untuk pilihan 2, maka aritmatika yang dipilih adalah pengurangan
            hasil = abu - x; %mencari nilai pengurangan dengan dikurangi dengan nilai x         
        case 3 %untuk pilihan 3, maka aritmatika yang dipilih adalah perkalian
            hasil = abu * x; %mencari nilai perkalian dengan dikali dengan nilai x            
        case 4 %mencari nilai pembagiann dengan dibagi dengan nilai x
            hasil = abu / x; %mencari nilai pembagian dengan dibagi dengan nilai x
     end
            figure,imshow(hasil); %menampilkan hasil image untuk aritmatika penjumlahan
            figure,imhist(hasil); %menampilkan histogram untuk aritmatika penjumlahan
end

    



