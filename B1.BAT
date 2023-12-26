cd bios

cycles max

del *.map
del *.bin
del *.obj
del *.com
del *.exe

..\bin\masm -I..\inc msload msload.obj nul.lst nul.crf
..\bin\link /tiny msload.obj,msload.com,,,,

..\bin\masm -I..\inc msbio1 msbio1.obj nul.lst nul.crf
..\bin\masm -I..\inc mschar mschar.obj nul.lst nul.crf
..\bin\masm -I..\inc msdisk msdisk.obj nul.lst nul.crf
..\bin\masm -I..\inc msdioctl msdioctl.obj nul.lst nul.crf
..\bin\masm -I..\inc msint13 msint13.obj nul.lst nul.crf
..\bin\masm -I..\inc msbio2 msbio2.obj nul.lst nul.crf
..\bin\masm -I..\inc msinit msinit.obj nul.lst nul.crf
..\bin\masm -I..\inc sysinit1 sysinit1.obj nul.lst nul.crf
..\bin\masm -I..\inc sysconf sysconf.obj nul.lst nul.crf
..\bin\masm -I..\inc syspre syspre.obj nul.lst nul.crf
..\bin\masm -I..\inc sysinit2 sysinit2.obj nul.lst nul.crf
..\bin\masm -I..\inc sysimes sysimes.obj nul.lst nul.crf
..\bin\masm -I..\inc power power.obj nul.lst nul.crf
..\bin\masm -I..\inc ptime ptime.obj nul.lst nul.crf
..\bin\masm -I..\inc msend msend.obj nul.lst nul.crf

..\bin\link @msbio.lnk
..\bin\reloc msbio.exe msbio.bin 70
copy /b msload.com+msbio.bin io.sys

del *.map
del *.bin
del *.obj
del *.com
del *.exe

cd ..
