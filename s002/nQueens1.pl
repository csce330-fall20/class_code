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
range(M,N, [M| RangeMp1 ] ):-
    M<N,
    Mp1 is M+1,
    range(Mp1,N,RangeMp1).

zip(_,[],[]).
zip([],_,[]).
zip( [G|S], [H|T], [ [G,H] | ZipTails ] ) :- zip(S,T,ZipTails).

no_attack([_]).
no_attack( [P|Ps]) :-
    \+ (member(Q,Ps),attack(P,Q)),
    no_attack(Ps).

attack([X1,Y1],[X2,Y2] ):- Y1-X1 =:= Y2-X2.
attack([X1,Y1],[X2,Y2] ):- Y1+X1 =:= Y2+X2.
