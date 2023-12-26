cycles max

rem cd bios
rem call build
rem cd ..
rem cd dos
rem call build
rem cd ..

set path=C:\DOS600;Z:\
tcc -Ic:\dos600\include -Lc:\dos600\lib fat1440.c
del f1440.img
del fat1440.obj
fat1440.exe
del fat1440.exe
nasm -O0 f1440.asm -o f1440.img
del fat1440.bin
