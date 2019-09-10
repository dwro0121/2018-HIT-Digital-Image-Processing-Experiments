function YCbCr = RGB2YCbCr(RGB)
    RGB = double(RGB);
    R = RGB(:,:,1);
    G = RGB(:,:,2);
    B = RGB(:,:,3);
    Y = 0.299*R + 0.587*G + 0.114*B;
    Cb = -0.169*R - 0.331*G + 0.500*B;
    Cr = 0.500*R - 0.419*G - 0.081*B;
    Y = uint8(Y);
    Cb = uint8(Cb+128);
    Cr = uint8(Cr+128);
    Y(Y(:)>255)=255;
    Y(Y(:)<0)=0;
    Cb(Cb(:)>255)=255;
    Cb(Cb(:)<0)=0;
    Cr(Cr(:)>255)=255;
    Cr(Cr(:)<0)=0;
    subplot(5,4,14),imshow(Y,'InitialMagnification','fit');title('Y'); 
    subplot(5,4,15),imshow(Cb,'InitialMagnification','fit');title('Cb'); 
    subplot(5,4,16),imshow(Cr,'InitialMagnification','fit');title('Cr'); 
    YCbCr = cat(3,Cr,Cb,Y);
end