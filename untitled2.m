clear 
table=load('/home/qiusb/Documents/MATLAB/SiGeH_190806/files/table_Ge14.txt');
str=[];
n=14;
str=generate_structures(table,n);
save /home/qiusb/Documents/MATLAB/SiGeH_190806/files/str_Ge14.txt str -ascii