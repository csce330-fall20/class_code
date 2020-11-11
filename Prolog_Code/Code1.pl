% basic comparisons : < , > , >= , =< , =:= (negate last)

strictlyIncreasing(A,B,C):- 

%nonDecreasing(A,B,C) :- 

% Y is 2, X is Y, \+ X =:= Y.


% try 30/4 , note floating point returned

%other ops available
%div(), also //, integer div., %mod
% note, basically a return (unusual)

% is vs =:= ( left hand of is can be unset for unificaiton)

%quotient_remainder(X,Y,Q,R) :- 

%quotient_remainder2(X,Y,Q,R) :- 

%square function?
%square(B,S) :- 

%sqrt(N). Kind of pointless
%square_root(S,SR) :- 

%factorial


%so, what's power of a pow(A,P,A_to_the_P) ?
%yes ^ works in Prolog, but this is recursive...



%define with power(A,0,1) ?

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
%block(B):-

%on(Bt,Bb):-

%above(Bt,Bb):-

%below(Bb,Bt):-

%left(Bl,Br) :-


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


%elem (real: member) -- test with M both set and unset


%concat (real, append)
%append([1,2,3], [4,5,6],C).
%append(A,B,[1,2,3,4,5,6]).


%real predicate is reverse



% rev2 (library, example of accumulator pattern, also define helper rule
% (always okay)


%subset -- multiple cases


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


%take



%drop


% split less efficient with take and drop
splitEvenly(AB,A,B):-length(AB,L),
                     Half is L//2,
                    take(Half,AB,A),drop(Half,AB,B).

% more efficient version (take, in particular, computes and then
% discards the drop answer).

%note use of helper predicate, below
%split
splitN(L,0,[],L).
splitN([H|T] ,N,A,B) :- Nm1 is N-1, splitN(T,Nm1,ST,B), append([H],ST,A).


%merge_lists
merge_lists([],L,L).
merge_lists(L,[],L).
merge_lists([G|R],[H|T],[G|MRest]):-G=<H,merge_lists(R,[H|T],MRest).
merge_lists([G|R],[H|T],[H|MRest]):-G>H,merge_lists([G|R],T,MRest).

%what happens if I do <, >= (sort NOT stable - 350)

merge_sort([],[]).
merge_sort([X],[X]).
merge_sort(L,Sorted):- 
    length(L,Len),Len>1,
    splitEvenly(L,Left,Right),
    merge_sort(Left,LSorted),
    merge_sort(Right,RSorted),
    merge_lists(LSorted,RSorted,Sorted).