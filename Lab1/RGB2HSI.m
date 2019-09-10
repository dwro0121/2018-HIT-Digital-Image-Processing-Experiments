function HSI = RGB2HSI(RGB)
    RGB = double(RGB);
    R = RGB(:,:,1);
    G = RGB(:,:,2);
    B = RGB(:,:,3);
    r = R./(R+G+B);
    g = G./(R+G+B);
    b = B./(R+G+B);
    i = (R+G+B)./(3*255);
    s = 1 - 3.*min(r,min(g,b));
    numerator = ((r-g)+(r-b))./2;
    denominator = sqrt((r-g).^2 + (r-b).*(g-b));
    h = numerator./(denominator);
    h= acos(h);
    h(G<B) = 2*pi - h(G<B);
    H = uint8(h.*180./(pi));
    S = uint8(s.*100);
    I = uint8(i.*255);
    H(H(:)>255)=255;
    H(H(:)<0)=0;
    S(S(:)>100)=100;
    S(S(:)<0)=0;
    I(I(:)>255)=255;
    I(I(:)<0)=0;
    subplot(5,4,10),imshow(H,'InitialMagnification','fit');title('H'); 
    subplot(5,4,11),imshow(S,'InitialMagnification','fit');title('S'); 
    subplot(5,4,12),imshow(I,'InitialMagnification','fit');title('I'); 
    HSI = cat(3,I,S,H);
end