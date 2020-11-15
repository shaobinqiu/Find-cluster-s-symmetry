function A=distanceM(B,atom)
n=size(B,1);
A=zeros(n,n);
 for ii=1:n
     for jj=1:n
     A(ii,jj)=sqrt((B(ii,1)-B(jj,1))^2+(B(ii,2)-B(jj,2))^2+(B(ii,3)-B(jj,3))^2);
     end  
 end
 atom_id=[];
 for ii=1:size(atom,1)
     atom_id=[atom_id;repmat(ii,atom(ii,1),1)];
 end
 A=A+diag(atom_id);
A=roundn(A,-1);
end

         