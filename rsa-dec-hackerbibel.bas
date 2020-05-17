10 DEFDBL C, D, M, N
11 ZEICHENPROBLOCK = 3
20 INPUT "Eigener Public-Key (Test = 0 + CR = 94815109): "; N
30 IF N = 0 THEN N = 94815109
40 INPUT "Eigener Secret-Key (Test = 0 + CR = 63196467): "; D
50 IF D = 0 THEN D = 63196467
51 LINE INPUT "Dateiname fuer entschluesselten Text: "; AUS$
52 OPEN "O", 2, AUS$
60 LINE INPUT "Cryptogramm von <D>atei oder <M>anuell: "; FRAG$
70 IF FRAG$ = "M" OR FRAG$ = "m" THEN MANUELL = -1: GOTO 90 ELSE MANUELL = 0
80 LINE INPUT "Dateiname der Crypto-Datei : "; DATEI$: OPEN "I", 1, DATEI$
81 IF NOT (MANUELL) THEN PRINT: PRINT "Entschluesselter Text:": PRINT: PRINT
90 IF MANUELL THEN PRINT: INPUT "Cryptoblock : "; C ELSE IF EOF(1) THEN CLOSE: PRINT "Textende.": PRINT: PRINT: END ELSE INPUT #1, C
91 IF C = 0 THEN END
100 D1 = D: M = 1
110 IF D1 / 2 = INT(D1 / 2) THEN 130
120 M = M * C: M = M - INT(M / N) * N
130 C = C * C: C = C - INT(C / N) * N
140 D1 = INT(D1 / 2): IF D1 > 0 THEN 110
150 M$ = STR$(M): M$ = RIGHT$(M$, LEN(M$) - 1): 'blank vorweg bei einigen interpr.
160 LX = LEN(M$): IF (LX / 2) < INT(LX / 2) THEN M$ = "0" + M$: GOTO 160
170 FOR T = 1 TO ZEICHENPROBLOCK
    180 ZEICHEN$ = MID$(M$, 1 + (T - 1) * 2, 2): ZEICHEN$ = CHR$(VAL(ZEICHEN$))
    190 PRINT ZEICHEN$;
    200 PRINT #2, ZEICHEN$;
210 NEXT T
220 GOTO 90

