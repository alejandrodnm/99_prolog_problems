% P16 (**) Drop every N'th element from a list.
%     Example:
%     ?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
%     X = [a,b,d,e,g,h,k]

drop([], _ , [], _).
drop([_ | T], N, Y, N) :- drop(T, N, Y, 1).
drop([H | T], N, [H | Y], Z) :- Z2 is Z + 1, drop(T, N, Y, Z2).
drop(X, N, Y) :- drop(X, N, Y, 1).
