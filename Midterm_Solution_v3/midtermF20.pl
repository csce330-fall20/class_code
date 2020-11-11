% Instructions: Please 1) fill out the following Prolog file
% IMPORTANT: make sure you don't have any errors, I may deduct points 
%     for syntax errors, etc. 

% Also IMPORTANT: Do not forget the online quiz (20%).

% (5%) Section 0. Rules and reminders
% What are your initials? (just fill in). This will be unified with the rest
% of the questions from this section
%initials(change_this).
initials(jpo).

%initial here if you will follow the Honor Code (change i_agree to initials)
%You are explicitly stating that this work is
% i) your work alone
% ii) you have not consulted with your classmates or anyone else
% iii) any online resources you consult do not trivialize any problem
%honor_code(i_agree).
honor_code(jpo).

%you are aware of the online portion of the midterm (20%) on Blackboard
%online_portion(under_blackboard).
online_portion(jpo).

% This take home programming assignment is submitted to GitHub
% IF you have any technical issues, then agree to email me this file
%technical_issues(email_professor_immediately).
technical_issues(jpo).

% Initial if you understand that you must write GENERAL queries
% I will give you tests, but will use a different set to test your code
%  -- attempts to break/"hack" the test will be penalized heavily 
%  -- an example is just writing facts that answer the tests explicitly
%     versus solving the actual problem
%write_general_rules(i_agree).
write_general_rules(jpo).


%Initial if you will check your final submission on GitHub, by going 
%   directly to Github and looking at your last few changes
%   or cloning to a different directory and checking there.
%   IF you have any issues, you have read that you can submit to 
%   Blackboard (but GitHub is preferred)
%submission_and_issues(i_agree).
submission_and_issues(jpo).




% (15%) Section 1. Given a Knowledge Base with the structure in
% midtermTest.pl file
%  write queries to answer the following queries.
%  IMPORTANT: your queries should be sufficiently general 
%     that they work for queries outside the Test file
%     make sure they work for UNSET variables. 

% (5%) Q1.0 calculates the test average -- weighting the midterm an
%  averages should be rounded DOWN (use integral division)
test_avg(ID,Average):-
    student(ID,_,_),
    tests(ID,T1,T2),
    Average is (T1+T2)//2.

%(10%) Q1.1 calculates the quiz average. 
% the lowest quiz should be dropped
% i.e. if the quiz grades are 60,70,80,90,100, the average will
% be 85 (including the drop)
% helper functions are allowed
quiz_avg(ID,Average):-
    student(ID,_,_),
    quizzes(ID,Q1,Q2,Q3,Q4,Q5),
    min5(Q1,Q2,Q3,Q4,Q5,MIN),
    Average is (Q1+Q2+Q3+Q4+Q5-MIN)//4.

%RM ME
min5(A,B,C,D,E,MIN):-
    Qs = [A,B,C,D,E],
    member(MIN,Qs),
    \+ (member(X,Qs), X<MIN).

% (20%) Section 2. Problem Representation
% Open the image at the following URL
%   https://cse.sc.edu/~oreillyj/fall20_330_Section_2.png
%   You need to represent the problem in an appropriate way to find
%   the "block_distance" between corners
%   the corners come from the following corner domain
%   the "block_distance" is the MINIMUM number of "block sides" (edges)
%   one would have to traverse to get from one corner to the other
%   Easy ones
%   block_distance(c0,c0, 0). is true
%   block_distance(c0,c1, 1). is true
%   block_distance(c0,c5, 1). is true
%   block_distance(c0,c7, 3). is true
%   block_distance(c5,c10,5). is true
%   block_distance(c10,c5,5). is true (note the flip)
%   Harder Ones
%   block_distance(c2,c3,4). is true
%   block_distance(c3,c2,4). is true (disance is symmetric)
%   block_distance(c5,c4,6). is true (possibly easy)
%   
%   Possibly useful note: abs/1 can be used to calculate 
%   absolute value
%   IF you use a graph representation, this has cycles.
%   My solution uses lists to avoid many cases and not BFS/DFS
%
%   To be clear: Enumerating all possibilities is not acceptable


