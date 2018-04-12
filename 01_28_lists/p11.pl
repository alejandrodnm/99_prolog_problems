% P11 (*) Modified run-length encoding.
%     Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as [N,E] terms.

%     Example:
%     ?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [[4,a],b,[2,c],[2,a],d,[4,e]]

:- [p10].

encode_modified_aux([], []).
encode_modified_aux([[1, X]|T1], [X|T2]) :- encode_modified_aux(T1, T2).
encode_modified_aux([[Y, X]|T1], [[Y, X]|T2]) :- \+ Y = 1, encode_modified_aux(T1, T2).
encode_modified(L1, L2) :- encode(L1, EncodeList), encode_modified_aux(EncodeList, L2).
