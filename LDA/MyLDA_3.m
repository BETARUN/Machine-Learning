function [w] = MyLDA_3(x1,x2,x3)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
m1=mean(x1);
m2=mean(x2);
m3=mean(x3);
m=mean([x1;x2;x3]);

n1=size(x1,1);%��һ��������
n2=size(x2,1);%�ڶ���������
n3=size(x3,1);%������������

s1=0;
for i=1:n1
    s1=s1+(x1(i,:)-m1)'*(x1(i,:)-m1);
end
s2=0;
for i=1:n2
    s2=s2+(x2(i,:)-m2)'*(x2(i,:)-m2);
end
s3=0;
for i=1:n3
    s3=s3+(x3(i,:)-m3)'*(x3(i,:)-m3);
end
Sw=(n1*s1+n2*s2+n3*s3)/(n1+n2+n3);

Sb=(n1*(m-m1)'*(m-m1)+n2*(m-m2)'*(m-m2)+n3*(m-m3)'*(m-m3))/(n1+n2+n3);
A = repmat(0.1,[1,size(Sw,1)]);
B = diag(A);
[V,D]=eig((Sw + B)\Sb);
[a,b]=max(max(D));
w=V(:,b);%�������ֵ��Ӧ����������

end

