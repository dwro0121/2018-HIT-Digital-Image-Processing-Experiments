function RGB = Change_Hue(RGB, mul)
    HSI = RGB2HSI(RGB);
    HSI(:,:,1) = HSI(:,:,1)*mul;
    RGB = HSI2RGB(HSI); 
end