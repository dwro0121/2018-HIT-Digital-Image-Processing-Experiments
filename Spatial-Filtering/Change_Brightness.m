function RGB = Change_Brightness(RGB, mul)
    HSI = RGB2HSI(RGB);
    HSI(:,:,3) = HSI(:,:,3)*mul;
    RGB = HSI2RGB(HSI); 
end