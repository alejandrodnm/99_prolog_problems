% P05 (*) Reverse a list.

reverse_recursive([], []).
reverse_recursive([H|T], X) :- reverse_recursive(T, L), my_append(L, [H], X).

my_append([], L, L).
my_append([H|T], Y, [H|L]) :- my_append(T, Y, L).

reverse_acc([], L2, L2).
reverse_acc([H|T], RL, ACC_L) :- reverse_acc(T, RL, [H|ACC_L]).
reverse(L, RL) :- reverse_acc(L, RL, []).
