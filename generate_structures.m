function str_all=generate_structures(table,n)
index=table';
str_all=[];
str=[];
for jj=1:size(index,1)
    str=[str
        min(index(jj,:))];
end
str=unique(str,'rows');
%nn=1 updated
str_1=[str , zeros(size(str,1),size(index,1)-size(str,2))];%keep dimension
str_all=[str_all;str_1];

if n>=2
    for nn=2:n
number=sort(index(:,1)) ; 

newstr=[];
tp=[];
for ii=1:size(str,1)
    for jj=1:size(index,1)
        if length(intersect(str(ii,:),number(jj)))==0
            tp=[tp; sort([str(ii,:) number(jj)])];
        end
    end
end
tp=unique(tp,'rows');       
  for ii=1:size(tp,1)
      
            tp1=[];
            for kk=1:size(tp,2)
            tp1=[tp1,find(index(:,1)==tp(ii,kk))];
            end
            tmp=index(tp1,:)';
            for kk=1:size(tmp,1)
                tmp(kk,:)=sort(tmp(kk,:));
            end
             tmp=unique(tmp,'rows');
            newstr=[newstr
               tmp(1,:)];
  end
str=unique(newstr,'rows');
%nn updated
str_nn=[str , zeros(size(str,1),size(index,1)-size(str,2))];%keep dimension
str_all=[str_all;str_nn];
nn

    end
end
end
