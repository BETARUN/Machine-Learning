function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

m = length(y); 
% ��������

J_history = zeros(num_iters, 1);
% ��¼J���Ż��Ĺ��̣�(1500,1),all elements is zero

for iter = 1:num_iters
    H = X * theta;
    %(97,2)*(2*1)=(97,1)
    T = [0 ; 0];
    %(2,1)����¼�ݶ�

    for i = 1 : m,
        T = T + (H(i) - y(i)) * X(i,:)';    
        % (1,1)*(1*2)��ת�ã����Ϊ��2��1��
    end

    theta = theta - (alpha * T) / m;

    J_history(iter) = computeCost(X, y, theta);
    % theta���룬������ʧ������������ʧ������¼��J_history��

end
end


