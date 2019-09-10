function XYZ = RGB2XYZ(RGB)
    RGB = double(RGB);
    R = RGB(:,:,1);
    G = RGB(:,:,2);
    B = RGB(:,:,3);
    X = 0.412*R + 0.358*G + 0.180*B;
    Y = 0.213*R + 0.715*G + 0.072*B;
    Z = 0.019*R + 0.119*G + 0.950*B;
    X = uint8(X);
    Y = uint8(Y);
    Z = uint8(Z);
    X(X(:)>255)=255;
    X(X(:)<0)=0;
    Y(Y(:)>255)=255;
    Y(Y(:)<0)=0;
    Z(Z(:)>255)=255;
    Z(Z(:)<0)=0;
    subplot(5,4,18),imshow(X,'InitialMagnification','fit');title('X'); 
    subplot(5,4,19),imshow(Y,'InitialMagnification','fit');title('Y'); 
    subplot(5,4,20),imshow(Z,'InitialMagnification','fit');title('Z'); 
    XYZ = cat(3,Z,Y,X);
end