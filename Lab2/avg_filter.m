function img_aver=avg_filter(img)
    img = double(img);
    [row,col] = size(img(:,:,1));
    R = zeros(row,col);
    G = zeros(row,col);
    B = zeros(row,col);
    for i=2:row-1
        for j=2:col-1
            R(i,j) = mean(mean(img(i-1:i+1,j-1:j+1,1)));
            G(i,j) = mean(mean(img(i-1:i+1,j-1:j+1,2)));
            B(i,j) = mean(mean(img(i-1:i+1,j-1:j+1,3)));
        end
    end
    img_aver = uint8(cat(3,R,G,B));
end
