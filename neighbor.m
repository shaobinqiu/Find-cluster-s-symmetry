function A=neighbor(B)
n=size(B,1);
A=zeros(n,n);
 for ii=1:n
     for jj=1:n
     A(ii,jj)=sqrt((B(ii,1)-B(jj,1))^2+(B(ii,2)-B(jj,2))^2+(B(ii,3)-B(jj,3))^2);
     end  
 end
A=roundn(A,-1);
end

         