function a=check(atom_id,B,DM)%��������ӵ�һ��ԭ�Ӻ�����ԭ�ӵ�λ�ù�ϵ
a=0;
D=DM(atom_id,atom_id(end));
E=[];
for ii=1:size(B,2)
       E(ii,1)=DM(B(1,ii),B(1,end));
end
if D==E
    a=1;
end
end
        