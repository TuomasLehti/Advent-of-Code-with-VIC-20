1 REM----------------
2 REM-HEX DUMP
3 REM----------------
4 REM-VERSION 0.5
5 REM----------------
6 REM-BY T.LEHTI 2023
7 REM----------------
10 FI$="HEXDUMP 0.3
100 REM--------------
101 REM-MAIN LOOP
102 REM--------------
110 OPEN5,8,5,FI$+",P
115 OPEN4,4
120 A=0:PRINT#4:PRINT#4
130 IF(AAND15)=0THEND=A:GOSUB210:PRINT#4,C$:PRINT#4,H$;": ";:C$=""
150 GET#5,B$:S=ST:B$=LEFT$(B$+CHR$(0),1):D=ASC(B$):GOSUB210
160 PRINT#4,RIGHT$(H$,2);" ";:IFD>31ANDD<95THENC$=C$+B$:GOTO170
165 C$=C$+"."
170 IFS>0THEN190
180 A=A+1:GOTO130
190 PRINT#4,C$:PRINT#4:CLOSE4,5:END
200 REM--------------
201 REM-DEC TO HEX
202 REM--------------
210 HX$="0123456789ABCDEF":DD=D
220 FORI=0TO4
230 H$(I)=MID$(HX$,(DDAND15)+1,1)
240 DD=INT(DD/16)
250 NEXTI
260 H$=H$(3)+H$(2)+H$(1)+H$(0)
290 RETURN