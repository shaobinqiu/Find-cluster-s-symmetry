clear
tic
A=load('sc.txt');%
n=size(A,1);%
B=neighbor(A);%create distance matrix
Code=unique(findC(B),'rows');
 save C60_table.txt Code -ascii
toc




