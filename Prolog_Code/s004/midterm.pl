% Instructions: Please 1) fill out the following Prolog file
% IMPORTANT: make sure you don't have any errors, I may deduct points 
%     for syntax errors, etc. 

% Also IMPORTANT: Do not forget the online quiz (20%).

:-['Tests.pl'].

% (20%) Section 1. Given a Knowledge Base with this _structure_
%  write queries to answer the following queries.
%  IMPORTANT: your queries should be sufficiently general 
%     that they work for facts not included, i.e., when 
%     you see "%...", that means there are many more facts,
%     generally, than you see here.
%     Googling the answer two

%State KB regarding employees
% assume it is complete, but not all facts given

%entity type is a state, county, or city
%entity(id,type,name)
entity(id00000,state,sc). %only one for SC
entity(id00023,county,richland).
entity(id00023,county,lexington).
%...
entity(id04321,city,columbia).
entity(id01321,city,greenville).
%....
entity(id05555,city,yemassee).

employee(id05555, mayor, 'Yem Mayor',    555555555,  2011, -1).
% Employees:
% 
%     employment end will be -1 if still in position,
%     e.g. McMaster is still governor of sc
%     Employee names are not guaranteed to be unique
% employee(entity_id, job_title, name, emplyee id, employment_start_year, emplyoment_end_year)
employee(id00000, governor, 'Henry McMaster', 059105912, 2017, -1).
%...
employee(id04321, mayor, 'Steve Benjamin',    602950513,  2010, -1).
employee(id04321, mayor, 'Bob Coble',         186038354,   1990, 2010).
%...

%...

%1a Who is the current mayor of yemassee ( a city in SC ), give the name.
mayor_of_yemassee(Name) :- entity(ID,city,yemassee), employee(ID,mayor,Name,_,_,-1).

%1b What other jobs has the current Governor of SC held.
% for full credit, you must not assume that McMaster is the current governor, i.e.
% your query should work 20 years from now.
% You don't need to give all the jobs at once (user may press ';').
current_governor_past_jobs(Job_Title) :- 
    employee(id00000, governor, _, EmpID, _, -1),
    employee(id00000, Job,      _, EmpID, _, EndDate),EndDate > -1.


%1c Is anyone currently holding two or more jobs under different entities. Give 
% the name and the employee_id.
two_jobs_two_places(Name, EmpID) :- 
    employee(ID1, _, Name,       EID,   _, _),
    employee(ID2, _, Name,       EID,   _, _),
    \+ ID1 = ID2. 

% (20%) Section 2: Write your Fall '20 Schedule. If you have fewer than 12 hours 
%     (~4 classes), pad your schedule with made up BKWG (Basketweaving)
%     classes. Be sure to write _general_ rules (that would work for any 
%     schedule). You may also make up a false schedule for testing purposes...
%     i.e., I don't care about your actual schedule, so just make one up if
%     necessary (e.g., you are graduating this summer).
%   2.a (10%) Your Schedule (make sure it can be used to solve 2b and 2c)

course(csce, 330, [t,r],  1315, 1430).
course(csce, 350, [t,r],  1315, 1430).
course(bwng, 220, [m,w],  1535, 1625).
course(bwng, 110, [t,r],  0830, 0945).

%    2.b (5%) What non-CSCE courses are you taking? (again, the user may use 
%       ';' to get them all)
non_csce( [C,N] ) :- course(C,N,_,_,_).
%    2.c (5%) Do any of your classes overlap in time and day

overlapped_courses(CN1, CN2 ):-
    course(C1,N1,Days1,Time1,End1),
    course(C2,N2,Days2,Time2,End2),
    member(D,Days1),member(D,Days2),
    overlapped_times(Time1,End1,Time2,End2),
    CN1 =[C1,N1],
    CN2 = [C2,N2],
    \+ CN1 = CN2.

overlapped_times(Time1,End1,Time2,_):-
    Time2>=Time1,
    Time2=<End1.
overlapped_times(Time2,_,Time1,End1):-
    Time2>=Time1,
    Time2=<End1.




% (20%) Section 3: Map Coloring. You're planning a dinner party and need to 
%    reduce the drama. You have two tables of four people and eight guests.
%    Your eight guests are 
%    adam, barb, charlie, donna, edward, francis, george, hilda
%    constraints: 
%       adam should not be seated at the same table as francis
%       donna should not be seated at the same table as edward
%    what are the 'colors'? (you don't have to call them colors)
%    (CAREFUL: no more than four (4) people per table)
%    your approach should return all possible configurations (Table assignments)



% Section 4. Trees, in this case binary _search_ trees, are recursive structures,
%    so naturally it’s easy to work with them in Prolog. Write rules for 
%    4.a and 4.b
%    > obviously 'nil' serves same function as  null, like a regular binary 
%    tree.
%    > 'nil' is not a "regular" member of the tree and should not be returned.

%EXAMPLE tree
root(5).

node(5,3,8).
node(3,1,4).
node(1,0,nil).
node(4,nil,nil).
node(0,nil,nil).
node(8,7,nil).
node(7,nil,nil).

%above is tree 
%                   5
%                 /   \
%                /     \
%               3       8
%             /   \    /
%            1     4  7
%           /          
%          0

% 4.a binary_tree_search(N) should
%    search the tree for N , if set, and succeed if N is set
%    if _unset_ should return all members of the tree (one at a time, 
%    with backtracking or user pressing ';')
binary_tree_search0(N):- node(N,_,_).

binary_tree_search1(N):- root(R), descendant(N,R), \+ N=nil.

descendant(D,A) :- node(A,A2,_),descendant(D,A2).
descendant(D,A) :- node(A,D,_).
descendant(D,D).
descendant(D,A) :- node(A,_,D).
descendant(D,A) :- node(A,_,A2),descendant(D,A2).


%4.b define a rule for path_to_node(N,Path) that returns a list of all the paths 
%    from root to a node. As Examples:
%    path_to_node(5,[5]).
%    path_to_node(0,[5,3,1,0]).
%    \+ path_to_node(2,P). %i.e. 2 is not in the tree so fails
%    path_to_node(N,P). %should return all nodes and their paths.
%    This must be a general solution, i.e. it must work for ALL BSTs 
%    structured as above.








%One last reminder: do the online portion.