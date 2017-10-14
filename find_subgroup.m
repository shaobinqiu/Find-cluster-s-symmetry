clear
Code=load('C60_table.txt');
basis=[];
exist=[];
ii=1;
s=[];
for ii=1:size(Code)
    b=0;
    for kk=1:size(exist,1)
        %abs(sum((exist(kk,:)-Code(ii,:)).^2))
        if abs(sum((exist(kk,:)-Code(ii,:)).^2))<0.01
            b=b+1;
        end
    end%check weather the Code(ii,:) can be generated by basis we have
    s=[s;b];
    if b==0
     
     A=[Code(ii,:)];
    dir=1;
    for jj=1:30
    if abs(sum((A(dir,:)-[1:60]).^2))<0.01
        break
    else
     A=[A;A(dir,Code(ii,:)')];
    dir=dir+1;
    end
    end
    exist=[exist;A];
    for ll=1:size(exist,1)
        for rr=1:dir
            exist=[exist;exist(ll,A(rr,:)')];
        end
    end
    exist=unique(exist,'rows');%group multiplication
     basis=[basis;Code(ii,:) dir];
    end
end
generator=basis(2:size(basis,1),:);%get the generators

for aa=1%:size(generator,1)
    combination=nchoosek(1:size(generator,1),aa);
    for bb=1:size(combination,1) 
        gen_subgroup=generator(combination(bb,:)',:);%subgroup with aa generators
        table_subgroup=[];
        for cc=1:size(gen_subgroup,1)
            dir_sub=1;
            table_single=gen_subgroup(cc,1:60);
            for dd=1:gen_subgroup(cc,61)
                table_single=[table_single;table_single(dir_sub,gen_subgroup(cc,1:60)')];
                dir_sub=dir_sub+1;
            end
            table_subgroup=[table_subgroup;table_single];
            for ee=1:size(table_subgroup,1)
                for ff=1:size(table_single,1)
                table_subgroup=[table_subgroup;table_subgroup(ee,table_single(ff,:)')];
                end
            end
            table_subgroup=unique(table_subgroup,'rows');%group multiplication
        end
    end
end
           

            







