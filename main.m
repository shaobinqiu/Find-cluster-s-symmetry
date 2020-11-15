clear
tic
cell=import_poscar( 'POSCAR_H2O.txt' );
coords=cell.coords*cell.lattice;
DM=distanceM(coords,cell.atomcount);%create distance matrix
Code=unique(findC(DM),'rows');
%save([dir,'table_Ge221D.txt'],'Code','-ascii')
toc




