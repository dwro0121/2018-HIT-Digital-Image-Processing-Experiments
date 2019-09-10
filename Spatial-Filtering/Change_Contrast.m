function RGB = Change_Contrast(RGB, mul)
    HSI = RGB2HSI(RGB);
    HSI = double(HSI);
    Max = max(max(HSI(:,:,3)));
    Min = min(min(HSI(:,:,3)));
    avg = floor((Max+Min)/2)+1;
    HSI(:,:,3) = (HSI(:,:,3)-avg)*mul + avg;
    HSI = uint8(HSI);
    RGB = HSI2RGB(HSI); 
end