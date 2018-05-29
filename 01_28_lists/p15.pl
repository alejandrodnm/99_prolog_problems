% 1.15 (**) Duplicate the elements of a list a given number of times.
%     Example:
%     ?- dupli([a,b,c],3,X).
%     X = [a,a,a,b,b,b,c,c,c]

%     What are the results of the goal:
%     ?- dupli(X,3,Y).

dupli_aux([], _, _, []).
dupli_aux([X|Xs], N, 1, [X|Ys]) :- dupli_aux(Xs, N, N, Ys).
dupli_aux([X|Xs], N, Na, [X|Ys]) :- N > 1, Ndec is Na - 1, dupli_aux([X|Xs], N, Ndec, Ys).
dupli(X, N, Y) :- dupli_aux(X, N, N, Y).
