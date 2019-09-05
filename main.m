clear
tic
dir='/home/qiusb/Documents/MATLAB/SiGeH_190806/files/';
A=load([dir,'Ge14.txt']);
B=neighbor(A);%create distance matrix
Code=unique(findC(B),'rows');
save([dir,'table_Ge14.txt'],'Code','-ascii')
toc




