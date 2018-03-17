% P07 (**) Flatten a nested list structure.
%     Transform a list, possibly holding lists as elements into a `flat' list
%     by replacing each list with its elements (recursively).

%     Example:
%     ?- my_flatten([a, [b, [c, d], e]], X).
%     X = [a, b, c, d, e]

%     Hint: Use the predefined predicates is_list/1 and append/3

my_flatten([], []).
my_flatten([H|T], X) :- \+ is_list(H), my_flatten(T, Y), append([H], Y, X).
my_flatten([H|T], X) :- my_flatten(H, Y), my_flatten(T, Z), append(Y, Z, X).

my_flatten_acc([], Y, Y).
my_flatten_acc([H|T], Y, ACC) :- \+ is_list(H), append(ACC, [H], ACC_2), my_flatten_acc(T, Y, ACC_2).
my_flatten_acc([H|T], Y, ACC) :- my_flatten(H, Z), append(ACC, Z, ACC_2), my_flatten_acc(T, Y, ACC_2).
my_flatten_2(X, Y) :- my_flatten_acc(X, Y, []).

% PAGE SOLUTION
my_flatten_solution(X,[X]) :- \+ is_list(X).
my_flatten_solution([],[]).
my_flatten_solution([X|Xs],Zs) :- my_flatten(X,Y), my_flatten(Xs,Ys), append(Y,Ys,Zs).
