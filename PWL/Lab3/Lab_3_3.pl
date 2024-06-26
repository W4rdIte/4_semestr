znajdz_mniejsza([], _, S, S).
znajdz_mniejsza([G|O], X, S, K) :-
	(   X > G -> T is S + 1 ; T = S),
	znajdz_mniejsza(O, X, T, K).

ilosc_inwersji([], S, S).
ilosc_inwersji([G|O], S, K) :-
	znajdz_mniejsza(O, G, 0, W),
	T is S + W,
	ilosc_inwersji(O, T, K).

sprawdz_parzystosc(L) :-
	ilosc_inwersji(L, 0, I),
	0 is I mod 2.

even_permutation(Xs, Ys) :-
	permutation(Xs, Ys),
	sprawdz_parzystosc(Ys).

odd_permutation(Xs, Ys) :-
	permutation(Xs, Ys),
	\+ sprawdz_parzystosc(Ys).
