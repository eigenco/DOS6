imgmount -t floppy a f1440.img
copy dos600\debug.exe a:
copy dos600\qbasic.exe a:
copy sup\*.* a:
imgmount -u a
cycles 10000
boot f1440.img