corner(c0). corner(c1). corner(c2).             corner(c3). corner(c4).
corner(c5). corner(c6). corner(c7). corner(c8). corner(c9). corner(c10).


loc(c0,0,0). loc(c1,1,0). loc(c2,2,0).              loc(c3,4,0). loc(c4, 5,0).
loc(c5,0,1). loc(c6,1,1). loc(c7,2,1). loc(c8,3,1). loc(c9,4,1). loc(c10,5,1). 

g1([c0,c1,c2,c5,c6,c7,c8]).
g2([c3,c4,c8,c9,c10]).

group(L):-g1(L).
group(L):-g2(L).

manhattan_distance(X1,Y1,X2,Y2, Dist):-
    Dist is abs(X1 - X2) + abs(Y1-Y2).

block_distance(CA,CB,Dist):-
    corner(CA),corner(CB),
    loc(CA,XA,YA), loc(CB,XB,YB),
    group(G), member(CA,G), member(CB,G), %same group
    manhattan_distance(XA,YA,XB,YB, Dist).

block_distance(CA,CB,Dist):-
    corner(CA),corner(CB),
    loc(CA,XA,YA), loc(CB,XB,YB),
    \+ (group(G), member(CA,G), member(CB,G) ), %diff't group
    loc(c8,X8,Y8),
    manhattan_distance(XA,YA,X8,Y8, D1),
    manhattan_distance(X8,Y8,XB,YB, D2),
    Dist is D1+D2.

%Section 3: Map Coloring
% color a Six-Pointed star Hexagram with at most 3 colors
% You may not have adjacent "points"/triangles with the same color
% on the Hexagram 
% Look at the example image, linked here:
%     https://cse.sc.edu/~oreillyj/Hexagram.png
% E.g. P1 cannot be the same color as P2  (or P6) or the Center region
% use the below 4 colors
% (certainly not the hardest one of these I've written...)

%Do not modify domain, obviously
color(red). color(blue). color(yellow). color(pink).

color_hexagram(P1,P2,P3,P4,P5,P6,Center):-
    color(P1),color(P2),color(Center),
    \+ P1 = P2, \+ P1 = Center,
    \+ P2 = Center,
    P3=P1, P5=P1,
    P4=P2, P6=P2.

%Section 4: Lists
% You may, of course, change any list input/output to any other list
% such as Head/tail notation.

% (10%) Q4.0 Give code to yield a list without any even numbers, e.g.
% remove_evens([10,1,2,21,22],[1,21]). is true
% remove_evens([2,4,6,8],[]). is true
% You may assume the first list (input) is always set and the second unset
% You may assume the input numbers are all nonegative integers'
% The order of the odd numbers should be preserved
% remove_evens([10,1,2,21,22],[21,1]). is FALSE

%remove_evens(Input_List,Output_List)
remove_evens([],[]).
remove_evens([N|Ns],[N|RNs]):- \+ even(N), remove_evens(Ns,RNs).
remove_evens([N|Ns],RNs):- even(N), remove_evens(Ns,RNs).

even(N):- N mod 2 =:= 0.

% (10%) Q4.1 Give code to take an input list of alternating numbers
%  and letters and output a list such that the letter is 
%  duplicated the number of times, all in one list, e.g.:
%  You may assume the number is 0 or positive
%  You may also assume the first parameter to dupNChar is set
%     to the above described input list
%  dupNCharList([1,a,2,b,3,c], [a,b,b,c,c,c]). is true
%  dupNCharList([1,a,0,b,2,a], [a,a,a]). is true
%  helper functions are, of course, always allowed

%dupNCharList(InputList,Output)
dupNCharList([],[]).
dupNCharList([N,C|Rest],NCRest):-
    dupNChar(N,C,Cs),
    dupNCharList(Rest,RestCs),
    append(Cs,RestCs,NCRest).

dupNChar(0,_,[]).
dupNChar(N,C,[C|Nm1Cs]):-
    N>0,
    Nm1 is N-1,
    dupNChar(Nm1,C,Nm1Cs).
