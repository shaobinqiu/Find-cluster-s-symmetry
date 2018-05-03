clear%C-C 1.556A C-H 1.09A
A=1.556*load('sc.txt');
B=load('sc_str.txt');
c=[sum(A(:,1))  sum(A(:,2))   sum(A(:,3)) ]/size(A,1);
Lat=[11 0 0; 0 12 0; 0 0 13];
T=[0.5 0.5 0.5]-c/Lat;
P_C=A/Lat+repmat( T , size(A,1) , 1 );
for ii=1:size(B,1)
    P_H=[];
    for jj=1:size(B,2)
        if B(ii,jj)~=0
            P_H=[P_H;P_C(B(ii,jj),:)+0.8*(P_C(B(ii,jj),:)-[0.5,0.5,0.5])];
        end
    end



P=[P_C;P_H];
d=[8 size(P_H,1)];
s=['POSCAR_sc/POSCAR-',num2str(ii)];
fid=fopen(s,'w+');
fprintf(fid,'C8Hn \n');
     fprintf(fid,'%g\n',1);
      fprintf(fid,'%-4.6f     %-4.6f     %-4.6f\n',Lat');
      fprintf(fid,'C H\n');
      fprintf(fid,'%g     %g\n',d');
      fprintf(fid,'Direct\n');
      for vv=1:size(P,1)
     fprintf(fid,'%-4.6f     %-4.6f     %-4.6f      \n',P(vv,:)');
      end
  fclose(fid);
end
