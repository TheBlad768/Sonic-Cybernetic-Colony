@echo off
_exec\asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /o ws+ /p /o ae- sonic1.asm, s1built.bin, s1built.sym, s1built.lst
if not exist s1built.sym goto lablpause
_exec\convsym s1built.sym s1built.symcmp
copy /B s1built.bin+s1built.symcmp s1built.bin /Y
if exist s1built.sym del s1built.sym
if exist s1built.symcmp del s1built.symcmp
_exec\rompad  s1built.bin 255 0
_exec\fixheadr s1built.bin
if exist s1built.bin goto lablexit
:lablpause
pause
:lablexit
exit /b