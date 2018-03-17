% P10 (*) Run-length encoding of a list.
%     Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.

%     Example:
%     ?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]
encode_misunderstood([],[]).
encode_misunderstood([X|Xs],[[I, X]|Zs]) :- transfer(X,Xs,Ys,Z), length(Z, I), encode(Ys,Zs).

encode(L1, L2) :- pack(L1, PackList), encode_aux(PackList, L2).
encode_aux([], []).
encode_aux([[X|Tx]|T], [[LengthX, X]|Te]) :- length([X|Tx], LengthX), encode_aux(T, Te).
