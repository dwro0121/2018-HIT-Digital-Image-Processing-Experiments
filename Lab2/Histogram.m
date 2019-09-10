function Histogram=Histogram(img)
    img_gray = rgb2gray(img);
    row = size(img_gray,1);
    col = size(img_gray,2);
    Histogram = zeros(1,256);
    for i=1:row
        for j=1:col
            Histogram(img_gray(i,j)+1) = Histogram(img_gray(i,j)+1)+1;
        end
    end
end