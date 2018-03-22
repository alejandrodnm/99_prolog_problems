% P06 (*) Find out whether a list is a palindrome.

palindrome_aux([], []).
palindrome_aux([H|T1], [H|T2]) :- palindrome_aux(T1, T2).
palindrome(X) :- reverse(X, RX), palindrome_aux(X, RX).

% PAGE SOLUTION
palindrome_solution(L) :- reverse(L, L).
