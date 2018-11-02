function ex5Lin(lambda)
% �������Իع�
%��������
close all; clc
x = load('ex5Linx.dat'); y = load('ex5Liny.dat');

str1 = 'lambda = ';
str2 = num2str(lambda);
Title = [str1,str2];

m = length(y); % ѵ����������

% ����չʾ
figure;
plot(x, y, 'o', 'MarkerFacecolor', 'b', 'MarkerSize', 8);

% ������x��0�η���x��5�η����������ݾ��󲢳�ʼ������theta
x = [ones(m, 1), x, x.^2, x.^3, x.^4, x.^5];
theta = zeros(size(x(1,:)))';

% �������򻯳���
la = lambda;
L = la.*eye(6); 
L(1) = 0;
theta = (x' * x + L)\x' * y
norm_theta = norm(theta)


hold on;
% �����ܼ��ľ���������ϵ�������ʾ����
x_vals = (-1:0.05:1)';
features = [ones(size(x_vals)), x_vals, x_vals.^2, x_vals.^3,...
          x_vals.^4, x_vals.^5];
plot(x_vals, features*theta, '--', 'LineWidth', 2)
title(Title)
legend('������', '�������')
hold off


