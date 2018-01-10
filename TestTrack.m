 %[ newA, change_list, add_list, del_list ] = changeMatrix( A, .1, 0, 0, 0 );
 
 
 
 community = tmp;
 
 newMember = Track(A,community, change_list, 0, 0, 2, 1.5, .05);