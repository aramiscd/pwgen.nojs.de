# Wie kann ich mich vergewissern, dass die Anwendung die erzeugten Passwörter nicht protokolliert?

Es handelt sich um eine in sich geschlossene Frontend-Anwendung ohne
Server-Backend.  Das heißt: beim Laden der Anwendung wird JavaScript-Code in
deinen Browser geladen.  Danach erfolgt kein weiterer Datenaustausch über
das Netzwerk.  Du kannst das mit dem integrierten Netzwerkanalyse-Werkzeug
in deinem Browser überprüfen: wenn dort nach dem Erzeugen der Passwörter
kein Datenaustausch über das Netzwerk aufgelistet wird, weißt du, dass
auch die Passwörter nicht heimlich irgendwohin gesendet worden sind.


# Das reicht mir nicht!  Siehe Dieselgate!

Im Jahr 2015 wurde öffentlich, dass die Dieselfahrzeuge der Volkswagen
AG (und anderer deutscher Autohersteller) mit einer Motorsteuerung
ausgestatten waren, die den Motor auf dem Abgasprüfstand anders steuert
als auf der Straße, um die Abgasprüfverfahren zu bestehen, ohne dafür
im Normalgebrauch eine entsprechend geringere Motorleistung zu haben,
die sich vermutlich negativ auf die Verkaufszahlen niedergeschlagen hätte.

Analog könnte ein Online-Passwort-Generator, der im Normalbetrieb
Passwörter protokolliert, vielleicht irgendwie erkennen, ob er unter
die Lupe genommen wird, um die erzeugten Passwörter genau in diesem Fall
nicht zu protokollieren.

Um so etwas auszuschließen, wirst du den Quelltext lesen und
verstehen müssen.  Der Quelltext ist öffentlich verfügbar in genau
dem Git-Repository, in dem sich auch die Datei befindet, die du gerade
liest. Wenn dir das Fachwissen fehlt, um den Quelltext zu lesen und zu
verstehen, nützt dir das unmittelbar herzlich wenig.  Immerhin ist der
Quelltext öffentlich, so dass andere mit dem nötigen Fachwissen auch
die Möglichkeit haben, den Quelltext zu studieren.


# Woher weiß ich, dass die Anwendung tatsächlich aus den hier veröffentlichten Quellen besteht?

In dem oben erwähnten Netzwerkanalyse-Werkzeug werden die Dateien
aufgelistet, die beim Laden der Anwendung aus dem Netzwerk bezogen werden.
Gegenwärtig (also während ich dieses Dokument schreibe) sind das die
folgenden:

- `app.css`
- `app.js`
- `favicon.ico`

Insbesondere die Datei `app.js` ist wichtig.  Da ist der Programm-Code drin.
Du könntest also (wieder mit dem entsprechenden Fachwissen) die Quellen
aus diesem Git-Repository herunterladen, die Datei `app.js` aus den Quellen
selbst erzeugen und anschließend mit der `app.js` Datei vergleichen, die
beim Laden der Anwendung aus dem Netzwerk bezogen wird.  Wenn die Dateien
übereinstimmen, weißt du, dass der Quelltext deiner selbst erzeugen
`app.js` Datei auch ein Quelltext der anderen `app.js` Datei ist.

Wenn du supergründlich sein willst, kannst du die anderen Dateien auf
die gleiche Weise überprüfen.

Den Dateivergleich musst du nicht Zeichen für Zeichen selbst
durchführen. Es gibt Software, die beim Vergleich von Dateien hilft
(sogenannte Diff-Tools). Noch besser ist ein Generator für kryptografische
Prüfsummen.  Der erzeugt aus dem Inhalt einer Datei einen digitalen
Fingerabdruck (eine sogenannte Prüfsumme), z.B.

    6fa5c6306c86ae528da6061e5cfd2bbb6d0cb4de  app.js

Dann musst du für zwei Dateien nur kontrollieren, dass die Prüfsummen
übereinstimmen, um dich zu vergewissern, dass sie auch in ihrem Inhalt
übereinstimmen.


# Ist der Zufallsgenerator, mit dem die Passwörter erzeugt werden, kryptografisch robust?

Leider nein.  Ich verwende
[diesen](https://packages.gren-lang.org/package/gren-lang/core/version/5.1.0/module/Random)
Zufallszahlengenerator. Der basiert auf einem
[PCG](https://www.pcg-random.org/)-Verfahren (*Permuted Congruential
Generator*).  Diese Verfahren sind computational sehr effizient und für
viele Anwendungsfälle ausreichend, aber kryptografisch nicht besonders
robust.  Das heißt nicht, dass dein Ex-Boyfriend, der sich sehr gut mit
Computern auskennt, deine Passwörter knacken kann! Aber es heißt zum
Beispiel, dass du den Zugangscode für ein Atomkraftwerk auf andere Weise
erzeugen solltest.
