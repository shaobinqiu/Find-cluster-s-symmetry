clear
str=load('/home/qiusb/Documents/MATLAB/SiGeH_190806/files/str_Ge14.txt');
table=load('/home/qiusb/Documents/MATLAB/SiGeH_190806/files/table_Ge14.txt');
gener=[]
for ii=1:size(str,1)
     s=str(ii,:);
     s(s==0)=[];
     a=table(:,s);
     b=unique(sort(a')', 'rows')
     gener=[gener;size(b,1)];
end
gener=[1;gener];
save /home/qiusb/Documents/MATLAB/SiGeH_190806/files/degeneracy_Ge14.txt gener -ascii   
s=sum(gener)