function img_edge = edge(img,type)
    img = double(rgb2gray(img));
    [row,col] = size(img);
    img_edge = zeros(row,col);
    th = 150;
    array_r = [1 1;-1 -1;];
    array_sx = [-1 0 1;-2 0 2;-1 0 1;];
    array_sy = [-1 -2 -1;0 0 0;1 2 1;];
    if type == "roberts"
        for i=1:row-1
            for j=1:col-1
                array = img(i:i+1,j:j+1).*array_r;
                A = array(:);
                roberts = sqrt((A(1)+A(4))^2+(A(2)+A(3))^2);
                img_edge(i,j)=roberts;
            end
        end
    elseif type == "sobel"
        for i=1:row-2
            for j=1:col-2
                array_x = img(i:i+2,j:j+2).*array_sx;
                array_y = img(i:i+2,j:j+2).*array_sy;
                X = array_x(:);
                Y = array_y(:);
                sobel_x = ((X(1)+X(2)+X(3))+(X(7)+X(8)+X(9)))^2;
                sobel_y = ((X(1)+X(4)+X(7))+(X(3)+X(6)+X(9)))^2;
                sobel = sqrt(sobel_x+sobel_y);
                img_edge(i+1,j+1)=sobel;
            end
        end
    end
    img_edge = uint8(img_edge);
end