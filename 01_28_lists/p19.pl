% 1.19 (**) Rotate a list N places to the left.
%     Examples:
%     ?- rotate([a,b,c,d,e,f,g,h],3,X).
%     X = [d,e,f,g,h,a,b,c]

%     ?- rotate([a,b,c,d,e,f,g,h],-2,X).
%     X = [g,h,a,b,c,d,e,f]

%     Hint: Use the predefined predicates length/2 and append/3, as well as the result of problem 1.17.
:- [p18].

rotate(L, 0, L).
rotate(L, N, L) :- abs(N, Nabs), length(L, LenL), Nabs == LenL.
rotate(L, N, X) :- length(L, LenL), abs(N, Nabs), Nabs > LenL,
  NewN is Nabs mod LenL,
  rotate(L, NewN, X).
rotate(L, N, X) :- N > 0, length(L, LenL), N < LenL,
  slice(L, 1, N, Tail), N2 is N + 1,
  slice(L, N2, LenL, Head),
  append(Head, Tail, X).
rotate(L, N, X) :- N < 0, length(L, LenL), abs(N, Nabs), Nabs < LenL,
  Idx is LenL - Nabs, slice(L, 1, Idx, Tail),
  Idx2 is Idx + 1, slice(L, Idx2, LenL, Head),
  append(Head, Tail, X).

% Solution:
%
% rotate(L1,N,L2) :- N >= 0,
%    length(L1,NL1), N1 is N mod NL1, rotate_left(L1,N1,L2).
% rotate(L1,N,L2) :- N < 0,
%    length(L1,NL1), N1 is NL1 + (N mod NL1), rotate_left(L1,N1,L2).

% rotate_left(L,0,L).
% rotate_left(L1,N,L2) :- N > 0, split(L1,N,S1,S2), append(S2,S1,L2).
