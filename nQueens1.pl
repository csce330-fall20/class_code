permutation([],[]).
permutation( [H|T] , PHT) :- 
    permutation(T, PT), 
    append(A,B,PT), 
    append(A, [H|B], PHT).

% set_prolog_flag(answer_write_options,[max_depth(0)]).

%nQueens1(N,RCs):-

%range(N,N,[N]).



%zip([],L,[]):-

%no_attack([_]).

%attack([X1,Y1],[X2,Y2] ):- Y1-X1 =:= Y2-X2.
