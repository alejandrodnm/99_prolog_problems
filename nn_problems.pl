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

reverse_recursive([], []).
reverse_recursive([H|T], X) :- reverse_recursive(T, L), my_append(L, [H], X).

my_append([], L, L).
my_append([H|T], Y, [H|L]) :- my_append(T, Y, L).

reverse_acc([], L2, L2).
reverse_acc([H|T], RL, ACC_L) :- reverse_acc(T, RL, [H|ACC_L]).
reverse(L, RL) :- reverse_acc(L, RL, []).


% P06 (*) Find out whether a list is a palindrome.

palindrome_aux([], []).
palindrome_aux([H|T1], [H|T2]) :- palindrome_aux(T1, T2).
palindrome(X) :- reverse(X, RX), palindrome_aux(X, RX).

% SHAME this is a proper solution
palindrome(L) :- reverse(L, L)
