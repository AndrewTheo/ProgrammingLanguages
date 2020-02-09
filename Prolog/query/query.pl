year_1953_1996_novels(Book) :-
    novel(Book, 1996).

year_1953_1996_novels(Book) :-
    novel(Book, 1953).


period_1800_1900_novels(Book) :-
    novel(Book, X), X =< 1900, X >= 1800.

lotr_fans(Fan) :-
    fan(Fan, X), member(the_lord_of_the_rings, X).


author_names(Author) :-
    author(Author, X), fan(chandler, Y), member(W, X), member(W, Y).

fans_names(Fan) :-
    fan(Fan, X), author(brandon_sanderson, Y), member(W, X), member(W, Y).


%if phoebe and ross share a common book
mutual_novels(Book) :-
  fan(phoebe, X), fan(ross, Y), member(Book, X), member(Book, Y).

%if phoebe and monica share a common book
mutual_novels(Book) :-
  fan(phoebe, X), fan(monica, Y), member(Book, X), member(Book, Y).

%if monica and ross share a common book
mutual_novels(Book) :-
  fan(ross, X), fan(monica, Y), member(Book, X), member(Book, Y).
