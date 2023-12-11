# Helper Programs

This folder includes helper programs.

## Input Converter (inpconv.bas)

The input files of Advent of Code are imported to a disk image with a PC, which creates problems with line endings and character encodings. Import Converter -helper converts the input file so that it is easier to be read with the VIC.

First quick version just removes the carriage returns. (Line endings in Windows are CRLF, in VIC LF.)

## Hex Dump (hexdump.bas)

Hex dumps intention is to dump contents of a file to printer or screen. It is still in early development.

The original reason to have a hex dump of a file is to check that inpconv.bas functions correctly. All coding with VIC, and no help from PC, right?

| Line | Code | Explanation |
|---|---|---|
| 1 | ```REM----------------``` |  |
| 2 | ```REM-HEX DUMP``` |  |
| 3 | ```REM----------------``` |  |
| 4 | ```REM-VERSION 0.2``` |  |
| 5 | ```REM----------------``` |  |
| 6 | ```REM-BY T.LEHTI 2023``` |  |
| 7 | ```REM----------------``` |  |
| 10 | ```FI$="DAY02TEST PC``` | This is the name of the file, from which the dump is made. TODO: Ask the file name from the user. |
| 100 | ```REM--------------``` |  |
| 101 | ```REM-MAIN LOOP``` |  |
| 102 | ```REM--------------``` |  |
| 110 | ```OPEN5,8,5,FI$+",S``` | Open a sequential file for reading from the disk. 5 = logical file number, 8 = device number (disk drive), 5 = channel, FI$ = file name, ,S = sequential file. |
| 115 | ```OPEN4,4``` | Open a channel to the printer. |
| 120 | ```A=0:PRINT#4:PRINT#4``` | Initialize the address variable A to zero. Print a few newlines to separate printouts from each other. |
| 130 | ```IF(AAND15)=0THEND=A:GOSUB210:PRINT#4:PRINT#4,H$;": ";``` | This program prints 16 bytes per line. If the current address is a multiple of 16, print the address. The subroutine in line 210 converts a word (2 bytes) from decimal to hexadecimal format. |
| 150 | ```GET#5,B$:S=ST:D=ASC(B$):GOSUB210``` | Read next byte from the file and save the IO status.  Then convert the byte to hex.|
| 160 | ```PRINT#4,RIGHT$(H$,2);" ";``` | Print the byte. |
| 170 | ```IFS>0THEN190``` | This is used to check if the end of the file is reached. This is a bit of a hack, since the IO status has other flags too. TODO: Actually check the EOF. If EOF, jump to the end. |
| 180 | ```A=A+1:GOTO130``` | No EOF detected. Increase address and go back to read the next byte. |
| 190 | ```PRINT#4:CLOSE4,5:END``` | Flush last line and close files. |
| 200 | ```REM--------------``` |  |
| 201 | ```REM-DEC TO HEX``` |  |
| 202 | ```REM--------------``` |  |
| 210 | ```HX$="0123456789ABCDEF":DD=D``` | Initialize a string with hexadecimal digits and save a local copy of the decimal number in question. |
| 220 | ```FORI=0TO4``` | Loop for 4 nibbles (half-bytes). |
| 230 | ```H$(I)=MID$(HX$,(DDAND15)+1,1)``` | Convert the least significant nibble to hex and add the answer to an array. |
| 240 | ```DD=INT(DD/16)``` | Get rid of the LSN in favor of the nextly significant nibble. |
| 250 | ```NEXTI``` | End loop. |
| 260 | ```H$=H$(3)+H$(2)+H$(1)+H$(0)``` | Construct the hex number. |
| 290 | ```RETURN``` | Return from subroutine. |