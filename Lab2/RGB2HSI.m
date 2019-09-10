function HSI = RGB2HSI(RGB) 
    RGB = im2double(RGB); 
    R = RGB(:, :, 1); 
    G = RGB(:, :, 2); 
    B = RGB(:, :, 3); 
    numerator = 0.5*((R - G) + (R - B)); 
    denominator = sqrt((R - G).^2 + (R - B).*(G - B)); 
    H = acos(numerator./(denominator + eps)); 
    H(B > G) = 2*pi - H(B > G); 
    H = H/(2*pi); 
    numerator = min(min(R, G), B); 
    denominator = R + G + B;
    denominator(denominator == 0) = eps; 
    S = 1 - 3.* numerator./denominator; 
    H(S == 0) = 0; 
    I = (R + G + B)/3;
    HSI = im2uint8(cat(3, H, S, I));
end