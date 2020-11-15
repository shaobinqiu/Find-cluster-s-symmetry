function Code=findC(DM)
n=size(DM,1);

%choose all possible triangle in molecule.
C=nchoosek(1:n,3);
id_rm=[];
for ii=1:size(C,1)
    a1=DM(C(ii,1),C(ii,2));
    a2=DM(C(ii,1),C(ii,3));
    a3=DM(C(ii,2),C(ii,3));
    
    D(ii,:)=sort([a1 a2 a3]);
    if abs(D(ii,1)+D(ii,2)-D(ii,3))<0.01
        %not a triangle.
        id_rm=[id_rm;ii]
    end
end
D(id_rm,:)=[];
C(id_rm,:)=[];
%get the triangle equal to the first one.
E=[];
for jj=1:size(D,1)
    if abs(D(1,1)-D(jj,1))+abs(D(1,2)-D(jj,2))+abs(D(1,3)-D(jj,3))<=0.1
     E=[E;C(jj,:)] ;
    end
end
%get the atom id overlap this two triangel
F=[];
for kk=1:size(E,1)
    I= perms(E(kk,:));
    F=[F;I];
end%Whole arrangement123,132,321...

%Find the good order in F
J=DM(C(1,:),C(1,:));
K=[];
 for pp=1:size(F,1)
%      a=abs(J(1,2)-B(F(pp,1),F(pp,2)))+abs(J(1,3)-B(F(pp,1),F(pp,3)))+abs(J(2,3)-B(F(pp,2),F(pp,3)));
     a=sum(abs(J-DM(F(pp,:),F(pp,:))));
    if a==0
       K=[K;F(pp,:)];
    end
 end
 
 B=DM;
 for rr=1:n%-3
     L=[];
    for ss=1:size(K,1)
        lef=setdiff([1:n],K(ss,:));
        lef=[1:n];
       for tt=1:length(lef)
            tp=[K(ss,:) lef(tt)];
%             b=check(rr+3,tp,B);
            b=check([C(1,:) 1:rr],tp,B);
            if b==1
                L=[L;tp];
            end
       end
    end
    K=L;
 end
 Code=K(:,4:end);
end