#set text(
  font: "New Computer Modern",
  size: 13pt
)

#set page(paper: "a4", margin: (x: 1.5cm, y: 1.5cm))
#set align(center)
= Deathmatch
=== Krzysztof Nasuta 193328 Aleksander Iwicki 193354 Filip Dawidowski 193433
= 
#set align(left)
#set heading(numbering: "1.")
= Wstęp
Celem projektu było stworzenie gry deathmatch, w której gracze mogą walczyć ze sobą na arenie. Do stworzenia gry użyto języka C++ oraz biblioteki Boost. Gra działa w trybie tekstowym, sterowanie odbywa się za pomocą klawiatury. Gracze mogą poruszać się po arenie, strzelać do siebie oraz zbierać ulepszenia (np szybsze strzelanie). Grę wygrywa gracz, który zdobędzie wcześniej określoną liczbę punktów, które zdobywa się poprzez eliminacje przeciwników. 

= Działanie z punktu widzenia użytkownika
Na początku gracz wpisuje IP serwera, na którym chce grać. Następnie gracz wybiera nick, którym będzie się posługiwał w grze. Po wybraniu nicku gracz dołącza do lobby gdzie widzi wszystkich innych graczy i może zaznaczyć gotowość. Po zaznaczeniu gotowości przez wszystkich użytkowników rozpoczyna się rozgrywka. Gracz możę poruszać się po arenie za pomocą klawiszy W, A, S, D i stzrelać za pomocą strzałek. Po wejściu na pole z ulepszeniem gracz je automatycznie podnosi. Za każdą eliminację przeciwnika gracz zdobywa punkt. Grę wygrywa gracz, który zdobędzie wcześniej określoną liczbę punktów.


= Działanie serwera
Na początku serwer oczekuje na połączenie od klientów. Po połączeniu serwer tworzy nowego gracza i dodaje go do listy graczy. Serwer oczekuje na gotowość graczy. Po zaznaczeniu gotowości przez wszystkich graczy serwer rozpoczyna grę. Przez całą grę serwer odbiera od klientów informacje o ich ruchach i strzałach i od razu przesyła je do inncyh graczy, jednocześnie symulując cały stan gry u siebie. Co określoną ilość czasu, np raz na 10 ticków gry serwer rozsyła do graczy swój stan gry. Po zakończeniu gry serwer wysyła do wszystkich klientów informację o zakończeniu gry.

co się stanie jak gracz wejdzie w nieśmiertelnośc i zostanie trafiony

proryttyzyacja synchornizacji stanu gry zależnie od odległości


co jeśli udp nie przyjdize w kolejności





dlaczego chaetownaie nie bendzie działac

#pagebreak()
== Struktura komunikatów
#table(
  columns: (auto, auto, auto),
  table.cell(colspan: 3, align(center)[*Dołączenie do gry*], align: center),
  align(center)[*Nazwa pola*], align(center)[*Typ danych*], align(center)[*Opis*],
  [nick_length], [int32], [Długość nicku gracza (maksymalnie: 20)],
  [nick], [char[]], [Nick gracza o długości nick_length],
)

#table(
  columns: (auto, auto, auto),
  table.cell(colspan: 3, align(center)[*Przesłanie informacji o mapie*], align: center),
  align(center)[*Nazwa pola*], align(center)[*Typ danych*], align(center)[*Opis*],
  [width], [int32], [Szerokość mapy],
  [height], [int32], [Długość mapy],
  [tiles], [MapTile[]], [Tablica kafelków mapy o rozmiarach width*height, każdy kafelek ma rozmiar 4 bajtów]
)

#pagebreak()
= Diagram sekwencji
#align(center)[#image("diagrams/sequence.png", height: 95%)]

#pagebreak()
= Diagram klas
#align(center)[#image("diagrams/class.png")]
#pagebreak()