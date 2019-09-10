function img_mid=mid_filter(img)
    img = double(img);
    [row,col] = size(img(:,:,1));
    R = zeros(row,col);
    G = zeros(row,col);
    B = zeros(row,col);
    for i=2:row-1
        for j=2:col-1
            r = img(i-1:i+1,j-1:j+1,1);
            g = img(i-1:i+1,j-1:j+1,2);
            b = img(i-1:i+1,j-1:j+1,3);
            R(i,j) = median(r(:));
            G(i,j) = median(g(:));
            B(i,j) = median(b(:));
        end
    end
    img_mid = uint8(cat(3,R,G,B));
end
