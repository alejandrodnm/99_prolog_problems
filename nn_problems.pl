% P01 (*) Find the last element of a list.
%     Example:
%     ?- my_last(X,[a,b,c,d]).
%     X = d

my_last(X, [X]).
my_last(X, [_|T]) :- my_last(X, T).


% P02 (*) Find the last but one element of a list.
%     (zweitletztes Element, l'avant-dernier élément)

my_last_but_one(X, [X, _]).
my_last_but_one(X, [_|T]) :- my_last_but_one(X, T).


% P03 (*) Find the K'th element of a list.
%     The first element in the list is number 1.
%     Example:
%     ?- element_at(X,[a,b,c,d,e],3).
%     X = c

element_at(X, [X|_], 0).
element_at(X, [_|T], N) :- N > 0, I is N - 1, element_at(X, T, I).


% P04 (*) Find the number of elements of a list.

my_length_acc([], L, L).
my_length_acc([_|T], L, ACC) :- ACC_AUX is ACC + 1, my_length_acc(T, L, ACC_AUX).
my_length(X, L) :- my_length_acc(X, L, 0).


% P05 (*) Reverse a list.

reverse([], []).
reverse([H|T], X) :- reverse(T, L), my_append(L, [H], X).

my_append([], L, L).
my_append([H|T], Y, [H|L]) :- my_append(T, Y, L).
