function J = computeCostMulti(x,y,theta)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

m=length(y);
J = 0;
% ��ʼ��
J = sum((x*theta - y).^2) / (2 * m);
% ������ʧ


end

