clear
A=load('C60.txt');%
A=[A  [1:60]']
plot3(A(:,1),A(:,2),A(:,3),'*')