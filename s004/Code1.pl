% basic comparisons : < , > , >= , =< , =:= (negate last)

strictlyIncreasing(A,B,C):- A < B, B < C.

nonDecreasing(A,B,C) :- A =< B, B =< C.

% Y is 2, X is Y, \+ X =:= Y.


% try 30/4 , note floating point returned

%other ops available
%div(), also //, integer div., %mod
% note, basically a return (unusual)

% is vs =:= ( left hand of is can be unset for unification)

%X,Y should be set
quotient_remainder(X,Y,Q,R) :- Q is X//Y, R is X mod Y.

%quotient_remainder2(X,Y,Q,R) :- 

%square function?
square(B,S) :- S is B*B.

%sqrt(N). Kind of pointless
square_root(S,SR) :- SR is sqrt(S).

%factorial - n! , 0! = 1
% 'N' is input term
factorial(0,1).
factorial(N,F) :- N > 0, Nm1 is N -1, factorial(Nm1,Fm1), F is N*Fm1.


%so, what's power of a pow(A,P,A_to_the_P) ?
%yes ^ works in Prolog, but this is recursive...
%define with power(A,0,1) ?
power( A, P, AtP ) :- P<0, NP is -1*P, power(A,NP,AtNP), AtP is 1/AtNP. 
power( _ ,0,1).
power(A,P,AtP) :- 
    P > 0,
    Pm1 is P -1,
    power(A,Pm1,AtPm1),
    AtP is A*AtPm1.


%so, what's blocks world?

%loc(b1,x,y) screen-coordinate order
loc(b1,0,2).
loc(b2,0,3).
loc(b3,1,0).
loc(b4,1,1).
loc(b5,1,2).
loc(b6,1,3).
loc(b7,2,3).

%generator for blocks?
block(B):-loc(B,_,_).

on(Bt,Bb):-loc(Bt,X,Yt),loc(Bb,X,Yb), Yb - Yt =:= 1.

above(Bt,Bb):-loc(Bt,X,Yt),loc(Bb,X,Yb), Yb - Yt >0.

below(Bb,Bt):- above(Bt,Bb).

left(Bl,Br) :- loc(Bl,Xl,_),loc(Br,Xr,_), Xl < Xr.


%really important - Lists!

%note these examples:
% head_tail([1,2,3,4,5,6], H,T). , H is not list (in general), T is list
% head_tail([1], H,T). , T is empty list
% head_tail([], H,T). ,FAILS, H _must_ match at item and there's no
%     items...
head_tail( [H|T],H,T).

%real predicate is length/2




%sum items in a list



%adjacent equals?


%class is_sorted (non-decreasing) order, multiple base cases
is_sorted([]).
is_sorted([_]).
is_sorted([G,H|T]):- G =< H, is_sorted([H|T]).

%elem (real: member) -- test with M both set and unset


%concat (real, append)
%append([1,2,3], [4,5,6],C).
%append(A,B,[1,2,3,4,5,6]).


%real predicate is reverse



% rev2 (library, example of accumulator pattern, also define helper rule
% (always okay)


%subset -- multiple cases

% permutation
permutation([],[]).
permutation( [H|T] , PHT) :- 
    permutation(T, PT), 
    append(A,B,PT), 
    append(A, [H|B], PHT).


%disjoint


%disjoint2 using member, NO RECURSION (explicitly)


%intersects
intersect(A,B):- member(M,A),member(M,B).

%max rule

%max of LIST
%maxL(L,Max)


%list_evil

%call following line:
% set_prolog_flag(answer_write_options,[max_depth(0)]).


% take
take(0, _ , []).
take(N, [H | T], [H|TakeT]) :- Nm1 is N-1, take(Nm1, T, TakeT).  
%take(N, [H | T], [H|TakeT]) :- take(N-1, T, TakeT). % bad b/c "N-1"

% drop N>=length of list
drop(0, L , L).
drop(N, [ _ | T], DropT) :- Nm1 is N-1, drop(Nm1, T, DropT).


% split less efficient with take and drop
% splitEvenly(AB,A,B):-


% more efficient version (take, in particular, computes and then
% discards the drop answer).

%note potential use of helper predicate, below
%split
%splitN(_,_,_,_):-


%merge_lists
%merge_lists(_,_,_):-


%what happens if I do <, >= (sort NOT stable - 350)
%merge_sort(Unsorted,Sorted):-

%bogosort
bogosort(L,SL):-
    permutation(L,SL),
    is_sorted(SL).
