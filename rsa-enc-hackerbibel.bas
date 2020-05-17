10 DEFDBL C, M, N: DIM M(100): ZEICHENPROBLOCK = 3
20 LINE INPUT "Name der Crypto-Ausgabedatei : "; AUS$
25 OPEN AUS$ FOR OUTPUT AS #1
30 INPUT "Public-Key des Empfaengers (Testvoreistellung bei RETURN = 94815109)"; N
40 IF N = O THEN N = 94815109
60 PRINT "Nachrichtentext eingeben oder NNNN am Zeilenanfang fuer Ende"
70 W = W + 1: PRINT W;: LINE INPUT ": "; M$
71 IF LEFT$(M$, 4) = "NNNN" OR LEFT$(M$, 4) = "nnnn" THEN CLOSE: PRINT: PRINT "Cryptogramm unter Datei: "; AUS$; " abgespeichert.": PRINT: PRINT: END
80 M$ = M$ + CHR$(13): L = LEN(M$): Q = INT(L / ZEICHENPROBLOCK)
90 R = L - Q * ZEICHENPROBLOCK
100 IF R > O THEN M$ = M$ + CHR$(0): GOTO 80
110 FOR I = O TO Q - 1
    120 M(I) = 0
    130 FOR J = 1 TO ZEICHENPROBLOCK
        140 A = ASC(MID$(M$, 3 * I + J, 1))
        150 M(I) = M(I) * 100
        160 M(I) = M(I) + A
    170 NEXT J
180 NEXT I
185 PRINT: PRINT "Cryptogramm:": PRINT
190 FOR I = 0 TO Q - 1
    200 M = M(I)
    210 C = M * M: C = C - INT(C / N) * N: C = C * M: C = C - INT(C / N) * N
    220 PRINT #1, C;
    225 PRINT C;
230 NEXT I
235 PRINT: PRINT
240 GOTO 70



