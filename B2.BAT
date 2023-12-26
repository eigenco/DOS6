cd dos

cycles max

del *.img
del *.map
del *.bin
del *.obj
del msdos.exe
del *.com
del *.sys
del strip.exe
tcc -Ic:\dos600\include -Lc:\dos600\lib strip.c

..\bin\masm -I..\inc dosprint dosprint.obj nul.lst nul.crf
..\bin\masm -I..\inc exepatch exepatch.obj nul.lst nul.crf
..\bin\masm -I..\inc mscode mscode.obj nul.lst nul.crf
..\bin\masm -I..\inc time time.obj nul.lst nul.crf
..\bin\masm -I..\inc getset getset.obj nul.lst nul.crf
..\bin\masm -I..\inc parse parse.obj nul.lst nul.crf
..\bin\masm -I..\inc misc misc.obj nul.lst nul.crf
..\bin\masm -I..\inc misc2 misc2.obj nul.lst nul.crf
..\bin\masm -I..\inc crit crit.obj nul.lst nul.crf
..\bin\masm -I..\inc cpmio cpmio.obj nul.lst nul.crf
..\bin\masm -I..\inc cpmio2 cpmio2.obj nul.lst nul.crf

..\bin\masm -I..\inc mstable mstable.obj nul.lst nul.crf
..\bin\masm -I..\inc msdisp msdisp.obj nul.lst nul.crf
..\bin\masm -I..\inc fcbio fcbio.obj nul.lst nul.crf
..\bin\masm -I..\inc fcbio2 fcbio2.obj nul.lst nul.crf
..\bin\masm -I..\inc segcheck segcheck.obj nul.lst nul.crf

..\bin\masm -I..\inc search search.obj nul.lst nul.crf
..\bin\masm -I..\inc path path.obj nul.lst nul.crf
..\bin\masm -I..\inc ioctl ioctl.obj nul.lst nul.crf
..\bin\masm -I..\inc delete delete.obj nul.lst nul.crf
..\bin\masm -I..\inc rename rename.obj nul.lst nul.crf
..\bin\masm -I..\inc finfo finfo.obj nul.lst nul.crf

..\bin\masm -I..\inc dup dup.obj nul.lst nul.crf
..\bin\masm -I..\inc create create.obj nul.lst nul.crf
..\bin\masm -I..\inc open open.obj nul.lst nul.crf
..\bin\masm -I..\inc dinfo dinfo.obj nul.lst nul.crf
..\bin\masm -I..\inc isearch isearch.obj nul.lst nul.crf
..\bin\masm -I..\inc buf buf.obj nul.lst nul.crf

..\bin\masm -I..\inc abort abort.obj nul.lst nul.crf
..\bin\masm -I..\inc close close.obj nul.lst nul.crf
..\bin\masm -I..\inc dircall dircall.obj nul.lst nul.crf
..\bin\masm -I..\inc disk disk.obj nul.lst nul.crf
..\bin\masm -I..\inc disk2 disk2.obj nul.lst nul.crf
..\bin\masm -I..\inc disk3 disk3.obj nul.lst nul.crf
..\bin\masm -I..\inc dir dir.obj nul.lst nul.crf

..\bin\masm -I..\inc dir2 dir2.obj nul.lst nul.crf
..\bin\masm -I..\inc dev dev.obj nul.lst nul.crf
..\bin\masm -I..\inc mknode mknode.obj nul.lst nul.crf
..\bin\masm -I..\inc rom rom.obj nul.lst nul.crf
..\bin\masm -I..\inc fcb fcb.obj nul.lst nul.crf
..\bin\masm -I..\inc msctrlc msctrlc.obj nul.lst nul.crf
..\bin\masm -I..\inc fat fat.obj nul.lst nul.crf

..\bin\masm -I..\inc msproc msproc.obj nul.lst nul.crf
..\bin\masm -I..\inc alloc alloc.obj nul.lst nul.crf
..\bin\masm -I..\inc srvcall srvcall.obj nul.lst nul.crf
..\bin\masm -I..\inc util util.obj nul.lst nul.crf
..\bin\masm -I..\inc macro macro.obj nul.lst nul.crf
..\bin\masm -I..\inc macro2 macro2.obj nul.lst nul.crf

..\bin\masm -I..\inc handle handle.obj nul.lst nul.crf
..\bin\masm -I..\inc file file.obj nul.lst nul.crf
..\bin\masm -I..\inc lock lock.obj nul.lst nul.crf
..\bin\masm -I..\inc romfind romfind.obj nul.lst nul.crf
..\bin\masm -I..\inc share share.obj nul.lst nul.crf
..\bin\masm -I..\inc msinit msinit.obj nul.lst nul.crf
..\bin\masm -I..\inc origin origin.obj nul.lst nul.crf

..\bin\masm -I..\inc msdata.asm msdata.obj nul.lst nul.crf
..\bin\masm -I..\inc msdosme.asm msdosme.obj nul.lst nul.crf

..\bin\link @msdos.lnk

rem remove the exe header (first 512 bytes)
..\bin\reloc msdos.exe msdos.bin

strip msdos.bin msdos.sys

del *.img
del *.map
del *.bin
del *.obj
del msdos.exe
del *.com
del strip.exe

cd ..
