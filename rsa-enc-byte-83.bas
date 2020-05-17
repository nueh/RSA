100 '=======================================================
110 ' ENCRYPT MESSAGES, USING A MINIATURE VERSION OF THE
120 ' RIVEST-SHAMIR-ADLEMAN PUBLIC KEY CRYPTOSYSTEM.
130 '
140 ' PROMPT FOR THE MESSAGE TO BE ENCRYPTED, PRINT THE
150 ' NUMERIC FORM OF THE MESSAGE, AND PRINT THE CRYPTOGRAM.
160 '=======================================================
170 ' DEFINE PARAMETERS.
180 '
190 DEFDBL C,M,N                ' C, M, AND N HAVE 16 DIGITS
200 DIM M(100)                  ' MESSAGE BLOCKS
210 CHRS = 3                    ' CHARACTERS PER BLOCK
220 N = 94815109                ' ENCRYPTION KEY, OR MODULUS
230 '-------------------------------------------------------
240 ' GET THE MESSAGE FROM THE USER.
250 '
260 PRINT : M$ = ""
270 INPUT "MESSAGE"; M$       ' MESSAGE FOR ENCRYPTION
280 IF M$ = "" THEN END         ' STOP IF NOTHING IS ENTERED
290 PRINT
300 '-------------------------------------------------------
310 ' ADD ZEROS TO MESSAGE, IF NECESSARY, TO MAKE ITS LENGTH
320 ' A MULTIPLE OF THREE ( AN EVEN NUMBER OF BLOCKS ).
330 '
340 L = LEN(M$)                 ' LENGTH OF MESSAGE
350 Q = INT(L/CHRS)             ' NUMBER OF COMPLETE BLOCKS
360 R = L - Q * CHRS            ' LENGTH OF PARTIAL BLOCK
370 IF R > 0 THEN M$ = M$ + CHR$(0) : GOTO 340 ' ADD A ZERO?
380 '-------------------------------------------------------
390 ' CONVERT THE MESSAGE TO NUMERIC FORM, AND PRINT IT.
400 '
410 FOR I=0 TO Q-1              ' I IS THE BLOCK NUMBER
420   M(I) = 0                  ' CONVERT BLOCK I TO NUMERIC
430   FOR J=1 TO CHRS               ' FOR EACH CHAR IN BLOCK
440     A = ASC(MID$(M$,3*I+J,1))   ' CONVERT TO NUMBER
450     M(I) = M(I) * 100           ' SHIFT BLOCK LEFT
460     M(I) = M(I) + A             ' ADD THE CHARACTER
470   NEXT J
480   PRINT M(I);               ' PRINT THE BLOCK
490 NEXT I                      ' DO THE NEXT BLOCK
500 PRINT : PRINT
510 '-------------------------------------------------------
520 ' ENCRYPT THE MESSAGE, AND PRINT THE CRYPTOGRAM.
530 '
540 PRINT "CRYPTOGRAM:" : PRINT
550 FOR I=0 TO Q-1              ' I IS THE BLOCK NUMBER
560   M = M(I)
570   GOSUB 670                 ' ENCRYPT THE BLOCK
580   PRINT C;                  ' PRINT IT
590 NEXT I                      ' DO THE NEXT ONE
600 PRINT
610 '-------------------------------------------------------
620 GOTO 260                    ' RUN THE PROGRAM AGAIN
630 '-------------------------------------------------------
640 ' SUBROUTINE. ENCRYPT ONE MESSAGE BLOCK.
650 ' COMPUTE C = (M^3) MOD N.
660 '
670 C = M * M : C = C - INT(C/N) * N
680 C = C * M : C = C - INT(C/N) * N
690 RETURN
700 '=======================================================