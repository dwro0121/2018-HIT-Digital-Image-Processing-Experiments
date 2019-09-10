function Brightness = Brightness(img)
    HSI = RGB2HSI(img);
    sum = 0.0;
    for i=1:size(HSI,1)
        for j=1:size(HSI,2)
            sum = sum+double(HSI(i,j,3));
        end
    end
    sum = sum/size(HSI,1)/size(HSI,2);
    Brightness = sum;
end