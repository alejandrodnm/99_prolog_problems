% 1.12 (**) Decode a run-length encoded list.
%     Given a run-length code list generated as specified in problem 1.11. Construct its uncompressed version.

decode([], []).
decode([[0, _] | L], LR) :- decode(L, LR).
decode([[N, X] | L], [X | LR]) :- N2 is N - 1, decode([[N2, X] | L], LR).
decode([X | L], [X | LR]) :- \+ is_list(X), decode(L, LR).
