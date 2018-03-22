% P02 (*) Find the last but one element of a list.
%     (zweitletztes Element, l'avant-dernier élément)

my_last_but_one(X, [X, _]).
my_last_but_one(X, [_|T]) :- my_last_but_one(X, T).
