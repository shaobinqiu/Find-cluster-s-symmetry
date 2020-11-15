clear 
dir='/home/qiusb/Documents/MATLAB/C60Hn_mag/files/';
table=load([dir,'C60_table.txt']);
str=[];
n=6;
str=generate_structures(table,n);
save '/home/qiusb/Desktop/'str_C60H1_5.txt str -ascii