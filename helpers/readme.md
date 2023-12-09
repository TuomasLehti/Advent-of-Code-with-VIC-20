# Helper Programs

This folder includes helper programs.

## Input Converter (inpconv.bas)

The input files of Advent of Code are imported to a disk image with a PC, which creates problems with line endings and character encodings. Import Converter -helper converts the input file so that it is easier to be read with the VIC.

First quick version just removes the carriage returns. (Line endings in Windows are CRLF, in VIC LF.)

## Hex Dump (hexdump.bas)

Hex dumps intention is to dump contents of a file to printer or screen. It is still in early development.

The original reason to have a hex dump of a file is to check that inpconv.bas functions correctly. All coding with VIC, and no help from PC, right?