permutation([],[]).
permutation( [H|T] , PHT) :- 
    permutation(T, PT), 
    append(A,B,PT), 
    append(A, [H|B], PHT).

% set_prolog_flag(answer_write_options,[max_depth(0)]).

nQueens1(N,RCs):-
    range(1,N,Rows),
    range(1,N,Cols),
    permutation(Cols,PCols),
    zip(Rows,PCols,RCs),
    no_attack(RCs).

range(N,N,[N]).
range(M,N,[M|RMp1]):-
    M<N,
    Mp1 is M+1,
    range(Mp1,N,RMp1).



zip([],[],[]).
zip([],L,[]):-length(L,Len), Len > 0.
zip(L,[],[]):-length(L,Len), Len > 0.
zip( [G|S], [H|T], [ [G,H]| ZipTails] ):-
    zip(S,T,ZipTails).

no_attack([_]).
no_attack( [Q|Qs] ):-
    \+ (member(M,Qs),attack(Q,M)) ,
    no_attack(Qs).

attack([X1,Y1],[X2,Y2] ):- Y1-X1 =:= Y2-X2.
attack([X1,Y1],[X2,Y2] ):- Y1+X1 =:= Y2+X2.
