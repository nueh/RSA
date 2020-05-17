100 '=======================================================
110 ' TEST WHETHER A NUMBER IS PRIME .
120 ' USE PROBABILISTIC TEST BASED ON FERMAT' S THEOREM.
130 ' SEE KNUTH, "SEMINUMERICAL ALGORITHMS" .
140 '
150 ' PROMPT FOR NUMBER, TEST IT, AND PRONOUNCE VERDICT.
160 '=======================================================
170 ' DEFINE PARAMETERS.
180 '
190 DEFDBL N,P,X,Y                 ' DOUBLE PRECISION
200 K = 10                         ' NUMBER OF TEST CASES
210 '-------------------------------------------------------
220 ' GET A NUMBER TO BE TESTED. CHECK THE SIZE.
230 '
240 PRINT
250 INPUT "NUMBER"; N              ' GET A NUMBER TO TEST
260 IF N < 3 THEN END
270 IF N > 99999999 THEN PRINT "TOO BIG" : GOTO 240
280 '-------------------------------------------------------
290 ' DETERMINE WHETHER N IS PRIME.
300 '
310 PRINT "TEST NUMBER: ";
320 FOR I=1 TO K                   ' TEST CASES
330     X = 2 + INT((N-2)*RND(0))          ' TEST VALUE
340     PRINT X;
350     GOSUB 490                          ' PERFORM TEST
360     IF Y <> 1 GOTO 380                 ' NOT PRIME?
370 NEXT I
380 PRINT : PRINT                  ' NOT PRIME IF Y <> 1
390 '-------------------------------------------------------
400 ' PRINT THE VERDICT.
410 '
420 IF Y = 1  THEN PRINT N; "IS PROBABLY PRIME."
430 IF Y <> 1 THEN PRINT N; "IS NOT PRIME."
440 '-------------------------------------------------------
450 GOTO 240                       ' RUN THE PROGRAM AGAIN
460 '-------------------------------------------------------
470' SUBROUTINE. COMPUTE Y = [X^(N-1)] MOD N.
480 '
490 Y = 1 : P = N-1
500 IF P/2 = INT(P/2) GOTO 520         ' IF P IS EVEN, SKIP
510 Y = Y * X : Y = Y - INT(Y/N) * N   ' (Y * X) MOD N
520 X = X * X : X = X - INT(X/N) * N   ' (X * X) MOD N
530 P = INT(P/2) : IF P > 0 GOTO 500
540 RETURN
550 '=======================================================