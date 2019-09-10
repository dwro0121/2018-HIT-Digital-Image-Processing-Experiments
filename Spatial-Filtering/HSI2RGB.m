function RGB = HSI2RGB(HSI) 
    HSI = im2double(HSI);
    row = size(HSI,1);
    col = size(HSI,2);
    H = HSI(:, :, 1) * 2 * pi; 
    S = HSI(:, :, 2); 
    I = HSI(:, :, 3);
    R = zeros(row,col); 
    G = zeros(row,col); 
    B = zeros(row,col);
    idx = find( (0 <= H) & (H < 2*pi/3)); 
    B(idx) = I(idx) .* (1 - S(idx));
    R(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./cos(pi/3 - H(idx))); 
    G(idx) = 3*I(idx) - (R(idx) + B(idx)); 
    idx = find( (2*pi/3 <= H) & (H < 4*pi/3) ); 
    R(idx) = I(idx) .* (1 - S(idx));
    G(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx) - 2*pi/3)./cos(pi - H(idx)));
    B(idx) = 3*I(idx) - (R(idx) + G(idx)); 
    idx = find( (4*pi/3 <= H) & (H <= 2*pi)); 
    G(idx) = I(idx) .* (1 - S(idx));
    B(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx) - 4*pi/3) ./cos(5*pi/3 - H(idx)));
    R(idx) = 3*I(idx) - (G(idx) + B(idx)); 
    RGB = im2uint8(cat(3, R, G, B)); 
end