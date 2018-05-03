clear
tic
A=load('z12.txt');%
n=size(A,1);%
B=neighbor(A);%create distance matrix
Code=unique(findC(B),'rows');
 save z12_table.txt Code -ascii
toc




