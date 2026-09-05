Opis algorytmu

Algorytm w pierwszej kolejności oblicza wektor w kierunku pozycji gracza.
Następnie wykonuje funkcję test_move, aby sprawdzić, czy na drodze do gracza znajdują się jakieś przeszkody. Jeżeli nie, to porusza się bezpośredniego do niego.
Jeżeli jednak występuje jakaś przeszkoda, to algorytm musi znaleźć sposób na jej ominięcie. Robi to poprzez liczenie 'punktów' skanując przestrzeń co określoną liczbę stopni
wokół kierunku prowadzącego do gracza. Punkty są obliczane na podstawie iloczynów skalarnych do wektora kierunku do gracza oraz aktualnego wektora ruchu. Ten drugi otrzymuje jeszcze małą
przewagę, aby przeciwnik zachował aktualny kierunek ruchu nawet jeżeli pozycja gracza się znacząco zmieni. Jeżeli jednak algorytm zorientuje się, ponownie za pomocą funkcji test_move,
że dany kąt pokieruje go w ścianę, to zamiast obliczenia punktów przypisze od razu bardzo niską ocenę.
Na koniec wybierany jest najlepszy z kątów i w tę stronę przeciwnik zacznie się poruszać.

Próbowałem również wykonać algorytm na podstawie ray castów i nawet shape castów, ale przynosiło to mierne efekty, więc poeksperymentowałem z funkcją test_move. 
