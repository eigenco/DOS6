        cpu     8086
        org     0x7c00

        jmp     short start
        nop

OEM_NAME:          db      'MSDOS6.0'    ; [03] OEM System Name

BIOS_Parameter_Block:

BYTES_PER_SECTOR:  dw      512           ; [0B] Bytes per Sector
SECT_PER_CLUST:    db      1             ; [0D] Sectors per Cluster
RESERVED_SECT:     dw      1             ; [0E] Reserved sectors
NUM_FATS:          db      2             ; [10] FATs on the diskette
ROOT_DIR_ENTRIES:  dw      224           ; [11] Root Directory entries
TOTAL_SECTORS:     dw      2880          ; [13] Total Sectors
MEDIA_DESCR:       db      0xF0          ; [15] Media Descriptor Byte
SECT_PER_FAT:      dw      9             ; [16] Sectors per FAT
SECTORS_PER_TRACK: dw      18            ; [18] Sectors per Track
HEADS:             dw      2             ; [1A] Heads
RESERVED:          dw      0, 0, 0, 0, 0 ; [1C] Reserved
SIGNATURE:         db      0x29          ; [26] Extended BPB Signature Byte
VOL_SERIAL:        dd      0             ; [27] Volume Serial Number
VOL_LABEL:         db      '           ' ; [2B] Volume Label
FS_ID:             db      'FAT12   '    ; [36] File System ID

start:
        ; ROOT DIRECTORY
        mov     ax, 0x0201 ; read one sector
        mov     cx, 2      ; sector number 2
        mov     dx, 0x0100 ; head 1
        xor     bx, bx
        mov     es, bx
        mov     bx, 0x0500 ; to 0:500
        int     0x13

        ; DATA AREA with IO.SYS
        mov     ax, 0x0203 ; read 3 sectors
        mov     cx, 16     ; starting sector number 16
        mov     dx, 0x0100 ; head 1
        mov     bx, 0x0700 ; to 0:700
        int     0x13

        mov     si, cs        
        mov     ds, si
        mov     si, BIOS_Parameter_Block

        mov     ax, 0      ; first data sector (high)
        mov     bx, 33     ; first data sector (low)
        mov     ch, 0xf0   ; media byte
        mov     dl, 0      ; boot drive
        jmp     0x70:0

times 510-($-$$) db 0
        db      0x55, 0xAA

times 0x0200-($-$$) db 0 ; FAT1
        incbin  'fat1440.bin'

times 0x1400-($-$$) db 0 ; FAT2
        incbin  'fat1440.bin'

times 0x2600-($-$$) db 0 ; ROOT DIRECTORY
        db      'IO      SYS' ; file name
        times 15 db 0
        dw      0x0002        ; logical cluster
        dd      40327         ; file size

        db      'MSDOS   SYS'
        times 15 db 0
        dw      0x0051
        dd      37908

        db      'COMMAND COM'
        times 15 db 0
        dw      0x009C
        dd      52925

times 0x4200-($-$$) db 0 ; DATA AREA
        incbin  'BIOS/IO.SYS'
        
        align 512
        incbin  'DOS/MSDOS.SYS'

        align 512
        incbin  'DOS600/COMMAND.COM'

times 512*2880-($-$$) db 0
