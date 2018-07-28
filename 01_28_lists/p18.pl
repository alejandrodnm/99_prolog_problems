% P18 (**) Extract a slice from a list.
%     Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

%     Example:
%     ?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
%     X = [c,d,e,f,g]

slice(_, _, Nu, [], N) :- N > Nu.
slice([_|Xs], Nl, Nu, L, N) :- N < Nl, N2 is N + 1, slice(Xs, Nl, Nu, L, N2).
slice([X|Xs], Nl, Nu, [X|L], N) :- N >= Nl, N =< Nu, N2 is N + 1, slice(Xs, Nl, Nu, L, N2).
slice(X, Nl, Nu, L) :- slice(X, Nl, Nu, L, 1).

% Solution
% slice([X|_],1,1,[X]).
% slice([X|Xs],1,K,[X|Ys]) :- K > 1,
%    K1 is K - 1, slice(Xs,1,K1,Ys).
% slice([_|Xs],I,K,Ys) :- I > 1,
%    I1 is I - 1, K1 is K - 1, slice(Xs,I1,K1,Ys).
