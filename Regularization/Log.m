function ex5Log(Lambda)
% �����߼��ع�

close all; clc

x = load('ex5Logx.dat'); 
y = load('ex5Logy.dat');

% ���ӻ��������ݣ�ʹ�ò�ͬ��������ͷ���

figure % Find theindices for the2 classes 
pos = find(y ); 
neg= find(y == 0); 
plot(x(pos , 1) , x(pos , 2) , '+') 
hold on 
plot(x(neg , 1) , x(neg , 2) , 'o ' )


% figure
% pos = find(y); neg = find(y == 0);
% plot(x(pos, 1), x(pos, 2), 'b+','LineWidth', 1, 'MarkerSize', 7)
% hold on
% plot(x(neg, 1), x(neg, 2), 'ro', 'MarkerFaceColor', 'y', 'MarkerSize', 7)


% ʹ��map_festure��������x�Ķ���ʽ����
x = map_feature(x(:,1), x(:,2));

[m, n] = size(x);

% ��ʼ������theta
theta = zeros(n, 1);

% ��������sigmoid����
g = @(z)1.0 ./ (1.0 + exp(-z));

% ʹ��ţ�ٷ��ȶ�������������
MAX_ITR = 20;
J = zeros(MAX_ITR, 1);
lam = Lambda;

for i = 1:MAX_ITR
  
    z = x * theta;
    h = g(z);
    
    % ������ʧ��������������
    J(i) =(1/m)*sum(-y.*log(h) - (1-y).*log(1-h))+ ...
    (lam/(2*m))*norm(theta([2:end]))^2;
    
    % �����ݶȺͺ�ɭ����
    G = (lam/m).*theta; G(1) = 0; % �������ӵ�
    L = (lam/m).*eye(n); L(1) = 0;
    grad = ((1/m).*x' * (h-y)) + G;
    H = ((1/m).*x' * diag(h) * diag(1-h) * x) + L;
    
    % �����ĸ���
    theta = theta - H\grad;
  
end

norm_theta = norm(theta) 



u = linspace(-1, 1.5, 200);
v = linspace(-1, 1.5, 200);

z = zeros(length(u), length(v));

for i = 1:length(u)
    for j = 1:length(v)
        z(i,j) = map_feature(u(i), v(j))*theta;
    end
end
z = z'; % ����ת��

contour(u, v, z, [0, 0], 'LineWidth', 2)
legend('y = 1', 'y = 0', '�������')
title(sprintf('\\lambda = %g', lam), 'FontSize', 14)


hold off


% ��ӡJ�����п��ӻ�
J
figure
plot(0:MAX_ITR-1, J, 'o--', 'MarkerFaceColor', 'r', 'MarkerSize', 8)
xlabel('Iteration'); ylabel('J')
