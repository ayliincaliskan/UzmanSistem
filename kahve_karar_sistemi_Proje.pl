:- dynamic yes/1,no/1.


go :- kahve(Kahve),
       write('Size uygun kahveler : '),
       write(Kahve), nl, undo.

/* Kahve testleri */

kahve(eiskaffee) :- eiskaffee, !.
kahve([mocha,macchiato,espressino]) :- mocha, !.
/* kahve(macchiato) :- macchiato, !. kahve(espressino) :- espressino, !. */
kahve([latte,conpanna]) :- latte, !.
/*kahve(conpanna) :- conpanna, !.*/
kahve([cappucino,cortado,flat_White]) :- cappucino, !.
/*kahve(cortado) :- cortado, !. kahve(flat_White) :- flat_White, !.*/
kahve(shinShin) :- shinShin, !.
kahve(colypso) :- colypso, !.
kahve([carettto,manks]) :- carettto, !.
/*kahve(manks) :- manks, !.*/
kahve(english) :- english, !.
kahve(gaelic) :- gaelic, !.
kahve(russian) :- russian, !.
kahve(filtre_kahve) :- filtre_kahve, !.
kahve(affagato) :- affagato, !.
kahve([amerikano,lungo,espresso_coffee]) :- amerikano, !.
/*kahve(lungo) :- lungo, !.
kahve(espresso_coffee) :- espresso_coffee, !.*/

/* kahve tanima kurallari */

eiskaffee:-sutlu,verify(sut),verify(krema),verify(dondurma).
mocha:-sutlu,verify(sut),verify(krema),verify(cikolata).
macchiato:-sutlu,verify(sut),verify(krema),verify(cikolata).
espressino:-sutlu,verify(sut),verify(krema),verify(cikolata).
latte:-sutlu,verify(sut),verify(krema).
conpanna:-sutlu,verify(sut),verify(krema).
cappucino:-sutlu,verify(sut).
cortado:-sutlu,verify(sut).
flat_White:-sutlu,verify(sut).



shinShin :- filtre_kategori,verify(filtre),verify(alkol),verify(krema).
colypso :- filtre_kategori,verify(filtre),verify(alkol),verify(cikolata).
carettto :- filtre_kategori,verify(filtre),verify(alkol),verify(likor).    
manks :- filtre_kategori,verify(filtre),verify(alkol),verify(likor).
english :- filtre_kategori,verify(filtre),verify(alkol),verify(cin).
gaelic :- filtre_kategori,verify(filtre),verify(alkol),verify(viski).
russian :-filtre_kategori,verify(filtre),verify(alkol),verify(votka).
filtre_kahve :- filtre_kategori,verify(filtre).



affagato :- espresso_kategori,verify(espresso),verify(dondurma).
amerikano:- espresso_kategori,verify(espresso).
lungo:-espresso_kategori,verify(espresso).
espresso_coffee:-espresso_kategori,verify(espresso).




/* siniflama kurallari */

sutlu:- verify(sut), !.
sutlu:- verify(sut),verify(krema), !.
sutlu:- verify(sut),verify(krema),verify(dondurma), !.
sutlu:- verify(sut),verify(krema),verify(cikolata).

filtre_kategori:- not(sutlu),verify(filtre), !.
filtre_kategori:- not(sutlu),verify(filtre),verify(alkol), !.
filtre_kategori:- not(sutlu),verify(filtre),verify(alkol),verify(krema), !.
filtre_kategori:- not(sutlu),verify(filtre),verify(alkol),verify(cikolata), !.
filtre_kategori:- not(sutlu),verify(filtre),verify(alkol),verify(likor), !.
filtre_kategori:- not(sutlu),verify(filtre),verify(alkol),verify(cin), !.
filtre_kategori:- not(sutlu),verify(filtre),verify(alkol),verify(viski), !.
filtre_kategori:- not(sutlu),verify(filtre),verify(alkol),verify(votka).


espresso_kategori:- not(filtre_kategori),verify(espresso), !.
espresso_kategori:- not(filtre_kategori),verify(espresso),verify(dondurma).



return_list_members([X|_], X).
return_list_members([_|T], X):-
  return_list_members(T, X).


/* sorular nasil sorulacak */
ask(Question) :-
        write('Kahvede olsun : '),
        write(Question), write('? '),
         read(Response), nl,
         (Response == yes ; Response == y)
        ,assert(yes(Question)),!.

ask(Question):-
         assert(no(Question)), fail.
/* sogrulama */
verify(S) :-  yes(S),!.
verify(S) :-  not(no(S)),ask(S).
/* tum cevaplari geri al */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
