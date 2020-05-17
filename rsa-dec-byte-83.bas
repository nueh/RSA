100 '=======================================================
110 ' DECRYPT MESSAGES, USING A MINIATURE VERSION OF THE
120 ' RIVEST-SHAMIR-ADLEMAN PUBLIC KEY CRYPTOSYSTEM.
130 '
140 ' PROMPT FOR THE CRYPTOGRAM BLOCK TO BE DECRYPTED, AND
150 ' DECRYPT AND PRINT THE MESSAGE BLOCK, IN NUMERIC FORM.
160 '=======================================================
170 ' DEFINE PARAMETERS.
180 '
190 DEFDBL C,D,M,N                      ' DOUBLE PRECISION
200 N = 94815109 : D = 63196467         ' KEYS
210 '-------------------------------------------------------
220 ' MAIN PROGRAM LOOP.
230 '
240 INPUT "CRYPTOGRAM BLOCK"; C         ' USER ENTRY
250 IF C = 0 THEN END                   ' STOP IF NO ENTRY
260 GOSUB 340                           ' DECRYPT BLOCK
270 PRINT M                             ' MESSAGE BLOCK
280 GOTO 240                            ' REPEAT
290 '-------------------------------------------------------
300 ' SUBROUTINE. DECRYPT C, CRYPTOGRAM BLOCK.
310 ' COMPUTE M = (C^D) MOD N. USE MODIFIED RUSSIAN PEASANT
320 ' ALGORITHM (BYTE, OCTOBER 1981, PAGE 376).
330 '
340 D1 = D : M = 1
350 IF D1/2 = INT(D1/2) GOTO 370        ' IF D1 IS EVEN, SKIP
360 M = M * C : M = M - INT(M/N) * N    ' M = (M * C) MOD N
370 C = C * C : C = C - INT(C/N) * N    ' C = (C * C) MOD N
380 D1 = INT(D1/2) : IF D1 > 0 GOTO 350
390 RETURN
400 '=======================================================