function [X_norm,mu,sigma] = featureNormalize(X)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
X_norm = X;
%(47,2)
mu = zeros(1, size(X, 2));
%size(X, 2)ȡX�ĵڶ�ά��mu��СΪ��1,2��
sigma = zeros(1, size(X, 2));
%(1,2)
m = size(X,1);
%47
mu = mean(X);
%�����ֵ
for i = 1 : m,
    X_norm(i, :) = X(i , :) - mu;
end
sigma = std(X);
for i = 1 : m,
    X_norm(i, :) = X_norm(i, :) ./ sigma;
end
end

