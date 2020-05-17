5 RANDOMIZE
10 PRINT "Programm zur Bestimmung des Public- und Secret-Keys"
20 PRINT "==================================================="
30 PRINT "Zur Bestimmung des Secret-Keys benoetigen Sie 2 (nur Ihnen bekannte)"
40 PRINT "Primzahlen p und q. Das folgende Programm besteht aus 2 Teilen:"
50 PRINT "Teil 1 sucht im Umfang einer beliebig gewaehlten Zahl die naechte"
60 PRINT "Primzahl, die sich fuer p oder q eignet."
70 PRINT "Teil 2 bestimmt aus den so gefundenen p und q die Secret-und Public-"
80 PRINT "Keys."
90 PRINT
100 PRINT "Start Teil 1": PRINT
110 DEFDBL N, P, O, R, S, X, Y: K = 10
120 INPUT "Zu analysierende Zahl (0 fuer Uebergang Programmteil 2): "; N
130 IF N = 0 THEN 280
140 IF N > 99999999 THEN PRINT "Bitte kleineren Wert waehlen": GOTO 120
150 IF N / 2 = INT(N / 2) THEN N = N - 1
160 FOR I = 1 TO K
    170 X = 2 + INT((N - 2) * RND(0))
    180 Y = 1: P = N - 1
    190 IF P / 2 = INT(P / 2) THEN 210
    200 Y = Y * X: Y = Y - INT(Y / N) * N
    210 X = X * X: X = X - INT(X / N) * N
    220 P = INT(P / 2): IF P > 0 THEN 190
    230 IF Y > 1 THEN 250
240 NEXT I
250 IF Y = 1 THEN PRINT N; " ist als Primzahl fuer p oder q qeeignet": GOTO 120
260 PRINT "Noch keine geeignete Zahl gefunden. Teste jetzt Zahl"; N: N = N - 2: GOTO 160
270 '
280 PRINT "Start Teil 2": PRINT
290 INPUT "Welchen Wert hatten Sie fuer p bestimmt : "; P
300 INPUT "Welchen Wert hatten Sie fuer q bestimmt : "; Q
310 PRINT
320 PRINT "lhr Public-Key lautet : "; P * Q
330 PRINT "Ihr Secret-Key lautet : "; (2 * (P - 1) * (Q - 1) + 1) / 3

