function RGB = Change_Chroma(RGB, mul)
    HSI = RGB2HSI(RGB);
    HSI(:,:,2) = HSI(:,:,2)*mul;
    RGB = HSI2RGB(HSI); 
end