function [theta] = normalEqn(X, y)
theta = zeros(size(X, 2), 1);
theta = pinv(X' * X) * X' * y;

%pinv(a)����α������������invֻ�ܶԷ������棬pinv(a)���ԶԷǷ������档
end