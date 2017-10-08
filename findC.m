function Code=findC(B)
n=size(B,1);
C=nchoosek(1:n,3);
for ii=1:size(C,1)
    a1=B(C(ii,1),C(ii,2));
    a2=B(C(ii,1),C(ii,3));
    a3=B(C(ii,2),C(ii,3));
    D(ii,:)=sort([a1 a2 a3]);
end
E=[];
for jj=1:size(C,1)
    if abs(D(1,1)-D(jj,1))+abs(D(1,2)-D(jj,2))+abs(D(1,3)-D(jj,3))<=0.1
     E=[E;C(jj,:)] ;
    end
end
F=[];
for kk=1:size(E,1)
    I= perms(E(kk,:));
    F=[F;I];
end%Whole arrangement123,132,321...
J=B(1:3,1:3);
K=[];
 for pp=1:size(F,1)
     a=abs(J(1,2)-B(F(pp,1),F(pp,2)))+abs(J(1,3)-B(F(pp,1),F(pp,3)))+abs(J(2,3)-B(F(pp,2),F(pp,3)));
    if a==0
       K=[K;F(pp,:)];
    end
 end%
 for rr=1:n-3
     L=[];
    for ss=1:size(K,1)
        lef=setdiff([1:n],K(ss,:));
       for tt=1:length(lef)
            tp=[K(ss,:) lef(tt)];
            b=check(rr+3,tp,B);
            if b==1
                L=[L;tp];
            end
       end
    end
    K=L;
 end
 Code=K;
end