% P04 (*) Find the number of elements of a list.

my_length_acc([], L, L).
my_length_acc([_|T], L, ACC) :- ACC_AUX is ACC + 1, my_length_acc(T, L, ACC_AUX).
my_length(X, L) :- my_length_acc(X, L, 0).
