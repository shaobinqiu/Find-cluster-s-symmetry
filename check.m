function a=check(b,B,C)%��������ӵ�һ��ԭ�Ӻ�����ԭ�ӵ�λ�ù�ϵ
a=0;
D=C(1:b-1,b);
E=[];
for ii=1:b-1
       E(ii,1)=C(B(1,ii),B(1,b));
end
if D==E
    a=1;
end
end
        