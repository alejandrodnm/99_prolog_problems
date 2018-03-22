% P09 (**) Pack consecutive duplicates of list elements into sublists.
%     If a list contains repeated elements they should be placed in separate sublists.

%     Example:
%     ?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

acc_pack([], R, Z) :- reverse(Z, R).
acc_pack([H|T], Z, [[H|T2]|T3]) :- append(T2, [H], Ti), a_pack(T, Z, [[H|Ti]|T3]).
acc_pack([H|T], Z, [[Y|T2]|T3]) :- \+ H = Y, append([[H]], [[Y|T2]|T3], Reverse_ACC), a_pack(T, Z, Reverse_ACC).
my_pack([H|T], Z) :- acc_pack(T, Z, [[H]]).


% PAGE SOLUTION
% pack(L1,L2) :- the list L2 is obtained from the list L1 by packing
%    repeated occurrences of elements into separate sublists.
%    (list,list) (+,?)

pack([],[]).
pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).

% transfer(X,Xs,Ys,Z) Ys is the list that remains from the list Xs
%    when all leading copies of X are removed and transfered to Z

transfer(X,[],[],[X]).
transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).
