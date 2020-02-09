
isUnion([], Union, Union).
isUnion([H | T], Set2, Union) :- member(H, Set2), isUnion(T, Set2, Union).
isUnion([H | T], Set2, [H | T2]) :- not(member(H, Set2)), isUnion(T,Set2,T2).


isIntersection([], Set2, []).
%if Head (car) of set1 is in Set2, must be a Intersection.
isIntersection([H | T], Set2, [H | T2]) :- member(H,Set2), isIntersection(T, Set2, T2).
isIntersection([_| T], Set2, Intersection) :- isIntersection(T, Set2, Intersection).



isEqual([], Set2).
isEqual(Set1, Set2) :- equalHelper(Set1, Set2).
equalHelper([H | T], Set2) :- member(H, Set2), isEqual(T, Set2).


powerSet([], [[]]).
powerSet([H | T], [H | T2]) :- powerSet(T,T2).
powerSet([H | T], [H | T2] ) :- append(H, [H | Tlist], T2), powerSet(T, Tlist).
