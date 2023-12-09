# Helper Programs

This folder includes helper programs.

## Input Converter (INPCONV)

The input files of Advent of Code are imported to a disk image with a PC, which creates problems with line endings and character encodings. Import Converter -helper converts the input file so that it is easier to be read with the VIC.

First quick version just removes the carriage returns. (Line endings in Windows are CRLF, in VIC LF.)