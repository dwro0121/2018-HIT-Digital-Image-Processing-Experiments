function YIQ = RGB2YIQ(RGB)
    RGB = double(RGB);
    R = RGB(:,:,1)./255;
    G = RGB(:,:,2)./255;
    B = RGB(:,:,3)./255;
    Y = 0.299*R+0.587*G+0.114*B;
    I = 0.596*R-0.274*G-0.322*B;
    Q = 0.211*R-0.523*G+0.312*B;
    Y = uint8(Y*255);
    I = uint8(I./(0.5957*2)*255+128);
    Q = uint8(Q./(0.5226*2)*255+128);
    Y(Y(:)>255)=255;
    Y(Y(:)<0)=0;
    I(I(:)>255)=255;
    I(I(:)<0)=0;
    Q(Q(:)>255)=255;
    Q(Q(:)<0)=0;
    subplot(5,4,6),imshow(Y,'InitialMagnification','fit');title('Y'); 
    subplot(5,4,7),imshow(I,'InitialMagnification','fit');title('I'); 
    subplot(5,4,8),imshow(Q,'InitialMagnification','fit');title('Q'); 
    YIQ = cat(3,Q,I,Y);
end
    