% 1.13 (**) Run-length encoding of a list (direct solution).
%     Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 1.09, but only count them. As in problem 1.11, simplify the result list by replacing the singleton terms [1,X] by X.
%
% ?- encode_direct([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
% X = [[4,a],b,[2,c],[2,a],d,[4,e]]

encode_direct([], []).
encode_direct(X, R) :- count(X, 1, R).

count([X], 1, [X]).
count([X], N, [[N, X]]) :- N > 1.
count([X, Y | T], N, [Z | R]) :- \+ X = Y,  N > 1, Z = [N, X], count([Y | T], 1, R).
count([X, Y | T], N, [X | R]) :- \+ X = Y,  N = 1, count([Y | T], 1, R).
count([X, X | T], N, R) :- Ni is N + 1, count([X | T], Ni, R).

% encode_direct(L1,L2) :- the list L2 is obtained from the list L1 by
%    run-length encoding. Consecutive duplicates of elements are encoded
%    as terms [N,E], where N is the number of duplicates of the element E.
%    However, if N equals 1 then the element is simply copied into the
%    output list.
%    (list,list) (+,?)

% encode_direct([],[]).
% encode_direct([X|Xs],[Z|Zs]) :- count(X,Xs,Ys,1,Z), encode_direct(Ys,Zs).

% count(X,Xs,Ys,K,T) Ys is the list that remains from the list Xs
%    when all leading copies of X are removed. T is the term [N,X],
%    where N is K plus the number of X's that can be removed from Xs.
%    In the case of N=1, T is X, instead of the term [1,X].

% count(X,[],[],1,X).
% count(X,[],[],N,[N,X]) :- N > 1.
% count(X,[Y|Ys],[Y|Ys],1,X) :- X \= Y.
% count(X,[Y|Ys],[Y|Ys],N,[N,X]) :- N > 1, X \= Y.
% count(X,[X|Xs],Ys,K,T) :- K1 is K + 1, count(X,Xs,Ys,K1,T).
