%T.Romen Singh算法
% delt(x,y)=i(x,y)-m(x,y)
%T(x,y)=m(x,y)(1+k*(delt(x,y)/(1-delt(x,y))-1)
%基于一种新的局部阈值方法

clear all;clc;
I=imread('result.jpg');
[m,n] = size(I);     
T = zeros(m ,n );     
w=13;   
%  
for i = (w + 1):(m - w)     
    for j = (w + 1):(n - w)        
        sum = 0;  
        for k = -w:w     
            for l = -w:w     
                sum = sum + uint32(I(i + k,j + l));  
            end     
        end     
        average = double(sum) /((2*w+1)*(2*w+1));  
         delt=I(i,j)-average ;
        T(i,j) = average*(1 + 0.34*(delt/(1-delt)-1));  
    end     
end     
for i =  1:m   
    for j = 1:n   
        if I(i,j) > T(i,j)     
            I(i,j) = uint8(255);     
        else    
            I(i,j) = uint8(0);     
        end     
    end     
end  
figure;imshow(I); title('TRomen method局部阈值w=13');
xlswrite('t_romen_singh1.xlsx',I);  xlswrite('t_romen_singh2.xlsx',T);
imwrite(I,'t_romen_singh.jpg');