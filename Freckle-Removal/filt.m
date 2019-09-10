function img_filt = filt(img,a,d,r)
    img = im2double(img);
    [row,col] = size(img(:,:,1));
    [x,y] = meshgrid(-r:r);
    w1 = exp(-(x.^2+y.^2)/(2*d^2));
    R_temp = zeros(row+2*a,col+2*a);
    G_temp = zeros(row+2*a,col+2*a);
    B_temp = zeros(row+2*a,col+2*a);
    R_filt = zeros(row,col);
    G_filt = zeros(row,col);
    B_filt = zeros(row,col);
    for i=-a+1:row+a
        if i<1
            row_temp=1;
        elseif i>row
            row_temp=row;
        else
            row_temp=i;
        end
        for j=-a+1:col+a
            if j<1
                col_temp=1;
            elseif j>col
                col_temp=col;
            else
                col_temp=j;
            end
            R_temp(i+a,j+a)=img(row_temp,col_temp,1);
            G_temp(i+a,j+a)=img(row_temp,col_temp,2);
            B_temp(i+a,j+a)=img(row_temp,col_temp,3);
        end
    end

    for i = a+1:row+a
        for j = a+1:col+a
            temp1 = R_temp(i-a:i+a,j-a:j+a);
            temp2 = G_temp(i-a:i+a,j-a:j+a);
            temp3 = B_temp(i-a:i+a,j-a:j+a);
            dr = temp1 - R_temp(i,j);
            dg = temp2 - G_temp(i,j);
            db = temp3 - B_temp(i,j);
            w2 = exp(-(dr.^2+dg.^2+db.^2)/(2*r^2));
            w = w1.*w2;
            R_filt(i-a,j-a) = sum(sum(temp1.*w))/sum(w(:));
            G_filt(i-a,j-a) = sum(sum(temp2.*w))/sum(w(:));
            B_filt(i-a,j-a) = sum(sum(temp3.*w))/sum(w(:));
        end
    end
    img_filt = im2uint8(cat(3,R_filt,G_filt,B_filt));
end