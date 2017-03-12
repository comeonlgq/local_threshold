%这是对局部阈值方法的改进
%T(x,y)=m(x,y)[1+k{arfa(x,y)/(1-arfa(x,y)-1)}]
%
clear all;clc;
I = imread('1_1.jpg');
I = rgb2gray(I);
J=double(I);
figure;
imshow(I);
title('原图');
w= 31; %(w为奇数)

[row,col]=size(J);
T=zeros(row,col);
m=zeros(row,col);
c=(w-1)/2;
d=round(w/2);
% 公式s(x,y)=[g(x+d-1,y+d-1)+g(x-d,y-d)]-[g(x-d,y+d-1)+g(x+d-1,y-d)];
k=0.06;

for x=d+1:row+1-d
    for y=d+1:col+1-d
        g1=count_sum_image(J,x+d-1,y+d-1);
        g2=count_sum_image(J,x-d,y-d);
        g3=count_sum_image(J,x-d,y+d-1);
        g4=count_sum_image(J,x+d-1,y-d);
        s=g1+g2-g3-g4;
        m(x,y)=(s/(w*w));
        alfa=I(x,y)-m(x,y);
        T(x,y)=m(x,y)*(1+k*(alfa/(1-alfa)-1));
    end
end
% sum=0;
% %  求平均值
% for i = 1:m
%     for j = 1:n
%            sum = sum + uint32(I(i ,j ));
%      end
%   end
%  average = double(sum) /(m*n);

%  temp=0;
%  %求平均偏差
%  for i = 1:m
%     for j = 1:n
%           temp=temp+ abs(uint32(I(i ,j ))- average);
%      end
%  end
%  temp=temp/(m*n);

%求阈值
%   for i = 1:m
%     for j = 1:n
%         alfa=I(x,y)-a
%          T(i,j)=average*(1+k*());
%      end
%   end

for i =  1:row
    for j = 1:col
        if J(i,j) >=T(i,j)
            J(i,j) = uint8(255);
        else
            J(i,j) = uint8(0);
        end
    end
end
B=im2double(J);
figure;
imshow(B);title('处理后图像');
figure;imshow(J);