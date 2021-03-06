

    ;;
    ;; badapple.s
    ;;
    ;; version 0.1
    ;;
    ;; by Sanky/Sanqui <gsanky@gmail.com>
    ;;
    ;; thanks to <marcus@idonex.se> for tetris.s which I used as a template
    ;; 
    ;; Need aslc86k v1.6+ to assemble this.
    ;;

    
    .include "sfr.i"


    ;; Game variables

nextbit = $10
offset  = $11
tmp     = $12
timer   = $13

bits    = $14
bitsend = $14+$8
frame = $20 ; ~$
            
        

    ;; Reset and interrupt vectors
    
    .org    0

    jmpf    start

    .org    $3

    jmp    nop_irq

    .org    $b

    jmp    nop_irq
    
    .org    $13

    jmp    nop_irq

    .org    $1b

    jmp    t1int
    
    .org    $23

    jmp    int_23

    .org    $2b

    jmp    nop_irq
    
    .org    $33

    jmp    nop_irq

    .org    $3b

    jmp    nop_irq

    .org    $43

    jmp    nop_irq

    .org    $4b

    clr1    p3int,0
    clr1    p3int,1
nop_irq:
    reti


    .org    $130
    
t1int:
    push    ie
    clr1    ie,7
    not1    ext,0
    jmpf    t1int
    pop    ie
    reti

int_23:
    push ie
    clr1 ie, 7
    xor timer
    pop ie
    reti
        
    .org    $1f0

goodbye:    
    not1    ext,0
    jmpf    goodbye


    ;; Header
    
    .org    $200

    .byte    "BAD APPLE!!     "
    .byte    "Bad Apple demo by Sanky/Sanqui  "

    ;; Icon header
    
    .org    $240

    .word    2,10        ; Two frames

    ;; Icon palette
    
    .org    $260

    .word    $0000, $fcfc, $f0a0, $f0f0, $fccf, $f00a, $f00f, $ffff
    .word    $ffff, $ffff, $ffff, $ffff, $ffff, $ffff, $ffff, $ffff

    ;; Icon
    
    .org    $280

    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    
    ;; Main program

    .org    $680

start:
    clr1 ie,7
    mov #$a1,ocr
    mov #$09,mcr
    mov #$80,vccr
    clr1 p3int,0
    clr1 p1,7
    mov #$ff,p3
    
    set1 ie,7
    set1 MCR, 4 ; 166Hz refresh rate

    clr1 ocr,5 ; fast mode - 600kHz
    call disableicons

    ;call t0mode2init
    call sndinit        ; these
    call snd1start      ; 

    call disableicons
    mov #<frame000, trl
    mov #>frame000, trh
.loop
    ;ld timer
    ;bne #$0, .loop
    ;inc timer
    call decompress
    call setmemscr
    ;call waitab
    jmp .loop

    call clrscr
    call disableicons


waitab:
    call getkeys
    and #$30
    bnz waitab

    ret
    
getkeys:
    bp p7,0,quit
    ld p3
    bn acc,6,quit
    bn acc,7,sleep
    ret

sndinit:
    clr1 P1, 7
    ret

snd1start:
    mov #$f6, T1LR
    mov #$fb, T1LC
    mov #$D0, T1CNT
    ret

sndstop:
    mov #0, T1CNT
    ret

t0mode2init:
    mov #$ff, T0PRR
    mov #<(65536-5464), T0HR
    mov #>(65536-5464), T0LR
    mov #$ff, T0L
    mov #$ff, T0H
    mov #$e4, T0CON
    ret

quit:
    jmp goodbye
    
sleep:
    bn p3,7,sleep    ; Wait for SLEEP to be depressed
    mov #0,vccr    ; Blank LCD
sleepmore:
    set1 pcon,0    ; Enter HALT mode
    bp p7,0,quit    ; Docked?
    bp p3,7,sleepmore    ; No SLEEP press yet
    mov #$80,vccr    ; Reenable LCD
waitsleepup:
    bn p3,7,waitsleepup
    br getkeys

disableicons:
    mov #$2, acc
    st xbnk
    xor acc
    mov #$81, 2
    st @R2
    inc 2
    st @R2
    inc 2
    st @R2
    inc 2
    st @R2
    inc 2
    ret

    ;; Function:    clrscr
    ;;
    ;; Clears the screen

clrscr:    
    push acc
    push xbnk
    push 2
    mov #0,xbnk
.cbank:    mov #$80,2
.cloop:    mov #0,@R2
    inc 2
    ld 2
    and #$f
    bne #$c,.cskip
    ld 2
    add #4
    st 2
.cskip:    ld 2
    bnz .cloop
    bp xbnk,0,.cexit
    mov #1,xbnk
    br .cbank
.cexit:    pop 2
    pop xbnk
    pop acc
    ret


    ;; Function:    setscr
    ;;
    ;; Copies a predefined full-screen image to the screen
    ;;
    ;; Inputs:
    ;;   trl = low byte of predefined screen ROM address
    ;;   trh = high byte of predefined screen ROM address
    
setscr:
    push acc
    push xbnk
    push c
    push 2
    mov #$80,2
    xor acc
    st xbnk
    st c
.sloop:
    ldc
    st @R2
    inc 2
    ld 2
    and #$f
    bne #$c,.sskip
    ld 2
    add #4
    st 2
    bnz .sskip
    inc xbnk
    mov #$80,2
.sskip:
    inc c
    ld c
    bne #$c0,.sloop
    pop 2
    pop c
    pop xbnk
    pop acc
    ret


decompress_quit:
    jmp goodbye

decompress_ret:
    jmp decompress_done

decompress:
    xor acc
    ldc
    be #$ff, decompress_quit
    st c ; num of bytes
    inc c
    xor acc
    st nextbit
    inc nextbit
    st b
    mov #$00, offset ; it gets +1 right away
    mov #frame, 0
    mov #bits, 1
.nextbyte
    inc offset
    dec c
    ld c
    be #0, decompress_ret
    ld offset
    ldc
    and #$f0
    ror
    ror
    ror
    ror
    be #$0, .literal
    be #$e, .13same
    be #$f, .31same
    st b
    ld nextbit
    br .add

.literal:
    ld offset
    ldc
    and #$0f
    xor #$0f
    rol
    rol
    rol
    rol
    rol
    call addbit
    rol
    call addbit
    rol
    call addbit
    rol
    call addbit
    and #$01
    xor #$01
    st nextbit
    ;inc offset
    br .nextbyte

.13same:
    ld nextbit
    mov #13, b
    br .addsame
    
.31same:
    ld nextbit
    mov #31, b
    br .addsame

.addsame
    call addbits
    br .nextnybble

.add:
    call addbits
    ld nextbit
    xor #$01
    st nextbit
    
.nextnybble:
    ld offset
    ldc
    and #$0f
    be #$0, .literal_
    be #$e, .13same_
    be #$f, .31same_

    st b
    ld nextbit
    br .add_

.literal_:
    inc offset
    ld offset
    ldc
    and #$f0
    xor #$f0
    rol
    call addbit
    rol
    call addbit
    rol
    call addbit
    rol
    call addbit
    and #$01
    xor #$01
    st nextbit
    dec c
    ld c
    be #0, .done
    br .nextnybble

.13same_:
    ld nextbit
    mov #13, b
    br .addsame_
    
.31same_:
    ld nextbit
    mov #31, b
    br .addsame_

.addsame_:
    call addbits
    brf .nextbyte

.add_:
    call addbits
    ld nextbit
    xor #$01
    st nextbit
    brf .nextbyte

.done:
    nop ; holy shit SERIOUSLY
decompress_done:
    ;inc offset
    ld offset
    add trl
    st trl
    bp PSW, CY, .carry
    ret
.carry
    inc trh
    ret

addbits:
    call addbit
    dbnz b, addbits
    ret

addbit:
    push acc
    and #$01
    st @R1
    inc 1
    ld 1
    be #bitsend, .newbyte
    pop acc
    ret
.newbyte
    xor acc
    dec 1
    or @R1
    dec 1
    ror
    or @R1
    dec 1
    ror
    or @R1
    dec 1
    ror
    or @R1
    dec 1
    ror
    or @R1
    dec 1
    ror
    or @R1
    dec 1
    ror
    or @R1
    dec 1
    ror
    or @R1
    ror
    st @R0
    inc 0
    pop acc
    ret

;addbit_old:
;    push acc
;    push b
;    and #$01
;    ror
;    st tmp
;    be #0, .incbit ; if the bit we're setting is 0 we don't need to set it, dummy
;    ld curbit
;    st b
;    ld tmp
;    be #0, .gotbit
;.loop:
;    ror
;    dbnz b, .loop
;.gotbit:
;    or curbyte
;    st curbyte
;.incbit:
;    inc curbit
;    ld curbit
;    be #8, .newbyte
;    pop b
;    pop acc
;    ret
;.newbyte
;    ld curbyte
;    st @R0
;    inc 0
;    xor acc
;    st curbit
;    st curbyte
;    pop b
;    pop acc
;    ret


setmemscr:
    mov #frame, 0
    push acc
    push xbnk
    push 2
    mov #$80,2
    xor acc
    st xbnk
.sloop:
    ld @R0
    st @R2
    inc 2
    ld 2
    and #$f
    bne #$c,.sskip
    ld 2
    add #4
    st 2
    bnz .sskip
    inc xbnk
    mov #$80,2
.sskip:
    inc 0
    ld 0
    bne #$e0,.sloop ; (frame+$c0)
    pop 2
    pop xbnk
    pop acc
    ret

frame000: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame001: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame002: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame003: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame004: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame005: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame006: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame007: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame008: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame009: .byte $3e,$fd,$4f,$e1,$3f,$e1,$3f,$e1,$3f,$e1,$3f,$e2,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$e3,$1f,$ff,$12,$fe,$13,$fe,$13,$fe,$13,$fe,$22,$fe,$22,$fe,$22,$fe,$22,$fe,$22,$fe,$22,$fe,$22,$fe,$22,$fe,$31,$fe,$31,$fe,$31,$fe,$31,$fe,$31,$fe,$31,$fe,$31,$fe,$31
frame010: .byte $37,$f4,$df,$4d,$f3,$e1,$f2,$e2,$f2,$e2,$ee,$5e,$4e,$e5,$e4,$ee,$4e,$5e,$e4,$e5,$f5,$cf,$5c,$f4,$df,$4d,$f5,$cf,$7a,$f8,$9f,$98,$fa,$7f,$b6,$fb,$6f,$c5,$fc,$5f,$c5,$fc,$5f,$c5,$fb,$6f,$b6,$fc,$5f,$e1,$3f,$e2,$2f,$e3,$1f,$e4
frame011: .byte $40,$16,$f4,$e1,$ee,$5e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$4e,$e5,$e4,$ee,$5e,$4e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$b1,$e5,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e5,$e4,$f2,$e2,$f3,$df,$5b,$f6,$af,$89,$f8,$8f,$97,$fa,$7f,$a6,$fb,$6f,$c4,$fe,$22,$ff,$ff,$ff,$51
frame012: .byte $48,$1e,$1e,$e1,$e9,$eb,$eb,$eb,$eb,$eb,$eb,$ea,$ec,$eb,$eb,$eb,$ea,$ec,$ea,$41,$e7,$ea,$41,$e7,$ea,$41,$e7,$ea,$ec,$eb,$21,$e7,$ec,$ec,$ea,$ee,$1e,$8e,$e1,$e8,$ee,$2e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$4e,$3f,$1e,$2f,$2e,$1f,$6b,$f6,$cf,$5b,$f6,$bf,$6b,$f6,$af,$7a,$ee,$31,$89,$ee,$41,$81
frame013: .byte $4c,$1e,$2e,$ce,$de,$9e,$de,$9e,$de,$9e,$de,$8e,$e1,$e7,$ee,$3e,$6e,$e4,$e5,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e4,$e5,$ee,$3e,$6e,$e2,$e8,$ee,$1e,$9e,$ce,$be,$be,$be,$be,$be,$9e,$de,$8e,$e1,$e8,$ee,$2e,$7e,$e4,$e6,$ee,$3e,$5e,$e3,$e6,$ee,$3e,$5e,$e4,$e5,$ee,$4e,$4e,$e5,$e4,$ee,$5e,$3f,$14
frame014: .byte $4d,$1e,$3e,$6e,$e2,$e7,$ee,$1e,$7e,$e2,$e6,$ee,$5e,$4e,$e5,$e3,$f2,$e2,$f2,$e2,$f2,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$ee,$5e,$4e,$e4,$e5,$ee,$3e,$6e,$e2,$e8,$ee,$1e,$9e,$de,$9e,$de,$ae,$ae,$ce,$ae,$ce,$ae,$de,$9e,$de,$9e,$de,$9e,$de,$8e,$51,$8e,$8e,$51,$8e,$7e,$61,$8e,$7e,$61,$8e,$6e,$71,$8e,$6e,$71,$9e,$4e,$82,$89
frame015: .byte $48,$1c,$e8,$ee,$2e,$7e,$e4,$e4,$ee,$4e,$4e,$e4,$e4,$ee,$5e,$4f,$2e,$2f,$2e,$1f,$2e,$2f,$2e,$2f,$2e,$2f,$3e,$1f,$3e,$1f,$2e,$1f,$2e,$3f,$1e,$4e,$e5,$e4,$ee,$4e,$6e,$e3,$e7,$ed,$e9,$ed,$ea,$ec,$ea,$ec,$ea,$eb,$ec,$ea,$ec,$ea,$ec,$e9,$ee,$1e,$7e,$e2,$e7,$ee,$2e,$6e,$e3,$e6,$ee,$4e,$4e,$e5,$b1
frame016: .byte $43,$1a,$e7,$ee,$3e,$5e,$e4,$e5,$ee,$5e,$3e,$e5,$e3,$f1,$e2,$f4,$df,$4d,$f4,$df,$4d,$f5,$cf,$5c,$f4,$df,$3e,$1f,$2e,$2f,$2e,$3f,$1e,$3f,$1e,$5e,$e2,$e7,$ee,$3e,$5e,$e4,$e6,$ee,$3e,$6e,$e2,$e8,$ee,$1e,$8e,$e1,$e8,$ed,$ea,$ec,$ea,$eb,$ec,$ea,$ec,$e9,$ed,$e9,$ed,$e9,$ed,$e2
frame017: .byte $49,$1c,$e5,$ee,$5e,$4e,$e5,$e4,$f1,$e2,$f3,$cf,$5d,$f4,$df,$4c,$f4,$cf,$5b,$f6,$bf,$6c,$f5,$df,$4e,$1f,$3e,$2f,$2e,$2f,$1e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$54,$1c,$ee,$54,$1c,$ee,$45,$1d,$ee,$35,$1d,$ee,$35,$1e,$1e,$e1,$61,$e1,$ee,$16,$1e,$2e,$ce,$ae,$ce,$9e,$de,$ae,$ce,$ae,$c5,$1e,$3e,$21
frame018: .byte $47,$1e,$b6,$f2,$e2,$f2,$e3,$f1,$e3,$f2,$e1,$f3,$df,$5d,$f4,$df,$5b,$f6,$bf,$6b,$f6,$bf,$6a,$f6,$cf,$5d,$f3,$e1,$f2,$e2,$f2,$e4,$ee,$4e,$5e,$e4,$21,$e2,$ee,$30,$1e,$2e,$e3,$1,$e3,$ee,$20,$3e,$3e,$e2,$21,$e5,$ee,$1e,$8e,$e1,$e9,$ed,$e9,$ed,$ea,$ee,$1e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$c1
frame019: .byte $42,$1e,$54,$19,$f1,$e3,$f1,$e3,$f2,$e2,$f3,$cf,$5d,$f5,$cf,$6a,$f7,$af,$7a,$f6,$bf,$7a,$f7,$bf,$5c,$f5,$cf,$5c,$f4,$e2,$f2,$e2,$f1,$e3,$f1,$e3,$ee,$5e,$4e,$e5,$e5,$ee,$4e,$5e,$e3,$e7,$ee,$2e,$7e,$e2,$e8,$ee,$2e,$7e,$e1,$e8,$ee,$2e,$7e,$e3,$e6,$ee,$4e,$5e,$e4,$e5,$b1
frame020: .byte $40,$1f,$f5,$43,$6f,$3e,$1f,$3e,$1f,$3e,$1f,$4c,$f6,$af,$7b,$f6,$af,$89,$f8,$9f,$89,$f8,$9f,$7b,$f6,$bf,$5c,$f4,$e1,$f3,$e1,$f3,$e1,$f2,$e2,$f2,$e2,$f1,$e4,$ee,$5e,$5e,$e3,$e6,$ee,$3e,$7e,$e2,$e7,$ee,$2e,$7e,$e3,$e6,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$c1
frame021: .byte $47,$1e,$53,$fd,$63,$3f,$5e,$1f,$3e,$1f,$4c,$f5,$cf,$5b,$f6,$bf,$79,$f8,$9f,$98,$f8,$af,$6b,$f6,$bf,$6c,$f4,$df,$3e,$2f,$2e,$2f,$2a,$14,$f2,$a1,$4f,$1b,$14,$f1,$b1,$4e,$e5,$c1,$5e,$e4,$c1,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$6e,$e3,$e1,$8,$ee,$5e,$4e,$e5,$e1,$8,$ee,$3e,$31,$2e,$11
frame022: .byte $3e,$1f,$f3,$4f,$cc,$f5,$df,$4d,$f5,$cf,$5b,$f6,$af,$89,$f7,$9f,$89,$f9,$8f,$89,$f8,$af,$6b,$f6,$cf,$4e,$1f,$3e,$1f,$3e,$1f,$2e,$3f,$1e,$3e,$e5,$e4,$ee,$5e,$4e,$e4,$e6,$ee,$3e,$5e,$e4,$e5,$ee,$4e,$6e,$e3,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$4e,$e5,$e4,$e5
frame023: .byte $3b,$1f,$f1,$4f,$cd,$f4,$e1,$f4,$cf,$5c,$f5,$bf,$6a,$f8,$9f,$89,$f8,$9f,$98,$f8,$9f,$7a,$f7,$bf,$6c,$f4,$df,$4d,$f4,$df,$4e,$1f,$2e,$2f,$2e,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3e,$61
frame024: .byte $41,$1f,$f3,$25,$4f,$4d,$f4,$df,$5c,$f5,$cf,$6a,$f7,$af,$79,$f8,$8f,$89,$f9,$9f,$8a,$f6,$bf,$6c,$f5,$df,$3e,$1f,$3d,$f4,$41,$9f,$34,$19,$f3,$41,$af,$15,$1a,$f1,$e4,$ee,$4e,$5e,$e4,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$3f,$10,$1d,$ee,$50,$1d,$ee,$52,$1e,$1f,$3e,$2e,$31
frame025: .byte $3e,$1f,$fd,$1f,$d5,$f4,$df,$4d,$f5,$cf,$6a,$f7,$bf,$79,$f8,$9f,$89,$f8,$9f,$89,$f7,$af,$6c,$f5,$cf,$4e,$1f,$3e,$1f,$2e,$3f,$1e,$3f,$1e,$3f,$1e,$4e,$e5,$e4,$ee,$5e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$5e,$3e,$e5,$e4,$ee,$5e,$4f,$11,$1e,$1f,$2e,$2e,$21
frame026: .byte $3d,$1e,$e2,$2f,$c6,$f4,$df,$4d,$f4,$df,$5a,$f8,$af,$79,$f8,$9f,$89,$f8,$9f,$89,$f8,$af,$7a,$f6,$bf,$5e,$1f,$4d,$f3,$e1,$f3,$e1,$f2,$e2,$f1,$e4,$ee,$5e,$4e,$e5,$e5,$ee,$3e,$6e,$e4,$e5,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3d
frame027: .byte $3f,$1f,$ff,$e9,$41,$7f,$4d,$f4,$df,$5c,$f5,$bf,$89,$f7,$af,$89,$f8,$9f,$89,$f8,$8f,$8a,$f7,$af,$5d,$f4,$e1,$f3,$df,$4d,$f3,$e2,$f1,$e3,$ee,$5e,$5e,$e4,$e5,$ee,$4e,$6e,$e3,$e6,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e5,$e4,$f1,$e3,$ee,$5e,$10,$8e,$e4,$e1,$21,$d1
frame028: .byte $3f,$1f,$f4,$4f,$dc,$f5,$cf,$5c,$f5,$cf,$5b,$f6,$af,$89,$f8,$9f,$89,$f8,$9f,$7a,$f7,$bf,$6b,$f5,$df,$3e,$1f,$3e,$1f,$3e,$2f,$1e,$3f,$1e,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$5e,$e5,$e4,$ee,$5e,$11,$2e,$e4,$e3,$e4
frame029: .byte $3f,$1f,$f3,$4f,$d7,$14,$f5,$df,$4d,$f4,$df,$5b,$f5,$bf,$7a,$f7,$9f,$89,$f8,$9f,$89,$f7,$af,$7b,$f6,$cf,$4d,$f4,$e1,$f3,$e1,$f2,$e3,$f1,$e3,$ee,$5e,$4e,$e5,$e4,$ee,$4e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$4e,$41
frame030: .byte $4a,$1e,$44,$fc,$84,$6e,$e4,$e6,$ee,$3e,$6e,$e4,$e4,$ee,$5e,$4f,$1e,$3f,$1e,$2f,$2e,$1f,$4d,$f4,$df,$4c,$f5,$cf,$5c,$f5,$cf,$5c,$f4,$df,$4e,$1f,$3e,$1f,$2e,$4e,$e4,$e6,$ee,$3e,$6e,$e3,$e7,$ee,$3e,$6e,$e3,$d2,$5e,$e1,$e1,$25,$ee,$1e,$12,$6e,$ce,$22,$6e,$ce,$31,$7e,$be,$31,$7e,$ae,$41,$8e,$9e,$41,$87
frame031: .byte $50,$1e,$96,$47,$ee,$3e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$3e,$6e,$e2,$e7,$ee,$2e,$7e,$e2,$e6,$ee,$4e,$5e,$e4,$e6,$ee,$3e,$6e,$e3,$e3,$ee,$5e,$4e,$e5,$e4,$ee,$52,$1d,$f1,$e3,$f1,$e3,$f2,$e2,$f2,$e3,$f2,$e2,$f1,$e4,$ee,$5e,$5e,$e4,$e7,$ee,$2e,$8e,$e1,$e8,$ee,$1e,$9e,$de,$ae,$cd,$1a,$eb,$d1,$ae,$ae,$10,$81,$7e,$8e,$e1,$11
frame032: .byte $4c,$1f,$23,$fd,$5f,$a8,$f7,$af,$5d,$f3,$e2,$f1,$e3,$f1,$e4,$ee,$4e,$5e,$e5,$e5,$ee,$4e,$5e,$e5,$e4,$ee,$5e,$4e,$e5,$e5,$ee,$5e,$4e,$e5,$e4,$f1,$e3,$f2,$e2,$f2,$e2,$f1,$e3,$f1,$e3,$ee,$5e,$4e,$e5,$e2,$11,$ee,$4e,$2e,$84,$8e,$2e,$75,$8e,$1e,$77,$7e,$10,$ce,$37,$1e,$ae,$4e,$e4,$e5,$ee,$5e,$5e,$e4,$e8,$ee,$24
frame033: .byte $40,$1f,$fe,$33,$fd,$4f,$d5,$fc,$8f,$6c,$f4,$e1,$f2,$e2,$f2,$e2,$f2,$e3,$f1,$e3,$f1,$e4,$f1,$e3,$f1,$e3,$f1,$e3,$f2,$e2,$f3,$e1,$f4,$e1,$f3,$e1,$f3,$df,$4c,$e8,$4a,$de,$76,$7d,$e9,$67,$de,$97,$6d,$e9,$ed,$ea,$ec,$21,$e9,$ed,$ea,$ea,$ec,$ea,$ec,$eb,$eb,$eb,$71
frame034: .byte $3e,$1f,$ff,$ee,$44,$fd,$5f,$c9,$f7,$bf,$5d,$f3,$e1,$f2,$e2,$f2,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$f3,$e1,$f3,$e2,$f3,$e1,$f4,$df,$4d,$f4,$df,$4d,$e8,$4a,$a1,$1e,$86,$9a,$ea,$67,$ce,$a8,$5c,$ea,$ec,$eb,$ec,$ed,$e9,$ec,$ec,$ea,$eb,$eb,$ea,$eb,$ec,$ea,$ec,$81
frame035: .byte $41,$1f,$ff,$ee,$42,$fe,$15,$21,$f9,$9f,$8a,$f5,$df,$3e,$1f,$3e,$2f,$1e,$3f,$1e,$3f,$1e,$4f,$1e,$3f,$2e,$2f,$3e,$1f,$3e,$1f,$4d,$f4,$df,$4d,$f5,$ce,$94,$a9,$12,$e8,$69,$ae,$a6,$7c,$ea,$76,$ce,$ab,$1d,$eb,$eb,$ee,$1e,$8e,$e1,$eb,$eb,$ea,$eb,$ea,$ec,$ea,$ec,$eb,$81
frame036: .byte $43,$1f,$fe,$11,$fe,$14,$fd,$9f,$8a,$f6,$cf,$4d,$f3,$e2,$f1,$e3,$f1,$e3,$f1,$e4,$ee,$5e,$4f,$1e,$3f,$2e,$2f,$3e,$1f,$3e,$1f,$4e,$1f,$3e,$1f,$3e,$1e,$a2,$ad,$e8,$59,$ce,$86,$9a,$ea,$76,$ce,$a8,$5b,$ec,$92,$ce,$de,$ae,$e1,$e8,$ee,$1e,$82,$1e,$be,$be,$be,$9e,$de,$9e,$de,$a8
frame037: .byte $47,$1e,$e2,$1f,$e1,$5f,$c6,$fb,$af,$7b,$f5,$df,$2e,$2f,$2e,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e5,$ee,$4e,$5e,$e5,$e4,$f1,$e3,$f1,$e3,$f2,$e2,$f3,$e1,$f3,$e1,$f4,$e1,$e8,$58,$e1,$e7,$77,$e1,$e7,$77,$be,$a7,$5d,$ea,$83,$e1,$eb,$91,$de,$e1,$e8,$ee,$2e,$8e,$de,$9e,$de,$ce,$ae,$be,$be,$ae,$ce,$a8
frame038: .byte $4a,$1e,$e1,$5f,$c6,$fb,$af,$7b,$f4,$e1,$f2,$e2,$f1,$e3,$ee,$5e,$5e,$e4,$e5,$ee,$4e,$6e,$e3,$e6,$ee,$3e,$6e,$e4,$e5,$f1,$e3,$ee,$5e,$5e,$e5,$e4,$f1,$e3,$f1,$e3,$e9,$56,$e2,$e7,$76,$e2,$e7,$76,$e2,$e7,$76,$e2,$e7,$85,$ce,$b8,$1e,$2e,$ce,$ae,$de,$8e,$e1,$e9,$ed,$e9,$ec,$ea,$ec,$ed,$e9,$ec,$ea,$eb,$71
frame039: .byte $4f,$1e,$e1,$7f,$b9,$f8,$bf,$4e,$1f,$1e,$3e,$e5,$e4,$ee,$5e,$5e,$e3,$e6,$ee,$3e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$3e,$7e,$e3,$e6,$ee,$3e,$6e,$e4,$e5,$ee,$5e,$4e,$95,$5e,$3e,$86,$5e,$3e,$78,$4e,$3e,$78,$4e,$3e,$78,$4e,$3e,$88,$3e,$1e,$a9,$2d,$ed,$e9,$ed,$e8,$ee,$1e,$8e,$de,$ae,$ce,$ae,$ce,$a0,$ce,$8e,$e1,$e8,$ec,$51
frame040: .byte $4e,$1e,$e2,$8f,$aa,$f5,$df,$2e,$3e,$e5,$e4,$ee,$4e,$5e,$e3,$e7,$ee,$2e,$7e,$e2,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$2e,$7e,$e3,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$3e,$6e,$a4,$3e,$5e,$87,$3e,$4e,$78,$3e,$4e,$78,$3e,$4e,$78,$3e,$4e,$88,$2e,$4e,$89,$2e,$2e,$ae,$ae,$de,$9e,$de,$8e,$de,$9e,$de,$9e,$de,$ae,$ce,$ae,$ce,$a0,$8e,$8e,$d3
frame041: .byte $50,$1e,$e3,$7f,$aa,$f5,$df,$2e,$3e,$e5,$e4,$ee,$4e,$6e,$e2,$e7,$ee,$2e,$7e,$e1,$e9,$ee,$1e,$8e,$e1,$e8,$ee,$2e,$8e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$eb,$14,$e6,$e9,$62,$e5,$e8,$81,$e5,$e8,$82,$e4,$e8,$82,$e4,$e8,$82,$e4,$e8,$91,$e4,$e9,$81,$e5,$e9,$ea,$ec,$e9,$ed,$ea,$ec,$e8,$ee,$1e,$8e,$de,$ae,$ce,$ae,$ce,$a0,$ce,$87,$1e,$62
frame042: .byte $50,$1e,$e3,$7f,$aa,$f5,$df,$2e,$3e,$e5,$e4,$ee,$4e,$5e,$e3,$e7,$ee,$2e,$7e,$e1,$e9,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e3,$e7,$ee,$2e,$7e,$e2,$e7,$eb,$14,$e6,$e9,$61,$e6,$e8,$81,$e5,$e8,$82,$e4,$e8,$82,$e4,$e8,$82,$e4,$e8,$91,$e4,$e9,$81,$e4,$ea,$ea,$ec,$e9,$ed,$ea,$ec,$e8,$ed,$e9,$ed,$ea,$ec,$ea,$ec,$ea,$8,$e8,$61,$e6,$31
frame043: .byte $4f,$1e,$e2,$7f,$b9,$f5,$e1,$f2,$e2,$ee,$5e,$5e,$e4,$e5,$ee,$3e,$7e,$e2,$e7,$ee,$1e,$8e,$e1,$e9,$ed,$e9,$ee,$1e,$8e,$e2,$e7,$ee,$3e,$6e,$e2,$e8,$ee,$2e,$7e,$96,$1e,$6e,$87,$2e,$5e,$78,$2e,$5e,$78,$3e,$4e,$79,$2e,$4e,$88,$2e,$4e,$98,$1e,$4e,$ae,$9e,$de,$9e,$de,$9e,$ce,$9e,$de,$9e,$de,$ae,$ce,$ae,$ce,$a0,$ce,$86,$1e,$72
frame044: .byte $4f,$1e,$e1,$7f,$ab,$f5,$df,$2e,$2f,$1e,$4e,$e4,$e5,$ee,$3e,$7e,$e2,$e7,$ee,$2e,$8e,$de,$9e,$de,$9e,$e1,$e9,$ee,$1e,$8e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ea,$42,$e6,$e9,$62,$e5,$e8,$73,$e4,$e7,$92,$e5,$e6,$92,$e5,$e7,$83,$e4,$e7,$92,$e1,$12,$e8,$eb,$ec,$ea,$ec,$ea,$ec,$e9,$ed,$e9,$ec,$eb,$eb,$eb,$eb,$eb,$23,$e6,$71,$e7,$21
frame045: .byte $4e,$1e,$b7,$21,$f7,$cf,$6c,$f3,$e2,$f1,$e3,$ee,$5e,$5e,$e3,$e6,$ee,$3e,$7e,$e1,$e8,$ee,$1e,$9e,$de,$9e,$de,$9e,$e1,$e8,$ee,$2e,$7e,$e4,$e6,$ee,$2e,$7e,$e3,$e6,$ea,$43,$e5,$e8,$73,$e4,$e8,$73,$e4,$e7,$92,$e4,$e7,$93,$e4,$e7,$83,$e3,$e8,$92,$de,$ce,$be,$de,$9e,$ce,$9e,$de,$9e,$de,$ae,$ce,$ae,$be,$b0,$ce,$7e,$e2,$31
frame046: .byte $52,$1e,$7e,$2f,$3e,$2f,$2e,$3f,$2e,$3f,$1e,$3e,$e5,$e5,$ee,$3e,$6e,$e3,$e7,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$9e,$de,$9e,$de,$9e,$e1,$e8,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e5,$e4,$ee,$54,$1c,$ee,$54,$2b,$e9,$45,$41,$ce,$77,$40,$1a,$12,$e6,$85,$e1,$e8,$85,$e1,$e8,$94,$e2,$e8,$a2,$d1,$2e,$7b,$1d,$eb,$eb,$ed,$ea,$ed,$e9,$ed,$e9,$ec,$ea,$81
frame047: .byte $50,$1e,$18,$1a,$ee,$3e,$7e,$e2,$e7,$ee,$3e,$7e,$e3,$e7,$ee,$4e,$6e,$e2,$e7,$ee,$2e,$8e,$e1,$e8,$ee,$1e,$9e,$de,$9e,$de,$9e,$de,$ae,$ce,$ae,$de,$9e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e5,$e4,$ee,$50,$1e,$1e,$e4,$1,$cf,$10,$1d,$f1,$e3,$f1,$e4,$ee,$5e,$4f,$1e,$4e,$e5,$e4,$e3,$3c,$e4,$e1,$6b,$e5,$c8,$ae,$5c,$87,$e8,$41
frame048: .byte $50,$1f,$ff,$ff,$c2,$56,$f1,$e4,$ee,$4e,$6e,$e3,$e7,$ee,$3e,$6e,$e4,$e5,$ee,$4e,$6e,$e3,$e6,$ee,$2e,$8e,$e1,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$9e,$de,$9e,$e1,$e8,$ee,$2e,$7e,$e4,$e5,$ee,$4e,$5e,$e3,$e6,$ee,$3e,$6e,$e2,$63,$ce,$e1,$1,$14,$ce,$e1,$1,$15,$ce,$d0,$11,$4d,$ed,$27,$e1,$ec,$26,$e2,$ec,$17,$e3,$ee,$5e,$4e,$e5,$e5
frame049: .byte $3f,$1f,$93,$fd,$6f,$b7,$f9,$9f,$5c,$f3,$e1,$f2,$e2,$f1,$e3,$ee,$5e,$4e,$e5,$e4,$ee,$4e,$5e,$e4,$e5,$ee,$5e,$4e,$e5,$e4,$f2,$e2,$f2,$e2,$f1,$e3,$f2,$e2,$f3,$e1,$f3,$e1,$f2,$e2,$f3,$e1,$f2,$e2,$f2,$e2,$f2,$11,$df,$41,$1b,$f6,$bf,$7a,$f7,$af,$6b,$f6,$bf,$6b
frame050: .byte $54,$1f,$ff,$b5,$f1,$28,$7e,$e3,$48,$7e,$e2,$57,$9e,$d6,$79,$ed,$67,$9e,$c7,$7e,$1e,$86,$7e,$2e,$67,$7e,$3e,$48,$7e,$5e,$28,$7e,$6e,$18,$8e,$6d,$8e,$1e,$34,$24,$8e,$1e,$96,$6d,$ed,$36,$cf,$5c,$f5,$bf,$6a,$e8,$8,$1c,$ae,$70,$c2,$c9,$e8,$5d,$9e,$85,$d8,$ea,$4d,$9e,$93,$e1,$9e,$93,$e1,$ae,$82,$e2,$ae,$82,$e2,$be,$72,$e2,$e5,$c4,$e1,$f3,$e1
frame051: .byte $1a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3
frame052: .byte $21,$1f,$ff,$e9,$6f,$a8,$f8,$af,$7a,$f7,$af,$7a,$f8,$9f,$88,$fb,$5f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$71
frame053: .byte $22,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$92,$fd,$6f,$89,$f8,$af,$7b,$f5,$cf,$5c,$f6,$bf,$6a,$f8,$8f,$b5,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f7
frame054: .byte $24,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e2,$7f,$99,$f7,$bf,$6b,$f6,$bf,$5d,$f4,$df,$5c,$f5,$bf,$79,$fc,$2f,$e2,$1f,$ff,$ff,$fe,$e1
frame055: .byte $23,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e4,$3f,$c7,$f9,$9f,$7c,$f4,$cf,$5d,$f4,$df,$4d,$f5,$cf,$5b,$f7,$9f,$96,$ff,$ff,$ff,$ec
frame056: .byte $24,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ea,$4f,$c7,$f9,$af,$7b,$f3,$e1,$f4,$e1,$f4,$cf,$5c,$f5,$cf,$5c,$f6,$af,$96,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e4
frame057: .byte $24,$1f,$ff,$ff,$ff,$ff,$ff,$e5,$4f,$99,$f8,$af,$6c,$f5,$cf,$5d,$f4,$df,$4d,$f4,$df,$4c,$f6,$af,$86,$fe,$32,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f7
frame058: .byte $28,$1f,$ff,$ff,$ff,$ff,$ff,$e5,$1f,$e1,$61,$2f,$79,$f7,$bf,$6c,$f4,$e1,$f3,$e1,$f3,$e1,$f3,$e1,$f3,$df,$5b,$f7,$9f,$97,$fd,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ea
frame059: .byte $27,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$84,$fc,$8f,$8a,$f6,$df,$3e,$1f,$3e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1f,$4d,$f5,$bf,$87,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11
frame060: .byte $27,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ed,$5f,$9a,$f6,$bf,$5d,$f4,$e1,$f3,$e1,$f3,$e1,$f3,$e1,$f3,$e1,$f3,$df,$5c,$f6,$af,$86,$fe,$31,$ff,$ff,$ff,$ff,$ff,$fd
frame061: .byte $27,$1f,$3d,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$84,$fb,$9f,$7b,$f6,$cf,$4e,$1f,$3e,$1f,$3e,$1f,$2e,$2f,$3e,$1f,$3d,$f5,$cf,$69,$f9,$6f,$ff,$ff,$ff,$ff,$ff,$fe,$e5
frame062: .byte $3b,$e2,$25,$ed,$e9,$ed,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$eb,$46,$e1,$eb,$49,$be,$a5,$aa,$ea,$4b,$ae,$a4,$c7,$ec,$5c,$5e,$d7,$b3,$ec,$ab,$2e,$bb,$f5,$cf,$5d,$f4,$df,$4e,$1f,$3d,$f5,$cf,$6b,$f7,$af,$95,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$51
frame063: .byte $3b,$e2,$25,$ed,$e9,$ed,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$eb,$46,$e1,$eb,$49,$be,$a5,$aa,$ea,$4b,$ae,$a4,$c7,$ec,$5c,$5e,$d7,$b3,$ec,$ab,$2e,$bb,$f5,$cf,$5d,$f4,$df,$4e,$1f,$3d,$f5,$cf,$6b,$f7,$af,$95,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$51
frame064: .byte $30,$1e,$e4,$e4,$ee,$54,$67,$42,$ec,$55,$74,$4f,$22,$94,$fe,$12,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f9,$2e,$98,$e2,$a8,$25,$da,$d3,$54,$e5,$5e,$84,$fe,$14,$fe,$12,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$b1
frame065: .byte $3e,$ff,$f3,$1f,$e3,$1f,$ff,$44,$fb,$6f,$b6,$fb,$7f,$a7,$fa,$7f,$a8,$f9,$9f,$84,$33,$f7,$62,$3f,$6b,$42,$8b,$11,$ae,$51,$e7,$9f,$98,$fa,$7f,$b6,$fd,$4f,$e1,$3f,$e1,$3f,$e2,$2f,$d4,$d1,$ee,$53,$c4,$ee,$42,$c8,$e9,$6b,$e3,$db,$3e,$e1,$6d,$3e,$e2,$5f,$ec
frame066: .byte $51,$1e,$e1,$e9,$ed,$eb,$ed,$21,$e8,$ec,$ea,$ed,$e8,$e8,$33,$e8,$e8,$61,$e6,$e6,$ee,$3e,$6e,$e3,$e2,$14,$7,$ea,$e3,$36,$ea,$e4,$36,$e9,$e4,$28,$e9,$e4,$19,$e4,$8,$ee,$1e,$40,$ee,$e1,$e4,$ee,$5e,$4a,$1e,$8e,$48,$3e,$ae,$26,$4e,$52,$9a,$45,$e5,$76,$83,$5e,$96,$92,$44,$f7,$14,$4f,$d2,$ff,$ff,$fe,$e4,$1f,$e3,$3f,$e1,$4f,$d4,$fd
frame067: .byte $5a,$e4,$ee,$5e,$6e,$e3,$e8,$ee,$1e,$ae,$ce,$ae,$ce,$be,$be,$ce,$ae,$e2,$e7,$ee,$3e,$6e,$52,$9e,$6e,$35,$8e,$6e,$27,$6e,$30,$1e,$27,$6e,$4e,$57,$6e,$4e,$66,$5e,$3e,$a5,$3e,$2e,$e2,$42,$e2,$24,$e9,$e7,$24,$ea,$e6,$24,$eb,$eb,$ec,$ea,$ed,$e9,$ed,$43,$e2,$ec,$45,$e1,$ec,$36,$c1,$1e,$b3,$7e,$1e,$a4,$6e,$2e,$a3,$6e,$3e,$93,$6e,$4e,$83,$6e,$5e,$74,$5e,$6e,$65,$3e,$81
frame068: .byte $54,$e4,$ee,$5e,$4e,$e5,$e6,$ee,$3e,$7e,$e2,$e9,$ed,$eb,$eb,$ed,$e9,$ee,$2e,$7e,$e2,$e7,$ee,$3e,$6e,$e4,$e5,$ee,$5e,$4e,$93,$9e,$1e,$85,$9d,$e7,$78,$de,$68,$7e,$1e,$68,$7e,$1e,$77,$7e,$1e,$87,$5e,$2e,$c4,$3e,$3e,$d4,$1e,$4e,$e1,$e8,$ee,$1e,$8e,$e2,$e7,$ee,$3e,$6e,$e3,$e6,$ee,$4e,$5e,$e4,$e5,$ee,$55,$2a,$ee,$44,$4a,$ee,$34,$69,$ee,$34,$78
frame069: .byte $52,$df,$4e,$1f,$2e,$4e,$e4,$e5,$ee,$5e,$6e,$e4,$e6,$ee,$3e,$8e,$e1,$e9,$ed,$eb,$eb,$ec,$ea,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e2,$e7,$e8,$53,$e6,$e7,$73,$e5,$e6,$86,$e2,$e6,$87,$e1,$e6,$87,$e1,$e7,$76,$e2,$e8,$75,$e2,$ec,$35,$e2,$ed,$33,$e3,$ed,$32,$e4,$ed,$e9,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e2,$e7,$ee,$2e,$71
frame070: .byte $4f,$db,$8e,$3e,$1a,$6e,$5e,$1f,$3e,$3f,$1e,$4e,$e5,$e4,$ee,$4e,$7e,$e1,$e9,$ed,$ea,$ed,$ea,$ed,$eb,$eb,$eb,$eb,$ec,$ea,$ee,$1e,$8e,$de,$9e,$e1,$e8,$eb,$eb,$ea,$ec,$e9,$91,$e3,$e8,$92,$e3,$e8,$92,$e3,$e9,$74,$e2,$ea,$72,$e3,$ed,$42,$e3,$ee,$20,$ee,$3e,$e2,$e7,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6
frame071: .byte $52,$d4,$dc,$e5,$79,$e3,$e3,$96,$e5,$e3,$85,$e7,$e2,$75,$ea,$e1,$55,$e3,$53,$e2,$41,$e7,$71,$95,$1e,$ce,$4f,$1e,$4f,$1e,$5f,$5e,$1f,$3e,$4e,$e5,$e7,$ee,$2e,$8e,$e1,$ec,$ea,$ec,$ea,$ec,$ea,$eb,$eb,$ea,$ec,$e9,$81,$e4,$e9,$72,$e4,$e9,$81,$e4,$eb,$eb,$ee,$1e,$8e,$e3,$e2,$12,$ee,$4e,$2f,$2e,$3f,$1e,$4e,$e5,$e4,$ee,$5e,$5e,$e4,$e5,$11
frame072: .byte $4e,$ff,$ff,$fe,$48,$f7,$ce,$e1,$53,$e2,$eb,$54,$e4,$ea,$33,$c5,$4e,$4e,$9e,$de,$ae,$de,$9e,$e2,$ed,$ed,$ec,$ec,$ec,$ec,$e9,$ee,$1e,$7e,$e1,$e8,$ec,$51,$e7,$e8,$62,$e6,$e8,$62,$e6,$e9,$52,$e6,$eb,$e2,$18,$ed,$cf,$5d,$f4,$d4,$3e,$e2,$e1,$24,$ee,$2e,$12,$6e,$de,$21,$6e,$d4,$1e,$4e,$e1,$32,$e3,$ed,$34,$e2,$ed,$34,$e2
frame073: .byte $45,$ff,$ff,$ff,$ff,$e6,$4f,$53,$38,$f4,$c,$be,$e4,$e1,$32,$ee,$4d,$f6,$cf,$7e,$1f,$5d,$f4,$df,$22,$3b,$f1,$32,$de,$e4,$32,$df,$1d,$f5,$8f,$99,$24,$f2,$91,$5f,$22,$1c,$f3,$12,$bf,$22,$3c,$ee,$42,$4a,$17,$eb,$14,$b5,$5e,$80,$8e,$31,$e3,$a0,$cf,$f8,$19,$3f,$47,$4d,$eb,$93,$ce,$b1
frame074: .byte $3b,$ff,$ff,$ff,$ff,$fe,$e4,$1f,$e3,$c,$5f,$79,$f9,$8f,$b8,$fa,$8f,$81,$27,$f6,$c,$8f,$76,$11,$f9,$60,$3f,$76,$7,$f8,$11,$7f,$70,$89,$f7,$70,$74,$48,$5c,$12,$e9,$9f,$8e,$14,$6e,$be,$be,$be,$e4,$35,$ae,$e4,$11,$1b,$4f,$ff,$ff,$ff,$ff,$91
frame075: .byte $31,$ff,$ff,$ff,$ff,$ff,$fe,$30,$c3,$fa,$6f,$d5,$fd,$6f,$a1,$17,$f8,$11,$5f,$b4,$fd,$51,$1f,$d5,$fc,$40,$3e,$a3,$a1,$1e,$4e,$6e,$e4,$e9,$16,$e7,$f1,$34,$9f,$31,$92,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$81
frame076: .byte $2b,$ff,$ff,$ff,$ff,$ff,$fe,$41,$3,$fc,$5f,$e1,$3f,$e2,$4f,$d5,$fb,$3f,$e3,$3f,$e1,$5e,$e5,$45,$11,$de,$e3,$14,$e2,$f5,$24,$6f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$41
frame077: .byte $28,$ff,$ff,$ff,$ff,$ff,$fe,$71,$fe,$14,$fe,$13,$fe,$24,$fc,$3f,$e1,$5f,$e1,$3f,$41,$61,$1b,$ee,$51,$4d,$f7,$15,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e6
frame078: .byte $26,$ff,$ff,$ff,$ff,$ff,$fe,$40,$9f,$e1,$3f,$e2,$3f,$e2,$3f,$d5,$fd,$3f,$e2,$3f,$43,$4d,$f5,$df,$71,$62,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$61
frame079: .byte $26,$ff,$ff,$ff,$ff,$ff,$fe,$40,$bf,$e1,$3f,$e1,$5f,$d4,$fd,$4f,$e1,$3f,$e1,$53,$2e,$e3,$43,$df,$70,$c6,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f5
frame080: .byte $23,$ff,$ff,$ff,$ff,$ff,$fe,$52,$fe,$15,$fd,$5f,$d2,$fe,$20,$df,$e1,$3f,$db,$f5,$df,$71,$54,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f5
frame081: .byte $25,$ff,$ff,$ff,$ff,$ff,$fe,$34,$fe,$14,$fe,$24,$fc,$3f,$e1,$4f,$e2,$3f,$db,$ee,$51,$4d,$f7,$14,$5f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$51
frame082: .byte $27,$ff,$ff,$ff,$ff,$ff,$fe,$52,$fd,$4f,$e2,$4f,$e1,$3f,$d3,$fe,$24,$fd,$41,$1f,$24,$3d,$f5,$42,$7f,$71,$61,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$81
frame083: .byte $27,$ff,$ff,$ff,$ff,$ff,$ff,$f2,$b,$fe,$13,$fe,$24,$fe,$14,$fc,$3f,$e2,$3f,$e1,$53,$2e,$e3,$43,$df,$81,$27,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$61
frame084: .byte $26,$ff,$ff,$ff,$ff,$ff,$ff,$f5,$1f,$d4,$fe,$23,$fe,$23,$fd,$e,$1f,$c4,$fe,$23,$f4,$25,$11,$bf,$5d,$f7,$15,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f3
frame085: .byte $26,$ff,$ff,$ff,$ff,$ff,$ff,$f3,$b,$fd,$4f,$e1,$4f,$e1,$4f,$c3,$fe,$33,$fe,$15,$f2,$43,$df,$54,$27,$f7,$16,$2f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f3
frame086: .byte $25,$ff,$ff,$ff,$ff,$ff,$fe,$40,$9f,$d4,$fe,$23,$fe,$23,$fd,$5f,$c4,$fe,$23,$f4,$25,$df,$5d,$f7,$15,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e6
frame087: .byte $27,$ff,$ff,$ff,$ff,$ff,$11,$fe,$34,$fe,$13,$fe,$23,$fe,$14,$fd,$d,$fe,$13,$fe,$1a,$ee,$52,$3d,$f7,$c,$6f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$41
frame088: .byte $26,$ff,$ff,$ff,$ff,$ff,$53,$fc,$4f,$e1,$5f,$c6,$fc,$5f,$c5,$fe,$13,$fb,$11,$ce,$e3,$23,$e2,$f6,$8,$7f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e5
frame089: .byte $2a,$ff,$ff,$ff,$ff,$eb,$2f,$e1,$3f,$b7,$fd,$7f,$a5,$fc,$4f,$e1,$6f,$b6,$fc,$51,$8,$4f,$1e,$4e,$a5,$2e,$5f,$40,$89,$f5,$18,$2f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e9
frame090: .byte $2d,$ff,$ff,$ff,$ff,$ff,$b2,$fe,$13,$fc,$5f,$e1,$5f,$c5,$fc,$5f,$c3,$1,$fb,$6f,$b5,$44,$f4,$e2,$ed,$15,$e3,$ee,$20,$8e,$3f,$40,$e9,$f6,$16,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$61
frame091: .byte $39,$ff,$ff,$ff,$ff,$ff,$ff,$fc,$2f,$e1,$3f,$e1,$5f,$d4,$fd,$3f,$e1,$c,$1f,$c4,$fd,$8f,$99,$f5,$cf,$70,$e6,$fb,$5a,$2f,$e2,$3f,$d5,$fc,$78,$2e,$e5,$78,$2e,$e5,$d0,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5
frame092: .byte $3b,$ff,$ff,$ff,$ff,$ff,$ff,$fc,$1f,$e2,$3f,$e1,$4f,$d4,$fd,$3f,$e1,$e,$1f,$d4,$fd,$7f,$99,$f7,$af,$91,$16,$fc,$1e,$41,$fe,$32,$fd,$5f,$c5,$11,$82,$ee,$57,$82,$ee,$5e,$11,$2e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3
frame093: .byte $3e,$ff,$ff,$ff,$ff,$ff,$fe,$d1,$fe,$22,$fe,$14,$fe,$14,$fd,$3f,$e1,$3f,$e1,$4f,$e1,$6f,$a8,$f8,$af,$70,$e6,$fb,$9,$ff,$12,$fe,$22,$fd,$5b,$1e,$e5,$51,$19,$1e,$e5,$79,$1e,$e5,$e1,$21,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$31
frame094: .byte $3c,$ff,$ff,$ff,$ff,$ff,$fe,$c2,$fe,$13,$fe,$15,$fd,$3f,$e1,$2f,$e2,$4f,$d7,$fa,$8f,$89,$f7,$af,$91,$24,$fd,$1f,$f4,$2f,$e2,$2f,$d5,$fc,$51,$28,$2e,$e4,$51,$28,$2e,$e4,$e1,$3,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$21
frame095: .byte $3d,$ff,$ff,$ff,$ff,$ff,$fe,$c2,$fe,$13,$fe,$15,$fd,$3f,$d3,$fe,$24,$fd,$7f,$a8,$f8,$9f,$7a,$f9,$9,$11,$ff,$fe,$62,$fe,$22,$fd,$5c,$1e,$e5,$42,$19,$1e,$e4,$51,$29,$1e,$e4,$e2,$21,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$21
frame096: .byte $3f,$ff,$ff,$ff,$ff,$ff,$fe,$c1,$fe,$32,$fd,$4f,$e1,$4f,$d3,$fe,$13,$fe,$24,$fd,$7f,$99,$f7,$9f,$92,$15,$fa,$9,$e6,$1f,$e2,$2f,$e1,$4f,$d5,$b1,$ee,$55,$11,$92,$ee,$45,$12,$82,$ee,$3e,$20,$3e,$e1,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e1
frame097: .byte $3f,$ff,$ff,$ff,$ff,$ff,$ff,$fb,$1f,$e2,$2f,$e2,$4f,$d4,$fd,$3f,$e1,$4f,$e1,$3f,$e1,$7f,$98,$f8,$9f,$a1,$15,$e3,$1e,$d1,$e7,$1f,$e1,$4f,$d5,$c1,$ee,$45,$12,$91,$ee,$45,$12,$91,$ee,$3e,$32,$1e,$e1,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e1
frame098: .byte $3d,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$12,$fe,$14,$fe,$13,$fe,$13,$fe,$13,$fe,$14,$fe,$16,$fa,$8f,$7a,$f8,$e,$5e,$31,$ed,$3e,$51,$fe,$15,$fc,$52,$19,$2e,$e3,$52,$19,$2e,$e3,$50,$38,$2e,$e1,$e4,$3,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed
frame099: .byte $3b,$ff,$ff,$ff,$ff,$ff,$ff,$fb,$1f,$e2,$2f,$e1,$5f,$d3,$fe,$13,$fe,$13,$fe,$14,$fd,$7f,$a8,$f7,$af,$91,$25,$e3,$1e,$d1,$e7,$2f,$d5,$fc,$5d,$1e,$e3,$50,$39,$1e,$e3,$50,$39,$1e,$de,$62,$1e,$de,$9e,$de,$9e,$de,$9e,$de,$9e,$de,$9e,$de,$9e,$d1
frame100: .byte $3c,$ff,$ff,$ff,$ff,$ff,$ff,$fa,$2f,$e1,$3f,$e2,$3f,$e1,$3f,$e1,$2f,$e2,$4f,$d6,$fb,$7f,$89,$f9,$21,$5f,$a1,$23,$e5,$2f,$e2,$2f,$d5,$fc,$62,$19,$2e,$e2,$50,$39,$2e,$e2,$52,$38,$2e,$ce,$71,$2e,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$c1
frame101: .byte $3a,$ff,$ff,$ff,$ff,$ff,$fe,$b2,$fe,$13,$fd,$6f,$d3,$fe,$12,$fe,$24,$fd,$5f,$c7,$f9,$8f,$89,$fa,$12,$3f,$f4,$2f,$e2,$2f,$d6,$fb,$60,$39,$1e,$e2,$60,$39,$1e,$e2,$60,$39,$1e,$ce,$72,$1e,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$c1
frame102: .byte $3e,$ff,$ff,$ff,$ff,$ff,$82,$fe,$13,$fd,$6f,$c5,$fc,$4f,$d3,$fe,$15,$fd,$7f,$a8,$f8,$af,$6a,$f8,$21,$6f,$90,$91,$2e,$31,$ee,$11,$e5,$2f,$e2,$3f,$d5,$fb,$7e,$11,$ed,$60,$1a,$2e,$d6,$3,$a2,$ed,$62,$39,$2e,$be,$81,$2e,$be,$be,$be,$be,$be,$be,$be,$be,$b1
frame103: .byte $3c,$ff,$ff,$ff,$f7,$3f,$e1,$3f,$d4,$fb,$9f,$a7,$fa,$6f,$b5,$fa,$6f,$c6,$12,$fa,$bf,$6c,$f5,$e1,$f2,$e2,$f1,$e3,$ee,$5e,$4e,$e5,$e4,$f3,$c,$9f,$40,$c0,$c0,$df,$92,$fe,$e1,$1f,$e3,$1f,$e3,$2f,$e2,$2f,$e2,$2f,$e2,$4f,$d5,$e5,$1e,$b4,$e5,$2e,$b1
frame104: .byte $3f,$f7,$4f,$c5,$fc,$6f,$a7,$f8,$df,$2e,$3e,$e5,$e4,$f5,$cf,$5c,$f5,$bf,$4a,$f1,$32,$bf,$1e,$3f,$23,$48,$1,$ee,$31,$77,$7,$f6,$bf,$6b,$f7,$af,$7a,$f6,$bf,$6b,$f4,$df,$3e,$1f,$1e,$3f,$2e,$2f,$2e,$2f,$2e,$2f,$39,$14,$f4,$73,$3f,$73,$43,$f7,$34,$3f,$72,$53
frame105: .byte $38,$f4,$df,$4d,$f6,$bf,$e2,$2f,$e3,$1f,$ff,$ff,$ff,$e4,$6f,$a7,$ea,$4d,$8e,$88,$9a,$e6,$c6,$be,$54,$4,$71,$e1,$e5,$21,$24,$e8,$e5,$c,$16,$e6,$e8,$36,$83,$21,$4e,$83,$82,$f5,$2f,$e2,$2f,$e1,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f8
frame106: .byte $39,$f7,$af,$85,$ff,$ff,$ff,$ff,$ff,$ee,$13,$fd,$4f,$d4,$ea,$5e,$16,$e8,$9b,$7e,$6e,$15,$ae,$54,$10,$c8,$1c,$e5,$32,$14,$e7,$e4,$32,$17,$e5,$e5,$21,$28,$a3,$4e,$73,$a4,$f1,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$a1
frame107: .byte $3b,$fe,$21,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$21,$ec,$5e,$23,$ea,$ab,$4e,$8e,$26,$6e,$74,$10,$c8,$29,$e7,$42,$8,$e5,$e6,$e,$11,$15,$e4,$e6,$30,$36,$e3,$e7,$20,$78,$ae,$e1,$3a,$4e,$e5,$3f,$e2,$2f,$e2,$2f,$e2,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$21
frame108: .byte $35,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$eb,$2f,$9c,$f2,$e7,$a1,$e3,$62,$e3,$44,$e3,$54,$14,$e5,$e5,$11,$1a,$e4,$e5,$9,$be,$2f,$3e,$1f,$5c,$f7,$7f,$fa,$4f,$e1,$3f,$e1,$3f,$e1,$3f,$e2,$2f,$e2,$3f,$e1,$3f,$ff,$ff,$ff,$fe,$11
frame109: .byte $34,$e4,$ee,$5e,$3f,$1e,$36,$2e,$be,$31,$7,$43,$3e,$4e,$51,$11,$42,$7e,$1e,$51,$11,$41,$ac,$f8,$7f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f9,$3f,$e1,$3f,$e1,$4f,$e1,$3f,$e2,$3f,$e1,$4f,$e1,$2f,$ff,$ff,$ff,$11
frame110: .byte $1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e9,$3f,$e1,$4f,$d4,$fc,$3f,$c4,$fd,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$31
frame111: .byte $21,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$41,$fe,$23,$fd,$5f,$e1,$4f,$e2,$4f,$d4,$fe,$12,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f4
frame112: .byte $27,$1f,$79,$fa,$7e,$a2,$e5,$5e,$94,$e6,$3e,$94,$e8,$1e,$94,$fd,$4f,$d3,$fe,$13,$fd,$5f,$c5,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f7
frame113: .byte $20,$1e,$e1,$5f,$b6,$f8,$af,$5c,$f5,$7f,$a5,$fe,$12,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fd
frame114: .byte $1e,$1e,$be,$3f,$1e,$1f,$51,$73,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f7
frame115: .byte $29,$1f,$ff,$ff,$ff,$ff,$f3,$4f,$c8,$f9,$a4,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e3,$f2,$e2,$fd,$4f,$e1,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e1
frame116: .byte $28,$1f,$ff,$ff,$ff,$ff,$ff,$e2,$2f,$d5,$fb,$7f,$a8,$f8,$af,$7d,$f3,$e6,$ee,$3e,$7e,$e2,$33,$df,$6b,$f8,$bf,$89,$f9,$5f,$e1,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e4
frame117: .byte $27,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f3,$6f,$8b,$f6,$bf,$5c,$f4,$71,$4f,$46,$fa,$6f,$b5,$fb,$6f,$b6,$fc,$5f,$a0,$12,$fe,$13,$fe,$12,$ff,$ff,$ff,$ff,$ff,$ff,$fd
frame118: .byte $2c,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$fb,$4f,$c6,$fc,$5f,$b5,$fb,$6f,$89,$f7,$9f,$89,$fb,$5f,$c5,$fc,$5f,$b5,$fc,$5f,$c5,$fb,$6f,$b6,$fb,$6f,$a7,$fa,$1,$3f,$a0,$12,$fc,$12,$2f,$ff,$f6
frame119: .byte $2e,$1f,$ff,$ff,$ff,$ff,$ff,$fe,$73,$fc,$6f,$c5,$fc,$5f,$c5,$fc,$7f,$97,$fa,$7f,$a7,$fa,$6f,$a7,$fa,$7f,$a7,$fb,$6f,$b6,$fb,$7f,$a7,$fa,$7f,$a7,$fa,$8f,$90,$14,$f9,$30,$cf,$b2,$12,$ff,$e8
frame120: .byte $2f,$1f,$ff,$ff,$ff,$ff,$e3,$4f,$b7,$fa,$7f,$a7,$fb,$6f,$b7,$f9,$9f,$88,$f9,$9f,$89,$f7,$7f,$a8,$f9,$8f,$89,$f9,$8f,$b6,$fb,$6f,$b7,$fa,$7f,$98,$f9,$8f,$98,$f9,$8f,$99,$f8,$41,$4f,$90,$13,$f3
frame121: .byte $31,$1f,$ff,$ff,$11,$fc,$6f,$98,$fa,$8f,$98,$fa,$6f,$b6,$fb,$8f,$8a,$f7,$9f,$89,$f8,$af,$68,$11,$f7,$8f,$8a,$f6,$bf,$7a,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$99,$f8,$9f,$89,$f7,$af,$7a,$f7,$af,$7a,$ee,$51
frame122: .byte $30,$1f,$ff,$fe,$e5,$4f,$c6,$f9,$9f,$89,$f9,$8f,$a7,$fa,$7f,$a9,$f7,$bf,$6a,$f7,$af,$7a,$f7,$af,$6a,$f7,$af,$6b,$f6,$bf,$7a,$f9,$8f,$98,$f8,$9f,$89,$f8,$9f,$7b,$f6,$bf,$6b,$f6,$bf,$5c,$f5,$ce,$e2
frame123: .byte $31,$1f,$ff,$e6,$1f,$e1,$4f,$c7,$f8,$9f,$89,$f9,$8f,$a7,$fa,$8f,$99,$f8,$af,$6a,$f7,$af,$7a,$f7,$af,$79,$f7,$af,$6b,$f6,$bf,$7a,$f9,$8f,$98,$f8,$9f,$89,$f8,$9f,$7a,$f7,$bf,$6b,$f6,$bf,$6b,$f5,$ce,$c1
frame124: .byte $2f,$1f,$ff,$ff,$75,$fb,$7f,$8a,$f8,$9f,$88,$fa,$7f,$b7,$fa,$9f,$7b,$f6,$af,$7a,$f7,$af,$6a,$f6,$af,$7a,$f6,$bf,$7a,$f7,$af,$98,$f9,$8f,$98,$f9,$8f,$89,$f8,$9f,$89,$f8,$9f,$89,$f8,$af,$6b,$e8
frame125: .byte $2f,$1f,$ff,$ff,$a5,$f9,$9f,$99,$f8,$9f,$88,$fa,$6f,$b8,$f9,$af,$6b,$f6,$af,$7a,$f7,$af,$7a,$f7,$7f,$a8,$f9,$7f,$a7,$fa,$7f,$a8,$f8,$9f,$89,$f8,$9f,$8a,$f7,$af,$7a,$f7,$af,$7a,$f6,$cf,$5c,$e5
frame126: .byte $30,$1f,$ff,$ff,$d0,$2f,$b7,$f9,$8f,$a8,$f9,$9f,$87,$fa,$7f,$a9,$f8,$af,$79,$f8,$9f,$8c,$f4,$df,$4c,$f5,$bf,$68,$f9,$7f,$a8,$f9,$8f,$98,$f9,$8f,$99,$f8,$9f,$89,$f7,$bf,$6b,$f6,$bf,$6c,$f5,$ce,$21
frame127: .byte $30,$1f,$ff,$ff,$d5,$f9,$9f,$98,$f9,$9f,$89,$f8,$8f,$98,$f9,$af,$6c,$f5,$bf,$6b,$f7,$af,$7b,$f6,$81,$1f,$78,$f9,$9f,$88,$f9,$8f,$98,$f9,$8f,$98,$f9,$9f,$89,$f8,$9f,$89,$f8,$af,$6b,$f6,$bf,$6b,$e2
frame128: .byte $37,$1f,$ff,$ee,$42,$fc,$6f,$89,$f8,$af,$7b,$f6,$af,$88,$fa,$7f,$33,$49,$ee,$4e,$6e,$e2,$e8,$ee,$1e,$7e,$e3,$51,$df,$6b,$f6,$cf,$4c,$f5,$af,$61,$19,$f8,$9f,$8a,$f7,$af,$89,$f8,$9f,$89,$f7,$af,$7b,$f6,$bf,$6b,$f6,$bf,$6b,$e1
frame129: .byte $37,$1f,$ff,$ee,$52,$fb,$6f,$a8,$f7,$cf,$5b,$f7,$af,$7a,$f8,$9f,$98,$ee,$34,$5c,$ee,$1e,$9e,$ce,$ae,$ce,$ae,$ce,$9e,$d4,$6c,$f6,$bf,$6b,$f5,$af,$71,$19,$f6,$11,$9f,$89,$f8,$9f,$89,$f8,$af,$6b,$f6,$bf,$6b,$f5,$cf,$5c,$f5,$cd
frame130: .byte $39,$1f,$fd,$3f,$b7,$f9,$9f,$8a,$f5,$bf,$6b,$f6,$bf,$7a,$f8,$9f,$89,$f8,$ae,$81,$8,$8e,$3e,$6e,$e4,$e8,$ed,$e9,$ed,$e8,$b2,$de,$93,$ad,$f4,$e1,$f3,$df,$4c,$f4,$df,$42,$1a,$f6,$af,$7a,$f7,$bf,$6b,$f6,$bf,$6b,$f5,$cf,$5c,$f5,$ce,$11
frame131: .byte $3b,$1f,$ff,$ee,$32,$fe,$24,$fb,$8f,$8a,$f7,$af,$5c,$f5,$cf,$6c,$f6,$bf,$6b,$f6,$bf,$6b,$ee,$4e,$7e,$de,$9e,$de,$8e,$e2,$61,$de,$e3,$33,$df,$3e,$1f,$4d,$f5,$df,$4d,$f4,$df,$3e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3a,$11,$f5,$ae,$21
frame132: .byte $39,$1f,$ff,$ee,$34,$fc,$8f,$8a,$f6,$cf,$5c,$f5,$cf,$3e,$1f,$3e,$2f,$5c,$f5,$cf,$6b,$f6,$bf,$6b,$f6,$bf,$6b,$f5,$cf,$5c,$f5,$df,$3e,$1f,$2e,$2f,$2e,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4f,$1e,$3f,$1e,$3f,$2e,$2f,$2e,$2f,$2e,$29
frame133: .byte $36,$1f,$ff,$ff,$e2,$2f,$e2,$7f,$8b,$f6,$bf,$6c,$f5,$cf,$4d,$f3,$e1,$f5,$df,$5b,$f6,$bf,$7a,$f7,$af,$7a,$f6,$bf,$6b,$f5,$cf,$4e,$1f,$2e,$2f,$3e,$1f,$3e,$1f,$3e,$1f,$2e,$2f,$2e,$3f,$1e,$2f,$1e,$3f,$1e,$3f,$1e,$2f,$2e,$2b
frame134: .byte $3d,$1f,$ff,$ff,$d2,$fe,$28,$f8,$af,$7b,$f5,$cf,$5c,$f4,$df,$3e,$2f,$5c,$f6,$bf,$6b,$f7,$af,$7a,$f7,$bf,$5c,$f5,$cf,$4e,$1f,$2e,$2f,$1e,$4e,$e4,$e5,$ee,$3e,$6e,$e1,$e8,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$61,$e2,$ec,$3,$1,$e2,$ec,$7,$3,$e2,$f2,$e2,$91
frame135: .byte $3c,$1f,$ff,$ff,$e1,$5f,$c8,$f8,$af,$6c,$f5,$cf,$5c,$f4,$df,$4e,$1f,$5b,$f7,$af,$7a,$f7,$af,$7a,$f5,$cf,$2e,$3e,$e3,$e6,$ed,$e8,$ed,$ea,$eb,$eb,$eb,$83,$de,$b1,$15,$4d,$ea,$21,$45,$e1,$ec,$35,$e2,$f1,$e3,$f1,$11,$e1,$f3,$df,$5c,$f5,$cf,$4d,$b1
frame136: .byte $37,$1f,$ff,$ff,$e3,$4f,$d7,$f9,$9f,$7b,$f6,$cf,$3e,$1f,$4d,$f5,$cf,$6b,$f6,$ce,$b6,$6a,$eb,$eb,$e8,$ee,$1e,$82,$3e,$9e,$de,$9e,$d5,$2e,$2e,$d3,$7c,$f5,$cf,$5c,$f4,$df,$4d,$f5,$cf,$5c,$f4,$cf,$5c,$f6,$bf,$6a,$f7,$af,$7b,$c1
frame137: .byte $47,$1f,$fe,$41,$fe,$23,$fd,$6f,$9a,$ec,$1c,$be,$a2,$9e,$1e,$b4,$6e,$2e,$b5,$6d,$ec,$64,$de,$c7,$4b,$ed,$92,$be,$ce,$ae,$ce,$ae,$c2,$3e,$5f,$1e,$3f,$4d,$f4,$df,$3e,$1f,$3e,$1f,$2e,$2f,$2e,$3f,$1e,$3f,$1e,$3f,$1e,$3e,$e5,$e5,$ee,$3e,$6e,$e3,$12,$e3,$ee,$5e,$4e,$e5,$e3,$f1,$e3,$f1,$e3,$81
frame138: .byte $4d,$1f,$ff,$f7,$1f,$e1,$4f,$a9,$f5,$21,$ae,$d3,$6e,$1e,$b4,$6e,$1e,$b4,$6e,$2e,$a5,$6e,$1e,$b3,$7e,$1e,$b4,$6d,$ed,$45,$de,$d5,$4d,$ec,$81,$e1,$ec,$ea,$ec,$e9,$ed,$11,$e7,$ee,$4e,$5f,$1e,$3e,$e5,$e4,$ee,$5e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$3e,$7e,$e1,$e8,$ee,$1e,$8e,$e3,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$3e,$64
frame139: .byte $52,$1f,$1c,$f4,$e1,$f2,$e3,$ee,$5e,$5e,$e4,$e5,$ee,$1e,$8e,$de,$9e,$ce,$ae,$ce,$ae,$e1,$e8,$ee,$1e,$8e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e1,$11,$e6,$ed,$21,$e6,$e9,$21,$3,$e6,$e8,$63,$e5,$e7,$64,$e5,$e8,$54,$e5,$e7,$55,$e5,$e7,$55,$e5,$e7,$81,$e6,$e7,$ee,$2e,$8e,$e1,$e9,$ed,$e9,$ed,$e9,$ed,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$11
frame140: .byte $54,$1f,$1d,$f2,$e4,$ee,$4e,$5e,$e4,$e5,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e1,$e8,$ed,$e9,$eb,$eb,$eb,$eb,$eb,$eb,$e5,$25,$ea,$e5,$27,$e8,$e5,$28,$e7,$e5,$29,$e6,$e5,$38,$e6,$e3,$58,$e6,$e1,$78,$e6,$e1,$87,$e6,$e2,$77,$e6,$e3,$58,$e6,$e3,$67,$e6,$e3,$67,$e6,$e4,$66,$e6,$e5,$82,$e7,$e5,$ee,$4e,$6e,$e3,$e7,$ee,$2e,$7e,$e2,$e6,$ee,$3e,$6e,$e3
frame141: .byte $56,$1e,$e4,$df,$2e,$3e,$e5,$e6,$ee,$3e,$6e,$e3,$e7,$ee,$1e,$8e,$ce,$ae,$a1,$1e,$ae,$9e,$de,$9e,$de,$be,$be,$ce,$ae,$42,$8e,$8e,$42,$8e,$8e,$42,$8e,$8e,$43,$7e,$8e,$34,$7e,$8e,$25,$7e,$8e,$16,$7e,$8d,$86,$41,$e3,$e1,$76,$42,$e2,$e2,$57,$e8,$e2,$66,$e8,$e2,$75,$e8,$e3,$65,$e8,$e4,$63,$e9,$e5,$ee,$4e,$5e,$e4,$e6,$ee,$3e,$7e,$e2,$e6,$ee,$3e,$6e,$e3
frame142: .byte $59,$1e,$e4,$e4,$ee,$4e,$5e,$e4,$e5,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e2,$e7,$ee,$1e,$8e,$be,$be,$be,$be,$be,$be,$de,$9e,$92,$4e,$7e,$92,$5e,$6e,$83,$5e,$6e,$82,$6e,$6e,$46,$6e,$6e,$28,$6e,$6e,$28,$6e,$6e,$37,$64,$1e,$1e,$36,$74,$1e,$1e,$36,$74,$1e,$1e,$36,$6e,$7e,$37,$5e,$7e,$47,$3e,$8e,$57,$2e,$8e,$6e,$e3,$e6,$ee,$3e,$7e,$e2,$e8,$ee,$1e,$8e,$e1,$e7,$ee,$21
frame143: .byte $57,$1f,$3d,$f3,$e1,$f3,$e1,$f2,$e2,$f2,$e2,$f1,$e3,$ee,$5e,$4e,$e3,$e6,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e2,$e7,$c2,$e3,$e5,$c3,$e4,$e3,$d3,$e4,$e2,$e1,$3e,$4e,$1e,$23,$e3,$e1,$d6,$e2,$e1,$d6,$e2,$e1,$c8,$e1,$e1,$c8,$e1,$51,$8c,$8e,$15,$18,$e1,$7d,$51,$8e,$18,$c5,$18,$e2,$8b,$e1,$e3,$89,$e2,$e4,$86,$e4,$e5,$ee,$4e,$6e,$e3,$e7,$ee,$2e,$8e,$e1,$e9,$ed
frame144: .byte $3a,$1f,$79,$f8,$9f,$89,$f8,$9f,$89,$fb,$6f,$b6,$f1,$28,$6e,$e5,$3b,$3e,$e5,$3b,$3e,$e4,$3f,$e1,$3f,$d3,$f9,$3,$4f,$6a,$f6,$bf,$5c,$f4,$df,$4d,$f5,$cf,$5c,$f5,$cf,$6a,$f7,$af,$79,$f8,$af,$7b,$f7,$bf,$6c,$f6,$cd,$1e,$ac,$b2,$eb,$c8,$41
frame145: .byte $36,$1f,$ff,$ff,$ff,$f5,$1f,$e2,$3f,$d5,$fc,$6f,$c6,$fc,$6f,$d5,$fd,$5f,$d5,$fc,$6f,$a9,$f7,$bf,$5c,$f4,$e1,$f2,$e2,$f2,$e3,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$f3,$e1,$f4,$df,$5d,$f5,$e1,$f3,$e2,$f3,$e2,$f3,$e2,$d1
frame146: .byte $36,$1f,$ff,$ff,$ff,$fb,$4f,$d4,$fd,$4f,$d4,$fd,$5f,$c5,$fd,$4f,$d4,$fd,$5f,$7a,$f7,$bf,$5d,$f2,$e2,$f2,$e3,$f1,$e3,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4f,$3e,$1f,$3e,$1f,$4d,$f4,$e1,$f4,$e2,$f2,$e3,$f2,$e4,$f1,$e4,$ee,$5e,$6a
frame147: .byte $37,$1f,$ff,$ff,$ff,$ff,$ff,$fe,$b2,$fe,$24,$fe,$14,$fe,$14,$fe,$15,$fd,$5f,$d8,$f8,$bf,$5c,$f5,$df,$4d,$f2,$e3,$f1,$e3,$f1,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e5,$f3,$e3,$f2,$e4,$f1,$e5,$ee,$5e,$5e,$e5,$e6,$ee,$4e,$75
frame148: .byte $42,$1f,$d3,$fe,$13,$fe,$13,$fe,$13,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$d1,$fe,$23,$fe,$23,$72,$f5,$55,$3f,$55,$43,$f5,$72,$4e,$14,$e5,$71,$4e,$15,$e3,$dd,$6e,$3e,$1b,$7e,$3e,$1b,$7e,$2e,$2a,$8e,$2e,$38,$9e,$2e,$37,$ae,$3e,$53,$be,$4e,$e5,$e5,$ee,$4e,$7e,$e2,$e9,$ed,$eb,$eb
frame149: .byte $4e,$1e,$e3,$e5,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e2,$e5,$ee,$3e,$6e,$e1,$e8,$ee,$2e,$6f,$1e,$3f,$2e,$3e,$e5,$e4,$f1,$e3,$f1,$de,$b2,$e1,$6e,$c4,$9d,$e9,$57,$e3,$e6,$83,$e6,$e4,$a1,$e8,$e2,$f2,$df,$4c,$f5,$b7,$1e,$e3,$e3,$12,$ee,$3e,$7e,$e2,$ea,$eb,$ec,$e9,$ee,$1e,$8e,$e3,$e6,$f1,$e3,$f1,$e3,$21
frame150: .byte $4b,$1f,$ff,$ee,$25,$43,$f2,$a1,$4f,$1e,$3f,$1e,$4e,$e5,$e5,$ee,$4e,$3e,$e5,$e4,$ee,$4e,$2f,$2e,$2f,$3d,$f5,$df,$4d,$f4,$ce,$c1,$c8,$ee,$13,$99,$ed,$57,$de,$98,$4e,$2e,$6c,$1e,$3a,$26,$ee,$42,$15,$45,$fc,$37,$3f,$4e,$10,$7e,$43,$ae,$7e,$15,$9e,$6e,$27,$23,$2e,$6e,$2f,$3e,$1f,$5b,$f6,$af,$6c,$f5,$ce,$21
frame151: .byte $44,$1f,$ff,$ff,$88,$e,$f4,$e1,$f3,$e1,$f2,$e3,$f1,$e2,$f2,$e1,$f2,$e2,$f2,$e1,$f5,$bf,$6b,$f6,$bf,$87,$ed,$1c,$9e,$c4,$9c,$c2,$87,$6e,$19,$47,$a4,$e1,$77,$5f,$d3,$fe,$81,$11,$fe,$14,$7,$23,$d1,$e3,$e5,$d0,$e3,$25,$3e,$5d,$e2,$2e,$5d,$f5,$9f,$7a,$f7,$bf,$6a,$f6,$cf,$5c,$e6
frame152: .byte $47,$1f,$ff,$ff,$fe,$c6,$fa,$90,$cf,$4d,$f3,$e1,$f3,$e2,$f2,$e2,$f1,$e1,$f3,$df,$5c,$f5,$bf,$6b,$f8,$7e,$b2,$e1,$7e,$b5,$ac,$e7,$88,$d8,$37,$b5,$e2,$46,$7e,$e5,$29,$6f,$c5,$2,$19,$3e,$e1,$41,$50,$33,$5e,$e1,$e,$e4,$e2,$c,$45,$e7,$da,$7e,$59,$12,$e4,$1e,$59,$f7,$af,$7b,$f6,$bf,$6b,$e7
frame153: .byte $47,$1f,$ff,$ff,$a1,$fd,$9f,$8a,$12,$f3,$e1,$f3,$e1,$f3,$e2,$ee,$5e,$2f,$2e,$2f,$4c,$f5,$bf,$5c,$f6,$be,$91,$e3,$7e,$a4,$c9,$e9,$6a,$ca,$27,$97,$e1,$65,$7e,$12,$e1,$48,$6f,$c5,$e2,$2e,$e1,$41,$48,$4e,$e2,$d2,$5d,$9,$30,$d6,$e5,$dc,$6e,$4d,$e4,$1e,$5c,$f5,$9f,$7a,$f8,$af,$6b,$f5,$ce,$71
frame154: .byte $44,$1f,$ff,$ff,$fe,$c8,$f8,$a1,$2f,$4d,$f3,$e1,$f3,$e2,$f1,$e2,$f2,$e1,$f3,$e1,$f4,$bf,$6b,$f7,$ae,$b1,$e2,$6e,$c3,$c9,$ea,$68,$d9,$37,$97,$d7,$65,$c4,$e3,$2a,$4f,$e1,$30,$1f,$b0,$c5,$82,$ee,$4c,$24,$d0,$c0,$c4,$6e,$4d,$d5,$e4,$de,$41,$e5,$cf,$69,$f7,$bf,$7a,$f7,$af,$6b,$e6
frame155: .byte $43,$1f,$ff,$ff,$fe,$e1,$43,$2f,$5d,$f3,$e2,$f2,$e2,$f2,$e1,$f3,$e1,$f2,$df,$4d,$f4,$cf,$7b,$f6,$be,$d1,$b8,$ee,$12,$c7,$e1,$1b,$57,$ca,$48,$86,$d7,$75,$c3,$e2,$4a,$2f,$e3,$1f,$e4,$14,$4e,$91,$e3,$e1,$3,$d3,$20,$e5,$3e,$5d,$f4,$df,$4d,$f6,$9f,$8a,$f6,$bf,$6b,$f6,$ce,$41
frame156: .byte $42,$1f,$ff,$ff,$fe,$d7,$c,$f4,$df,$4e,$1f,$2e,$2f,$2e,$1f,$3e,$1f,$2e,$1f,$3d,$f5,$cf,$6b,$f6,$bf,$87,$e3,$1b,$3b,$8c,$3a,$57,$c9,$68,$84,$d7,$95,$b3,$ee,$43,$fe,$11,$ee,$51,$e8,$4e,$84,$30,$c3,$34,$29,$3,$ce,$22,$e6,$cf,$4d,$f5,$cf,$79,$f7,$af,$7a,$f7,$af,$7b,$e4
frame157: .byte $43,$1f,$ff,$ff,$ff,$52,$f5,$80,$8f,$4e,$1f,$2e,$3f,$1e,$2f,$2e,$1f,$2e,$2f,$1e,$2f,$3d,$f6,$bf,$5c,$f6,$ae,$e1,$2b,$6e,$32,$a4,$99,$c4,$88,$5c,$97,$6a,$4d,$2e,$13,$fe,$11,$fe,$a0,$be,$83,$81,$4,$42,$61,$20,$1d,$51,$91,$e6,$cf,$5d,$f4,$df,$5b,$f7,$9f,$7a,$f7,$af,$7b,$e4
frame158: .byte $4e,$1f,$ff,$ff,$a6,$61,$f2,$a2,$4f,$1e,$3e,$e5,$e5,$ee,$4e,$5e,$e4,$e4,$ee,$3e,$5e,$e3,$e3,$12,$ee,$4e,$2f,$4c,$f5,$ce,$d1,$9c,$ec,$39,$be,$b5,$a7,$ec,$76,$ae,$51,$59,$4d,$e2,$23,$c2,$e2,$b5,$2e,$e4,$97,$52,$3f,$7a,$21,$f4,$e1,$e5,$1e,$2e,$3e,$24,$de,$3e,$25,$32,$41,$2e,$2e,$2f,$3e,$1f,$5c,$f5,$bf,$6a,$f6,$ce,$61
frame159: .byte $50,$1f,$f8,$6f,$9b,$16,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$7e,$e1,$e8,$eb,$ea,$ec,$ea,$ed,$e3,$14,$ee,$3e,$1f,$3e,$1f,$4d,$ee,$42,$3c,$ee,$43,$3d,$ee,$25,$58,$ee,$36,$38,$ee,$47,$2a,$ee,$3e,$8e,$de,$9e,$21,$ae,$ac,$3a,$ea,$a5,$9f,$8b,$f6,$c1,$1e,$52,$e1,$e1,$e4,$5c,$e2,$e1,$8b,$e2,$e1,$a2,$34,$e5,$ae,$41,$e7,$af,$6b,$f5,$ce,$71
frame160: .byte $4a,$1e,$e2,$bf,$3e,$1f,$2e,$2f,$1e,$4e,$e4,$e5,$ee,$4e,$4e,$e5,$e3,$ee,$4e,$4e,$e3,$e6,$ee,$4e,$5f,$2e,$3f,$2e,$3f,$2d,$f4,$df,$4c,$f9,$8f,$7a,$f6,$be,$96,$9b,$e8,$a4,$de,$9b,$2c,$ea,$b1,$e1,$ea,$ee,$11,$24,$2d,$41,$ee,$4e,$6e,$24,$ae,$7d,$69,$e7,$c9,$7e,$9a,$a6,$e9,$ab,$5e,$a9,$c2,$ec,$9f,$7b,$e2
frame161: .byte $4f,$1f,$47,$f6,$bf,$4d,$f3,$df,$3e,$3e,$e5,$e5,$ee,$4e,$3f,$1e,$3e,$e4,$e5,$ee,$3e,$5e,$e4,$e6,$f1,$e4,$f2,$e3,$f1,$e1,$f4,$d1,$1f,$3a,$32,$f4,$73,$4f,$26,$55,$d8,$a8,$45,$d9,$7a,$36,$da,$6a,$34,$11,$e1,$a4,$c1,$4e,$69,$2e,$5e,$ae,$be,$ce,$be,$be,$e1,$e9,$e2,$56,$ea,$d7,$5e,$ad,$84,$ec,$b8,$4e,$e1,$99,$3e,$e1,$9a,$21
frame162: .byte $50,$1f,$79,$f5,$cf,$3e,$1f,$2e,$2f,$1e,$3f,$1e,$3e,$e5,$e4,$ee,$2e,$7e,$e1,$e8,$ee,$1e,$8e,$e2,$e7,$ee,$4e,$5e,$e5,$e4,$f1,$e3,$f1,$e3,$f2,$e2,$d4,$e4,$e1,$ab,$e1,$da,$ce,$38,$e1,$be,$17,$e3,$c8,$ce,$4c,$7c,$e,$e5,$84,$e1,$e,$e6,$81,$e4,$21,$e7,$ec,$12,$e7,$ee,$2e,$8e,$e1,$e9,$ed,$ea,$ec,$eb,$eb,$ed,$14,$b5,$1e,$e5,$a7
frame163: .byte $52,$1f,$d3,$f7,$af,$5c,$f3,$e1,$f2,$e2,$f2,$e2,$ee,$5e,$4e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$4e,$5e,$e5,$e4,$f1,$e3,$f1,$e3,$f2,$e2,$b5,$e4,$e2,$9a,$e2,$e1,$9c,$e1,$da,$ce,$3a,$bc,$e1,$91,$1c,$c8,$c0,$ee,$48,$7c,$e,$e5,$84,$e1,$e,$e6,$ec,$c,$e7,$eb,$c,$e8,$ee,$1e,$8e,$e1,$e9,$ed,$eb,$61,$e4,$ee,$5e,$4e,$e5,$b3,$3e,$e5,$a6,$11
frame164: .byte $4c,$1f,$79,$f6,$bf,$5c,$f4,$de,$e4,$e5,$ee,$3e,$6e,$e3,$e6,$ee,$4e,$5e,$e5,$e4,$f1,$e3,$f2,$e2,$f2,$e2,$f2,$e2,$f3,$e1,$98,$e4,$e1,$8c,$e1,$e1,$9c,$e4,$aa,$ce,$3a,$ad,$be,$1c,$d8,$be,$98,$5e,$1e,$98,$1e,$42,$1e,$7e,$c2,$1e,$8e,$b2,$1e,$9e,$de,$ae,$ce,$c3,$3e,$4e,$e5,$e4,$f1,$e3,$ee,$5b,$51,$ee,$5b,$f6,$b6
frame165: .byte $49,$1f,$b5,$fd,$4f,$e1,$3f,$e1,$3f,$e1,$3f,$e2,$2e,$22,$ee,$32,$e2,$5e,$d2,$e1,$9e,$a2,$9e,$4e,$e4,$e7,$ee,$2e,$8e,$e2,$e9,$ee,$1e,$ab,$4c,$e9,$95,$e1,$e9,$57,$e2,$73,$c1,$ae,$de,$9c,$97,$e7,$ca,$7e,$6c,$9a,$e4,$d7,$ce,$3e,$15,$e2,$e1,$e1,$5e,$b5,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6
frame166: .byte $2a,$1e,$5e,$de,$9e,$e3,$e7,$84,$e3,$ea,$39,$df,$6b,$f8,$9f,$a7,$fd,$4f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$39,$f4,$e1,$f3,$e1,$f3,$e1,$f4,$ce,$a1
frame167: .byte $25,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$cd,$f3,$e2,$f1,$e3,$f1,$e3,$f2,$e1,$f3,$e1,$f4,$cf,$6a,$f8,$8f,$98,$f9,$8f,$ff,$ff,$fe,$e2
frame168: .byte $28,$1f,$ff,$ff,$fe,$aa,$f6,$d1,$2e,$e5,$e4,$ee,$5e,$21,$1f,$1e,$3f,$1e,$2f,$3c,$f6,$af,$78,$f9,$8f,$a7,$fd,$2f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3
frame169: .byte $27,$1e,$3a,$f6,$df,$4e,$2f,$3e,$4e,$e5,$e2,$12,$ee,$5d,$21,$f1,$e3,$f2,$df,$49,$f7,$8f,$b6,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f7
frame170: .byte $29,$1f,$ff,$ff,$ff,$ff,$eb,$6f,$ba,$f7,$df,$4e,$3f,$2e,$5e,$e4,$e5,$ee,$5e,$12,$1e,$e5,$d0,$8e,$e5,$e3,$f1,$af,$78,$fc,$5f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fc
frame171: .byte $2f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e4,$1f,$e2,$61,$1f,$9b,$f6,$e1,$f3,$e3,$f1,$e4,$f1,$e6,$ee,$4e,$32,$1e,$e3,$e2,$1,$ee,$3e,$10,$1e,$e3,$e4,$ee,$5a,$f8,$8e,$91
frame172: .byte $3e,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$51,$fe,$12,$f9,$66,$2f,$33,$94,$f1,$17,$8,$6e,$e4,$26,$8,$6e,$e5,$34,$23,$34,$1e,$e2,$44,$37,$3e,$e3,$42,$72,$5e,$e3,$b2,$8e,$e1,$51,$e2,$ed,$62,$c0,$1e,$ce,$12,$32,$1e,$d8,$7,$f6,$7e,$a1
frame173: .byte $42,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$33,$fe,$23,$fe,$23,$ff,$ff,$ff,$e4,$1e,$e4,$1e,$33,$ee,$21,$e3,$5e,$e1,$1c,$15,$2e,$e1,$d,$91,$f4,$48,$29,$1e,$c5,$64,$64,$ec,$63,$53,$5e,$e1,$53,$44,$7e,$c5,$36,$19,$ec,$53,$e3,$eb,$81,$72,$14,$1e,$b8,$34,$53,$ed,$6e,$b1
frame174: .byte $3f,$ff,$ff,$ff,$92,$fe,$35,$fd,$5f,$e3,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$51,$fe,$42,$eb,$1e,$a2,$e9,$1f,$e3,$2f,$e3,$6d,$28,$3e,$57,$93,$ee,$48,$74,$f2,$55,$55,$3e,$c6,$45,$45,$eb,$56,$52,$7e,$b8,$34,$55,$eb,$73,$57,$3e,$a7,$54,$40,$9e,$c3,$94,$42,$81
frame175: .byte $35,$ff,$ff,$ff,$e1,$1f,$e2,$3f,$e1,$3f,$e2,$2f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$12,$fe,$41,$ff,$81,$fe,$41,$fe,$32,$32,$fb,$8a,$56,$8,$1e,$2a,$66,$84,$e2,$a5,$73,$3e,$99,$40,$c3,$34,$eb,$29,$12,$32,$54
frame176: .byte $21,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e2,$2f,$e1,$5f,$d4,$fd,$4f,$e1,$3f,$e2,$3f,$e3,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e6
frame177: .byte $20,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$31,$fe,$31,$ff,$ff,$e4,$2f,$e1,$2f,$e2,$2f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$b1
frame178: .byte $23,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$c3,$fd,$5f,$c5,$fb,$6f,$b6,$fb,$4f,$d3,$fe,$12,$fe,$21,$fe,$31,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$d1
frame179: .byte $20,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ec,$1f,$e2,$64,$1f,$5b,$f4,$bf,$87,$fc,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e2
frame180: .byte $22,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f3,$3f,$e4,$8f,$b7,$fa,$7f,$a7,$fb,$6f,$d4,$fe,$41,$fe,$41,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$61
frame181: .byte $2d,$ff,$ff,$ff,$ff,$ff,$fe,$81,$fe,$31,$fe,$31,$fe,$21,$fe,$31,$fc,$5f,$b6,$fb,$6f,$b7,$fa,$6f,$b7,$fb,$41,$1f,$d1,$fe,$31,$fe,$31,$fe,$31,$fe,$32,$fe,$31,$ff,$ff,$ff,$ff,$ff,$fe,$51
frame182: .byte $2b,$ff,$ff,$ff,$ff,$ff,$fe,$a1,$fe,$31,$fe,$21,$fe,$31,$fe,$21,$fc,$10,$3f,$c5,$fb,$8f,$98,$f9,$8f,$88,$f9,$8f,$88,$f8,$20,$1f,$92,$fe,$21,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$31
frame183: .byte $22,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f9,$5f,$a8,$f9,$9f,$7a,$f3,$e7,$ed,$35,$75,$2f,$42,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$21
frame184: .byte $2f,$ff,$ff,$ff,$ff,$21,$fe,$33,$fe,$24,$fe,$24,$55,$f6,$32,$7f,$6b,$f7,$af,$98,$f8,$bf,$4e,$1f,$3e,$4e,$e4,$d2,$6e,$e1,$d7,$6e,$ad,$82,$ec,$df,$4c,$f6,$bf,$88,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e5
frame185: .byte $38,$ff,$ff,$fc,$1f,$c7,$f9,$9f,$89,$f9,$8f,$98,$f9,$8f,$98,$fb,$5f,$d7,$f8,$af,$6e,$2f,$29,$1,$f3,$af,$7a,$f8,$9f,$82,$16,$f8,$9f,$7a,$f6,$bf,$6b,$f5,$df,$4e,$3f,$1e,$4e,$e5,$c,$de,$e5,$12,$e1,$f2,$e3,$ee,$5e,$4e,$e5,$e3,$e2
frame186: .byte $2e,$ff,$ff,$ff,$ff,$ff,$ff,$f3,$2f,$d6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$c4,$fd,$4f,$d5,$fb,$7f,$b6,$fb,$7f,$a7,$fa,$7f,$b8,$f8,$af,$67,$32,$f5,$80,$1f,$58,$1,$f5,$8f,$98,$f8,$9f,$89,$e7
frame187: .byte $2d,$ff,$ff,$ff,$ff,$ff,$ff,$f3,$2f,$d6,$fa,$7f,$a7,$fa,$7f,$a7,$fa,$7f,$b5,$fc,$5f,$c7,$fa,$9f,$99,$f8,$af,$86,$12,$f9,$52,$1f,$95,$f8,$9f,$8a,$f7,$af,$7a,$f8,$8f,$89,$f8,$af,$6b,$e6
frame188: .byte $2d,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e6,$5f,$b7,$fa,$7f,$a7,$fa,$7f,$b5,$fe,$13,$f8,$af,$5e,$1f,$5c,$f9,$8f,$99,$f8,$61,$2f,$89,$f6,$af,$7a,$f8,$8f,$97,$fa,$8f,$89,$f8,$9f,$8a,$f6,$be,$61
frame189: .byte $2c,$ff,$ff,$ff,$ff,$ff,$ff,$f4,$3f,$d6,$fb,$6f,$a8,$fa,$7f,$a7,$fb,$5f,$d3,$f8,$af,$6c,$f4,$cf,$50,$c8,$fa,$6f,$97,$f9,$8f,$b6,$fb,$9f,$8a,$f6,$af,$79,$f8,$9f,$7b,$f6,$cf,$4c,$e6
frame190: .byte $2f,$ff,$ff,$ff,$ff,$ff,$13,$fe,$15,$fb,$6f,$b7,$fa,$7f,$a7,$fa,$7f,$c4,$fd,$3f,$44,$18,$f2,$e2,$f7,$9f,$98,$f9,$8f,$b5,$fc,$5f,$c6,$fb,$8f,$8a,$f7,$af,$79,$f7,$af,$7a,$f7,$af,$7a,$f7,$be,$61
frame191: .byte $33,$ff,$ff,$ff,$ff,$ff,$23,$fd,$5f,$b7,$fa,$7e,$e3,$d,$87,$ee,$45,$67,$f1,$63,$7f,$31,$1c,$f7,$8f,$98,$f8,$9f,$88,$f8,$21,$6f,$b5,$fc,$5f,$c5,$fc,$6f,$b8,$f9,$8f,$99,$f7,$9f,$89,$f8,$9f,$89,$f8,$af,$7a,$e6
frame192: .byte $32,$ff,$ff,$ff,$ff,$ff,$f8,$1a,$4f,$22,$86,$f2,$26,$7f,$33,$48,$f3,$34,$7f,$53,$26,$f7,$af,$6b,$f6,$9f,$7a,$f7,$9f,$b6,$fb,$6f,$b5,$fc,$5f,$c6,$fb,$7f,$a8,$f9,$8f,$98,$f9,$8f,$99,$f8,$9f,$89,$f8,$ae,$51
frame193: .byte $33,$ff,$ff,$ff,$ff,$ff,$31,$f5,$28,$4f,$32,$76,$f2,$26,$7f,$33,$48,$f3,$34,$7f,$52,$36,$f7,$af,$6a,$f7,$9f,$88,$f8,$9f,$b6,$fb,$5f,$c5,$fc,$5f,$c6,$fb,$8f,$98,$f9,$8f,$98,$f9,$8f,$99,$f8,$9f,$89,$f8,$ae,$51
frame194: .byte $2e,$ff,$ff,$ff,$ff,$c5,$fc,$7f,$a8,$f8,$af,$7a,$f7,$af,$89,$f9,$8f,$98,$fb,$4f,$a7,$f9,$bf,$5c,$f5,$df,$3d,$f4,$df,$3d,$f7,$af,$79,$f8,$8f,$99,$f8,$df,$4d,$f4,$df,$3d,$f4,$b1,$1f,$3c,$e6
frame195: .byte $3a,$ff,$ff,$ff,$ea,$8f,$9a,$f7,$bf,$6c,$f5,$cf,$4e,$1f,$3e,$1f,$4d,$f6,$bf,$7a,$f7,$8f,$c4,$fa,$a3,$3e,$e5,$c1,$5e,$e3,$e6,$ee,$3e,$5e,$e5,$e3,$f1,$e1,$f4,$cf,$5c,$f6,$cf,$5e,$1f,$3e,$1e,$e4,$e,$e1,$ee,$4e,$4f,$1e,$3f,$2e,$1f,$3d,$e3
frame196: .byte $4b,$ff,$ff,$ff,$ee,$26,$a1,$ee,$4b,$61,$ee,$4c,$51,$ee,$4d,$42,$ee,$3d,$41,$ee,$4d,$42,$ee,$3d,$43,$ee,$2e,$13,$3e,$e3,$d3,$4e,$e4,$b3,$3e,$e5,$a5,$3e,$e5,$76,$4e,$e5,$11,$73,$4e,$e5,$b2,$4e,$e5,$e3,$f1,$e2,$f2,$e2,$f2,$e1,$f4,$df,$4c,$f6,$cf,$5e,$1f,$3e,$1f,$4d,$ee,$2e,$6e,$e4,$e5,$ee,$5e,$2f,$3d,$c1
frame197: .byte $4b,$ff,$ff,$d1,$fe,$31,$ee,$59,$71,$ee,$5b,$51,$ee,$4d,$f5,$c5,$1e,$e4,$c4,$2e,$e3,$e1,$41,$ee,$3e,$14,$2e,$e3,$d3,$4e,$e4,$b3,$4e,$e4,$b4,$3e,$e5,$86,$3f,$34,$73,$ee,$5a,$34,$ee,$4c,$14,$ee,$5e,$4e,$e5,$e3,$f2,$e1,$f3,$e1,$f3,$df,$5b,$f6,$cf,$5d,$f5,$de,$e3,$33,$de,$e3,$e5,$ee,$5e,$4e,$e5,$e2,$f3,$d9
frame198: .byte $4a,$ff,$ee,$31,$f1,$3c,$1e,$e4,$af,$7c,$f5,$c6,$1e,$e3,$d5,$2e,$e2,$d5,$2e,$e2,$d5,$3e,$e1,$d5,$3e,$e1,$e1,$44,$ee,$2b,$63,$ee,$3a,$63,$ee,$38,$83,$f1,$57,$4e,$e3,$a4,$5e,$e3,$b3,$5e,$e3,$b2,$4e,$e5,$e3,$f1,$e3,$f1,$e2,$f3,$df,$4b,$f6,$bf,$6b,$f6,$cf,$5d,$ee,$2e,$7e,$e3,$e6,$ee,$4e,$4f,$1d,$f4,$d9
frame199: .byte $30,$ff,$ff,$ff,$ff,$ff,$ff,$f6,$6f,$6c,$f6,$cf,$5d,$f3,$e1,$f3,$e4,$ee,$5e,$4f,$1e,$3f,$4b,$f6,$8f,$a8,$fa,$8f,$a8,$f9,$af,$8a,$f7,$df,$4e,$2f,$2e,$3f,$2e,$2f,$2e,$1f,$3d,$f5,$cf,$6c,$14,$f1,$e3
frame200: .byte $1c,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e7,$1f,$e3,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$a1
frame201: .byte $1c,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f3,$2f,$e2,$2f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$d1
frame202: .byte $20,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ed,$1f,$e2,$2e,$e5,$eb,$f8,$26,$1f,$91,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e2
frame203: .byte $1d,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f1,$6e,$e2,$e7,$f2,$e2,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f7
frame204: .byte $54,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$d3,$fc,$5f,$a7,$f8,$6f,$88,$f6,$bf,$2a,$24,$ee,$1c,$45,$e5,$e6,$66,$3e,$a7,$35,$72,$e2,$43,$85,$47,$11,$82,$93,$76,$56,$94,$75,$66,$56,$86,$66,$57,$45,$96,$66,$57,$45,$97,$47,$56,$64,$88,$47,$65,$64,$96,$66,$65,$63,$a6,$66,$64,$82,$a6,$65,$74,$81,$b6,$74,$83,$81,$c4,$84,$83,$e8,$48,$48,$2e,$94,$83,$92,$e2
frame205: .byte $78,$f7,$12,$7f,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f6,$bf,$5c,$f4,$df,$3e,$1f,$2e,$2f,$34,$28,$e6,$3c,$43,$7e,$40,$e3,$b3,$46,$e2,$43,$3a,$38,$2c,$75,$29,$37,$37,$73,$25,$48,$15,$61,$a5,$43,$6c,$a6,$25,$42,$40,$3a,$81,$25,$44,$42,$50,$38,$c5,$44,$43,$33,$46,$d4,$44,$34,$33,$c,$e6,$44,$52,$43,$24,$30,$cd,$44,$52,$43,$24,$23,$2d,$53,$52,$50,$84,$23,$2c,$62,$61,$60,$84,$15,$1c,$62,$d0,$83,$33,$29,$12,$62,$e5,$23,$32,$91,$27,$1e,$52,$33,$29,$11,$ee,$12,$30,$ea,$ee,$31,$51,$2a,$f4,$12,$a1
frame206: .byte $76,$ff,$ff,$35,$f9,$af,$30,$cb,$f1,$e3,$f1,$e3,$f1,$e3,$f2,$e3,$f1,$e3,$f1,$21,$de,$e5,$e,$de,$e5,$32,$be,$51,$d3,$38,$e5,$4c,$30,$11,$5e,$43,$32,$a3,$64,$e1,$55,$29,$25,$7b,$33,$24,$3d,$b9,$14,$42,$e,$2a,$d8,$14,$42,$30,$39,$e1,$72,$42,$33,$32,$7e,$20,$13,$24,$23,$30,$33,$e8,$14,$12,$42,$40,$83,$3,$3e,$33,$d,$52,$40,$83,$3,$4e,$23,$4b,$8,$23,$32,$e3,$34,$e2,$23,$24,$e2,$34,$e2,$23,$23,$e3,$33,$e4,$8,$23,$e2,$51,$ea,$8,$e2,$51,$ee,$1e,$25,$1e,$e1,$e2,$f2,$e2,$71
frame207: .byte $71,$ff,$ff,$fe,$48,$f5,$12,$af,$2e,$3f,$1e,$3e,$e5,$e4,$f1,$e3,$f2,$e3,$f1,$21,$de,$e5,$e,$cf,$10,$eb,$f2,$33,$7e,$64,$c3,$1,$15,$e4,$30,$1b,$27,$4e,$15,$52,$92,$57,$c2,$32,$43,$db,$e1,$33,$e,$1b,$dd,$33,$32,$1a,$d9,$14,$23,$33,$27,$e2,$3,$32,$42,$33,$3,$3e,$74,$8,$14,$24,$8,$23,$23,$e2,$40,$c1,$41,$50,$83,$3,$3e,$23,$3d,$8,$23,$23,$e3,$23,$e4,$23,$23,$e2,$42,$e4,$23,$23,$e2,$42,$e5,$8,$23,$e2,$41,$ee,$2e,$15,$1e,$e2,$e2,$f2,$e2,$f2,$e2,$81
frame208: .byte $6d,$ff,$ff,$fe,$48,$f5,$11,$bf,$2e,$2f,$1e,$3f,$1e,$3f,$1e,$4f,$2e,$2f,$10,$ec,$f1,$e,$cf,$10,$eb,$f1,$42,$8e,$64,$b4,$1,$15,$e4,$30,$1a,$36,$4e,$25,$52,$92,$48,$c2,$32,$43,$db,$e1,$33,$e,$1b,$ca,$8,$33,$30,$38,$e1,$91,$42,$33,$33,$6e,$b4,$23,$23,$23,$e6,$42,$1,$42,$40,$82,$32,$3e,$23,$c,$24,$15,$8,$23,$23,$e2,$33,$d0,$82,$32,$3e,$23,$3e,$42,$32,$3e,$23,$2e,$52,$32,$3e,$15,$1e,$a1,$4e,$15,$1e,$a1,$4e,$1f,$3e,$1f,$3e,$1f,$3e,$19
frame209: .byte $70,$ff,$ff,$fc,$bf,$5d,$f3,$e2,$f2,$e2,$f4,$df,$4e,$2f,$1e,$3e,$e4,$e3,$ee,$51,$1e,$2f,$2e,$2e,$82,$a3,$28,$e7,$e,$29,$34,$5e,$55,$32,$83,$64,$e1,$40,$34,$37,$15,$8c,$24,$23,$c,$1b,$ab,$23,$42,$32,$19,$ca,$33,$23,$30,$17,$d9,$34,$23,$23,$21,$c,$e9,$32,$41,$42,$32,$30,$ce,$14,$c,$34,$14,$8,$33,$c,$e2,$30,$c2,$a0,$83,$23,$2e,$23,$c,$2e,$20,$83,$2e,$23,$2e,$60,$82,$3e,$14,$2e,$60,$82,$3e,$14,$1e,$e3,$e1,$41,$ee,$3d,$f3,$e2,$f2,$e2,$f2,$e2,$91
frame210: .byte $70,$ff,$fe,$e4,$7f,$9a,$f6,$cf,$4d,$f3,$e1,$f3,$e1,$f3,$e1,$f2,$e3,$f3,$e2,$f5,$ae,$92,$e1,$9e,$82,$12,$d6,$11,$e5,$53,$2d,$5e,$26,$1,$42,$d5,$e5,$8,$30,$11,$1b,$8e,$22,$33,$3,$21,$9a,$e1,$23,$23,$32,$17,$ba,$8,$23,$23,$23,$25,$e7,$20,$82,$32,$30,$c2,$3e,$53,$c,$8,$19,$8,$30,$31,$e2,$30,$c0,$81,$90,$83,$3,$1e,$23,$c,$1e,$40,$c0,$ee,$23,$2e,$72,$32,$1e,$23,$2e,$71,$41,$2c,$11,$41,$ed,$12,$c1,$1e,$e5,$12,$df,$3e,$1f,$3e,$1f,$3e,$1f,$2e,$1b
frame211: .byte $6b,$ff,$fe,$e4,$7f,$8a,$f6,$cf,$4e,$1f,$3e,$1f,$3e,$1f,$2e,$2f,$1e,$3f,$4d,$f6,$be,$91,$e1,$ae,$75,$e1,$7e,$64,$41,$e2,$4e,$26,$3,$41,$e1,$5e,$32,$43,$24,$a9,$e1,$24,$32,$e,$18,$ab,$12,$33,$32,$e,$26,$c9,$c,$34,$c,$30,$35,$e6,$3,$32,$42,$30,$c0,$ce,$43,$c,$24,$15,$8,$12,$30,$31,$e1,$30,$e2,$e4,$30,$31,$e2,$3,$1,$e5,$c,$e2,$11,$40,$81,$e5,$c,$e2,$11,$41,$e9,$c,$e2,$11,$41,$ee,$1e,$1f,$3e,$1f,$4d,$f4,$df,$4d,$f4,$db
frame212: .byte $6a,$ff,$fe,$e3,$7f,$8a,$f6,$cf,$4d,$f5,$cf,$4d,$f3,$e1,$f2,$e3,$f4,$cf,$7a,$ea,$1e,$19,$e9,$9,$e1,$5e,$93,$41,$e1,$5e,$44,$3,$33,$c7,$e3,$23,$32,$49,$ae,$22,$33,$3,$21,$7b,$b0,$83,$23,$23,$21,$6c,$82,$43,$30,$c3,$23,$3e,$20,$33,$23,$24,$20,$10,$33,$e3,$40,$c2,$41,$50,$81,$23,$21,$2e,$12,$30,$34,$1c,$e,$e,$e1,$30,$c2,$e5,$c,$21,$e1,$1,$32,$e5,$c,$21,$e1,$1,$ea,$8,$21,$df,$21,$1c,$f3,$11,$cf,$5c,$f4,$df,$4d,$f4,$dc
frame213: .byte $59,$ff,$fe,$b4,$fa,$af,$7b,$f5,$cf,$5d,$f4,$cf,$4d,$f3,$df,$7a,$f9,$7f,$b5,$f3,$29,$3b,$3e,$62,$12,$64,$90,$e2,$e4,$c,$43,$67,$11,$6e,$20,$e3,$21,$27,$7,$12,$36,$c4,$7,$3a,$21,$3,$64,$94,$7,$3e,$22,$17,$55,$40,$14,$d2,$1c,$33,$59,$de,$41,$25,$90,$c6,$7,$e5,$6d,$70,$3e,$53,$e4,$60,$3e,$52,$e5,$af,$7a,$f6,$af,$6b,$f5,$df,$30,$8a,$f2,$c,$bf,$20,$cb,$e5
frame214: .byte $48,$ff,$fe,$d3,$fa,$82,$1f,$5e,$1f,$3e,$1f,$3e,$2f,$2d,$f3,$df,$4d,$f6,$bf,$6b,$ee,$11,$c3,$23,$ed,$3b,$30,$3e,$d5,$89,$c2,$b2,$42,$5a,$96,$83,$52,$1e,$17,$c,$21,$5e,$31,$1b,$3,$23,$72,$e7,$a0,$3d,$2e,$79,$e5,$1e,$79,$f8,$9f,$89,$f8,$9f,$89,$f7,$af,$7a,$f7,$af,$6b,$f6,$bf,$6c,$f4,$de,$51
frame215: .byte $50,$ff,$ff,$fb,$5f,$a9,$f7,$cf,$5d,$f4,$df,$4d,$f3,$b1,$2f,$59,$7,$f4,$82,$3f,$56,$42,$f7,$26,$2e,$72,$e2,$55,$1e,$61,$3,$b8,$b1,$a0,$e2,$1,$7a,$90,$c1,$66,$36,$2e,$20,$30,$24,$32,$76,$4a,$36,$60,$c1,$71,$9c,$43,$70,$be,$5c,$e4,$1e,$6b,$f5,$cf,$5c,$f5,$cf,$51,$1a,$f4,$21,$af,$4d,$f4,$11,$cf,$31,$1c,$f2,$e2,$f2,$e2,$e4
frame216: .byte $68,$ff,$ff,$ff,$ec,$9f,$8b,$f6,$cf,$5d,$f4,$df,$3a,$7,$f4,$92,$1f,$68,$7,$f6,$62,$3f,$73,$52,$f6,$54,$19,$1b,$b,$c8,$a0,$81,$81,$42,$9a,$73,$23,$52,$10,$c2,$10,$ce,$40,$20,$c0,$c0,$c0,$80,$c2,$10,$c1,$2b,$21,$23,$20,$82,$32,$30,$c0,$92,$12,$b0,$62,$72,$34,$1,$50,$d1,$cc,$8,$e,$2a,$a,$ce,$20,$9e,$5b,$ee,$31,$50,$ea,$ee,$23,$23,$2a,$ee,$35,$47,$21,$f7,$81,$2f,$59,$12,$f5,$a1,$1f,$4b,$12,$f3,$b1,$2f,$3e,$1e,$31
frame217: .byte $6d,$ff,$ff,$f9,$7f,$99,$f8,$cf,$5d,$f4,$df,$3e,$1f,$3a,$12,$f5,$90,$7f,$57,$23,$f5,$11,$52,$3f,$73,$52,$f6,$60,$18,$d,$91,$3,$b8,$a0,$82,$72,$32,$9a,$60,$90,$11,$24,$b,$3,$21,$2e,$11,$c,$c,$10,$32,$50,$10,$32,$8,$11,$b1,$c,$d,$1,$1,$30,$c0,$c1,$3,$2e,$20,$32,$8,$8,$8,$20,$16,$8,$d0,$1b,$14,$1e,$2b,$e2,$16,$1e,$11,$1a,$f3,$e,$af,$23,$2a,$f1,$24,$81,$2e,$e2,$36,$81,$2e,$c3,$8a,$11,$f5,$a1,$1f,$5a,$12,$f3,$e1,$f3,$e1,$e3
frame218: .byte $66,$ff,$ff,$fa,$6f,$99,$f8,$cf,$5d,$f4,$df,$4d,$f3,$b1,$2f,$4a,$12,$f5,$73,$2f,$75,$32,$f8,$25,$2e,$82,$e1,$60,$1a,$1a,$8,$1b,$8a,$20,$17,$20,$1a,$aa,$8,$24,$b,$3,$1,$3,$1c,$10,$c0,$80,$c4,$10,$c0,$93,$c,$21,$b0,$30,$30,$10,$31,$42,$16,$20,$11,$b0,$30,$30,$10,$11,$4e,$11,$1b,$21,$41,$a1,$e5,$c6,$1e,$e3,$11,$af,$30,$ea,$f2,$32,$af,$12,$48,$12,$ee,$14,$68,$12,$ec,$47,$cf,$5c,$f5,$cf,$4e,$1f,$3e,$1e,$31
frame219: .byte $6d,$ff,$ff,$fa,$7f,$99,$f7,$cf,$5d,$f4,$e1,$f3,$df,$3b,$12,$f4,$a1,$2f,$58,$23,$f5,$63,$3f,$72,$52,$e8,$2e,$25,$41,$e7,$8,$1b,$8c,$19,$30,$3a,$aa,$8,$23,$21,$c,$20,$12,$12,$e2,$3,$3,$23,$21,$3,$20,$80,$c1,$2c,$20,$80,$81,$3,$14,$11,$70,$81,$2c,$3,$3,$3,$2,$3a,$8,$12,$b3,$c,$20,$10,$22,$e5,$c0,$10,$19,$1e,$5c,$f4,$21,$af,$23,$28,$12,$ee,$52,$48,$12,$ee,$14,$68,$3,$eb,$47,$a2,$1f,$4a,$3,$f3,$a0,$1f,$2c,$3,$f1,$c2,$2e,$11
frame220: .byte $73,$ff,$ff,$f9,$8f,$99,$f7,$df,$4e,$1f,$3e,$1f,$3e,$1f,$2b,$12,$f5,$90,$7f,$48,$23,$f5,$54,$3f,$73,$52,$e6,$b,$e1,$54,$1e,$62,$1,$b8,$d2,$64,$3,$21,$7a,$a0,$c2,$1,$3,$3,$3,$21,$2e,$20,$10,$32,$32,$8,$10,$30,$32,$12,$c2,$8,$10,$31,$c,$b,$20,$93,$21,$c,$c0,$32,$10,$32,$12,$42,$16,$10,$32,$c0,$32,$16,$9,$11,$a0,$93,$c0,$12,$19,$11,$1e,$4c,$e3,$1e,$52,$18,$12,$f1,$32,$82,$3e,$e3,$33,$83,$6e,$85,$58,$64,$11,$e4,$46,$a8,$2e,$e2,$af,$7a,$f6,$cf,$5c,$e5
frame221: .byte $74,$ff,$ff,$f9,$9f,$7a,$11,$f5,$df,$4e,$1f,$3e,$1f,$2e,$2f,$2b,$12,$f4,$a0,$7f,$48,$23,$f5,$54,$3f,$73,$52,$e6,$11,$1e,$25,$41,$e6,$8,$2b,$8d,$35,$40,$3a,$aa,$20,$10,$10,$10,$30,$32,$12,$e2,$1,$3,$23,$20,$80,$c1,$3,$21,$2c,$20,$81,$3,$10,$c4,$3,$21,$3,$21,$2c,$3,$10,$c1,$3,$33,$1,$50,$c1,$2c,$21,$3,$20,$93,$d,$a0,$92,$c2,$9,$90,$c1,$e3,$ce,$21,$e6,$21,$81,$2f,$13,$28,$14,$ee,$33,$38,$33,$eb,$55,$85,$4e,$83,$6a,$72,$e4,$39,$a9,$3e,$da,$f6,$cf,$5c,$e5
frame222: .byte $78,$ff,$fe,$b2,$7,$f9,$af,$7c,$f5,$df,$4e,$1f,$3e,$1f,$2e,$2f,$2b,$12,$f4,$a0,$7f,$48,$23,$f6,$44,$3f,$72,$62,$e6,$2e,$26,$41,$e6,$8,$1c,$8d,$17,$30,$1b,$ab,$8,$c,$10,$30,$32,$8,$e5,$1,$1,$1,$5,$3,$3,$20,$81,$2c,$20,$81,$3,$3,$3,$1,$1,$3,$21,$2c,$21,$3,$3,$3,$23,$20,$81,$3,$21,$2c,$10,$c0,$c0,$81,$24,$a0,$92,$c1,$c,$26,$10,$31,$1e,$3c,$51,$a2,$e3,$e,$be,$21,$e3,$32,$80,$7e,$e4,$33,$83,$3e,$e1,$25,$85,$5e,$74,$68,$73,$e4,$48,$a8,$3e,$e1,$af,$6c,$f5,$ce,$51
frame223: .byte $77,$ff,$fe,$b6,$f9,$af,$7d,$f3,$e2,$f3,$e1,$f3,$e1,$f2,$e2,$f2,$b0,$7f,$3a,$7,$f4,$82,$3f,$41,$14,$43,$f7,$26,$2e,$61,$e3,$55,$1e,$61,$3,$c8,$d0,$95,$20,$1b,$ab,$8,$c,$d,$3,$1,$3e,$50,$13,$c,$33,$e,$20,$10,$12,$c2,$8,$8,$c,$d,$1,$1,$3,$3,$2c,$3,$3,$3,$3,$20,$90,$10,$30,$32,$c0,$30,$32,$8,$10,$32,$17,$8,$12,$c2,$8,$17,$10,$3a,$8,$12,$c2,$8,$1e,$e2,$e1,$f2,$c,$80,$7e,$e4,$33,$82,$4e,$e1,$34,$84,$5e,$75,$68,$64,$e5,$47,$a8,$3e,$22,$aa,$f6,$cf,$5c,$e5
frame224: .byte $76,$ff,$fe,$a8,$f8,$af,$7e,$1f,$2e,$2f,$3e,$1f,$2e,$1f,$2c,$7,$f3,$a0,$7f,$3a,$7,$f4,$82,$3f,$70,$d4,$2f,$72,$62,$f5,$5e,$41,$70,$bd,$8d,$d,$50,$82,$ba,$b2,$1,$24,$3,$21,$42,$1c,$12,$41,$3,$24,$3,$3,$3,$21,$2e,$11,$c,$c,$c,$24,$c,$8,$c,$c,$c0,$30,$30,$10,$34,$8,$8,$c,$c,$c0,$30,$30,$10,$14,$17,$8,$c,$c0,$30,$10,$10,$1c,$8,$12,$d0,$10,$1e,$e1,$e1,$f2,$e,$80,$7e,$e4,$42,$82,$4e,$e1,$34,$84,$3e,$95,$68,$64,$e6,$37,$a7,$3e,$24,$9a,$93,$ec,$cf,$5c,$e5
frame225: .byte $7c,$ff,$a2,$fa,$9f,$8a,$f6,$e2,$f2,$e2,$f2,$e2,$f1,$e3,$f1,$c0,$3f,$2b,$3,$f3,$a0,$7f,$48,$23,$f6,$e,$14,$2f,$63,$62,$f6,$4e,$51,$50,$de,$18,$d0,$c0,$82,$32,$ba,$c0,$82,$7,$1,$1,$42,$1c,$12,$40,$80,$83,$3,$12,$1,$1,$2e,$12,$8,$10,$30,$34,$c,$8,$8,$12,$d0,$30,$30,$10,$34,$8,$10,$33,$c,$c0,$30,$30,$10,$14,$8,$8,$8,$8,$c0,$10,$10,$10,$1c,$8,$12,$d0,$10,$1e,$b1,$2e,$12,$1e,$e4,$e,$80,$7e,$e5,$32,$82,$3e,$e2,$34,$84,$3e,$91,$23,$58,$65,$e5,$46,$a7,$3e,$15,$9a,$93,$ec,$cf,$5c,$e5
frame226: .byte $79,$ff,$84,$fa,$9f,$8a,$f6,$e2,$f2,$e2,$f2,$e2,$f1,$e3,$ee,$5d,$3,$f2,$b0,$3f,$3a,$7,$f3,$93,$2f,$41,$15,$42,$f7,$26,$2f,$64,$eb,$4e,$18,$e1,$9,$32,$32,$ba,$b2,$32,$7,$1,$21,$8c,$70,$80,$81,$4,$20,$72,$8,$12,$e1,$20,$81,$3,$3,$40,$c0,$80,$81,$2d,$1,$3,$1,$3,$40,$81,$20,$e0,$ed,$3,$3,$1,$3,$40,$80,$80,$80,$8c,$1,$1,$61,$d0,$81,$2e,$12,$8,$1e,$70,$81,$2e,$12,$1e,$e4,$e,$80,$7e,$e5,$32,$82,$3e,$e2,$43,$83,$4e,$87,$58,$56,$e4,$56,$a7,$3e,$15,$9a,$94,$eb,$cf,$5c,$e5
frame227: .byte $80,$ff,$76,$f9,$af,$7b,$f6,$e1,$f3,$e2,$f1,$e3,$ee,$5e,$5e,$e4,$e4,$f1,$c1,$2f,$3b,$7,$81,$93,$d9,$23,$60,$c1,$43,$3,$e1,$63,$34,$33,$51,$20,$11,$1c,$36,$30,$10,$30,$34,$c,$c,$2a,$45,$63,$c,$24,$c,$c,$c,$33,$82,$33,$c,$c,$24,$8,$8,$c,$21,$d2,$8,$20,$10,$14,$8,$8,$c,$c,$c0,$30,$30,$10,$1c,$8,$21,$e1,$12,$1,$e7,$8,$12,$d0,$30,$1e,$70,$81,$2e,$12,$1e,$e2,$12,$e1,$f2,$e2,$f2,$e2,$f2,$21,$cf,$10,$e9,$3,$e6,$14,$14,$42,$92,$45,$14,$16,$71,$62,$a2,$e1,$7a,$5a,$4b,$91,$15,$7a,$77,$ea,$cf,$5c,$e5
frame228: .byte $78,$1e,$75,$fb,$af,$7b,$f5,$cf,$5e,$3e,$e4,$e5,$ee,$3e,$7e,$e3,$e5,$ee,$5e,$4e,$e5,$e4,$ee,$5c,$14,$62,$93,$cb,$14,$46,$58,$a9,$24,$24,$2a,$16,$a4,$b,$80,$81,$a0,$81,$82,$81,$90,$81,$92,$1,$23,$e6,$8,$c,$23,$23,$c,$14,$1e,$71,$41,$23,$3,$23,$20,$82,$e7,$c,$32,$30,$24,$12,$32,$e7,$c,$e7,$7,$e6,$41,$e7,$7,$e6,$41,$ec,$e5,$ee,$5e,$3e,$e5,$e4,$ee,$5e,$5e,$e3,$41,$e2,$e3,$7,$24,$61,$a1,$55,$20,$e4,$72,$62,$a2,$62,$74,$e1,$3a,$3e,$15,$b4,$c4,$c6,$21,$56,$c6,$8e,$8e,$1e,$41
frame229: .byte $7f,$1e,$6b,$f5,$df,$4d,$f4,$e4,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e4,$e5,$ee,$4e,$5e,$e4,$d0,$88,$18,$2d,$e3,$65,$46,$ca,$15,$34,$18,$24,$b8,$25,$15,$28,$8,$18,$45,$48,$20,$13,$20,$13,$28,$1e,$30,$80,$80,$82,$1,$1,$32,$e7,$20,$10,$33,$30,$32,$8,$2e,$72,$1,$23,$23,$3,$20,$82,$e7,$c,$c,$32,$e,$30,$30,$3e,$63,$20,$e0,$ec,$23,$e5,$32,$e7,$14,$e5,$ee,$4e,$4e,$e5,$e5,$ee,$4e,$5e,$e3,$e6,$ee,$3e,$7e,$61,$65,$1e,$55,$20,$e1,$23,$32,$71,$c1,$72,$33,$e5,$2c,$2e,$e4,$4c,$4e,$11,$b6,$c6,$b8,$37,$e1,$75,$12,$21
frame230: .byte $7c,$1e,$4e,$7e,$de,$9e,$ce,$ae,$ce,$ae,$de,$9e,$e1,$e7,$ee,$2e,$7e,$e2,$e2,$14,$d1,$e2,$e1,$14,$70,$16,$dc,$24,$58,$15,$ca,$34,$34,$33,$26,$b6,$10,$7d,$19,$19,$38,$39,$1e,$10,$82,$e3,$16,$8,$8,$16,$17,$2e,$a1,$70,$81,$3,$20,$82,$e9,$20,$10,$30,$30,$32,$8,$2e,$92,$1,$3,$20,$e0,$e0,$c2,$e9,$c,$21,$e2,$23,$e7,$32,$e5,$23,$e7,$e,$eb,$e6,$ee,$3e,$6e,$e3,$e7,$ee,$2e,$7e,$e1,$e8,$ee,$14,$1e,$4e,$21,$86,$1c,$15,$82,$42,$57,$2c,$17,$53,$d,$33,$72,$e1,$18,$2e,$73,$d3,$ee,$15,$e1,$4e,$a7,$e1,$7a
frame231: .byte $70,$1d,$ee,$1e,$9e,$ce,$be,$ae,$ce,$ae,$ce,$41,$5e,$de,$31,$59,$1e,$4e,$21,$67,$4e,$2e,$12,$64,$9e,$2b,$36,$25,$26,$e1,$94,$d1,$41,$b4,$75,$a2,$91,$a2,$c2,$a2,$41,$82,$ee,$11,$41,$40,$81,$42,$ee,$11,$40,$82,$1,$42,$ed,$24,$12,$42,$14,$2e,$d2,$30,$c4,$3,$32,$ed,$23,$21,$61,$23,$3e,$1e,$e3,$23,$4f,$81,$fe,$e3,$e2,$ed,$e9,$ec,$ea,$ec,$eb,$eb,$eb,$ea,$ec,$e9,$61,$e1,$15,$e6,$72,$e1,$17,$e2,$91,$e2,$28,$63,$39,$2e,$32,$93,$e1,$4e,$33,$ea,$6e,$35,$b1
frame232: .byte $66,$1e,$1e,$72,$6e,$7e,$72,$6e,$8e,$71,$7e,$8e,$43,$7e,$9e,$33,$74,$1e,$6c,$57,$25,$e4,$81,$26,$61,$41,$63,$36,$a5,$d3,$c2,$e2,$3c,$34,$4e,$a1,$91,$42,$43,$41,$e9,$16,$14,$16,$2f,$21,$61,$51,$f2,$25,$24,$3f,$13,$42,$43,$f1,$34,$24,$3f,$13,$43,$33,$e3,$ff,$ff,$9e,$de,$5e,$e4,$e6,$ee,$2e,$6e,$e3,$e6,$ee,$4e,$5e,$e4,$e4,$ee,$5e,$46,$1e,$be,$27,$2e,$51,$7b,$92,$e5,$19,$7a,$2e,$62,$a4,$b2,$e6,$3b,$1b,$3e,$73,$b1
frame233: .byte $4b,$1e,$3e,$56,$7e,$6e,$18,$7e,$79,$12,$97,$e4,$d7,$3,$e5,$4e,$44,$eb,$1e,$82,$d5,$fc,$44,$1e,$e1,$27,$8,$2f,$a1,$42,$f9,$24,$2f,$93,$23,$f9,$32,$3f,$93,$24,$f7,$af,$7a,$f7,$ae,$5f,$ff,$fa,$ee,$3c,$f5,$cf,$5b,$f6,$bf,$6b,$f7,$9f,$89,$f8,$97,$1e,$e5,$78,$2e,$b1,$83,$a2,$eb,$1e,$73,$eb,$2e,$63,$eb,$2a
frame234: .byte $26,$f7,$1f,$ec,$24,$1f,$51,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f6,$1f,$e2,$3f,$d3,$e7,$ff,$ff,$9f,$61,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$41,$fe,$31,$fe,$22,$f3,$16
frame235: .byte $1e,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f6,$1f,$e3,$11,$ff,$f2,$fe,$31,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$41
frame236: .byte $23,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ed,$5a,$fe,$8e,$e3,$11,$54,$1f,$86,$21,$fc,$5f,$e1,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$51
frame237: .byte $34,$fe,$31,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ed,$3f,$b6,$fa,$8c,$eb,$3a,$46,$e7,$11,$41,$bf,$3e,$2f,$5c,$f8,$9f,$89,$f7,$af,$89,$f9,$8f,$a7,$fa,$7f,$98,$fa,$7f,$a7,$ee,$12,$c7,$ee,$32,$a7,$ee,$52,$87,$f2,$d,$47
frame238: .byte $38,$ff,$f2,$1f,$e2,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$91,$52,$fa,$7f,$ff,$ff,$ff,$75,$fb,$7e,$4e,$e4,$f8,$af,$b6,$fb,$6f,$b7,$fa,$6f,$c5,$fc,$5f,$c5,$fc,$5f,$c5,$fc,$64,$4e,$e3,$c,$62,$5f,$2b,$f6,$9f,$7a,$f4,$e1,$ee,$35,$1d,$12,$51
frame239: .byte $47,$ff,$ff,$fe,$c5,$fc,$6f,$a9,$f9,$af,$75,$24,$f7,$53,$2f,$ff,$fe,$a1,$ed,$4e,$42,$e8,$11,$6e,$33,$ea,$7e,$23,$eb,$6e,$14,$ec,$5e,$15,$eb,$5e,$14,$ec,$5e,$23,$ec,$4e,$33,$ec,$4e,$33,$ec,$4e,$33,$ec,$45,$1a,$2e,$d5,$7,$f4,$21,$7f,$96,$fa,$8f,$5e,$1f,$12,$3a,$32,$f1,$bf,$5d,$f3,$e2,$b1
frame240: .byte $48,$ee,$16,$fc,$5f,$e2,$3f,$e2,$3f,$e2,$3f,$e2,$3f,$e3,$3f,$e5,$1f,$e4,$2f,$ff,$fe,$e5,$1e,$82,$ea,$2e,$1b,$e8,$2e,$66,$e8,$2e,$75,$e8,$3e,$65,$e8,$3e,$64,$e9,$2e,$83,$e9,$3e,$64,$e9,$3e,$64,$e9,$3e,$64,$1,$e5,$1e,$86,$f9,$6f,$b6,$f9,$9f,$51,$29,$f8,$af,$6c,$f4,$e1,$f2,$e2,$f2,$12,$be,$11
frame241: .byte $43,$ea,$6f,$b8,$fa,$25,$2f,$e3,$2f,$e3,$1f,$e4,$2f,$e4,$2f,$ff,$ff,$ff,$f8,$2e,$72,$eb,$2e,$29,$e9,$2e,$47,$e9,$2e,$56,$e8,$4e,$55,$e9,$2e,$64,$ea,$2e,$63,$eb,$2e,$63,$ea,$4e,$53,$ea,$3e,$63,$32,$f8,$6f,$a5,$fc,$6f,$98,$f5,$c,$9f,$7b,$f5,$df,$4e,$1f,$2e,$1f,$21,$49,$e2
frame242: .byte $4a,$d6,$65,$f1,$65,$6f,$24,$64,$11,$fb,$30,$1f,$e4,$1f,$ff,$ff,$e3,$1f,$ff,$c4,$fc,$6e,$d1,$e3,$5e,$d1,$e4,$4e,$d1,$e4,$5e,$b3,$e2,$6e,$b3,$e3,$3e,$d3,$e3,$3e,$d3,$e2,$40,$3e,$93,$e2,$7e,$a3,$e2,$5e,$d1,$e2,$6f,$bb,$f4,$9f,$60,$c8,$f3,$15,$9f,$7c,$f5,$bf,$5b,$f6,$8,$c,$2f,$62,$81,$f6,$19,$1e,$51
frame243: .byte $48,$ed,$32,$5f,$89,$f9,$8f,$a7,$fd,$2f,$ff,$f4,$6f,$b6,$fa,$6f,$d4,$fd,$3f,$12,$a6,$ee,$41,$b6,$ee,$42,$a4,$f1,$29,$10,$74,$2e,$c4,$a4,$1,$ee,$12,$b4,$11,$ee,$32,$b5,$ee,$42,$a6,$ee,$33,$a7,$ee,$32,$89,$f6,$c,$8f,$99,$f7,$af,$6b,$f7,$8f,$a2,$32,$fa,$24,$1f,$a1,$51,$fa,$15,$1f,$a1,$61,$e9
frame244: .byte $47,$ff,$e1,$8,$8f,$6d,$fd,$5f,$b6,$fc,$5e,$96,$e2,$4e,$97,$fb,$5f,$d3,$fe,$13,$fd,$4f,$22,$94,$f2,$28,$5f,$22,$81,$7,$f2,$39,$3f,$23,$61,$23,$3,$ee,$32,$77,$f1,$26,$9e,$e5,$38,$6e,$e4,$47,$7f,$a8,$f9,$8f,$98,$f9,$8f,$a6,$fc,$8,$2f,$b1,$41,$fb,$14,$1f,$b1,$41,$fb,$14,$1f,$b1,$51,$ea
frame245: .byte $5b,$f6,$4f,$41,$66,$f5,$cf,$c5,$fe,$11,$ff,$e8,$1f,$c5,$fb,$6f,$b6,$fb,$5f,$d3,$ee,$32,$e1,$4e,$e2,$2c,$7e,$e1,$2c,$8e,$d3,$a1,$23,$1,$ec,$3a,$11,$44,$1e,$b3,$91,$24,$52,$e9,$38,$e,$42,$32,$1e,$83,$42,$19,$81,$e7,$37,$12,$69,$1e,$61,$c7,$91,$ee,$39,$a2,$ec,$bc,$1e,$bb,$d1,$eb,$ae,$21,$eb,$7e,$41,$eb,$14,$2e,$41,$e9,$25,$1e,$61,$e7,$16,$1f,$91,$61,$f9,$16,$1e,$91
frame246: .byte $4c,$ff,$e8,$3f,$c6,$fc,$6f,$b5,$fd,$3f,$32,$fb,$6f,$a7,$fb,$5f,$d3,$fe,$13,$ee,$51,$c6,$ee,$31,$b7,$ee,$22,$b8,$ee,$13,$a1,$7,$1,$ec,$49,$11,$44,$2e,$b2,$a1,$23,$3,$11,$eb,$29,$8e,$e3,$35,$b,$16,$ee,$33,$a7,$ee,$22,$b7,$fa,$8f,$8b,$f6,$bf,$69,$f9,$7f,$a1,$42,$f9,$25,$1f,$91,$61,$f9,$16,$1f,$91,$61,$e9
frame247: .byte $49,$ee,$55,$fe,$22,$fe,$35,$fd,$4f,$ff,$ee,$55,$fb,$6f,$b5,$fc,$4f,$89,$fd,$7e,$e2,$2a,$b1,$1e,$a2,$a6,$ee,$42,$92,$14,$ee,$42,$a1,$14,$ee,$34,$a5,$1,$ec,$39,$9e,$e2,$29,$7e,$e4,$24,$52,$6e,$e2,$4a,$71,$1f,$87,$f9,$8f,$99,$f8,$9f,$88,$f9,$7f,$a2,$42,$f9,$24,$2f,$91,$61,$f9,$16,$1f,$91,$61,$e9
frame248: .byte $53,$ee,$27,$fb,$30,$3f,$e3,$2f,$ff,$f7,$2f,$b5,$fc,$5f,$b5,$55,$f3,$40,$7f,$97,$1,$f5,$55,$1e,$b2,$a6,$41,$ec,$2a,$11,$40,$1e,$d2,$91,$24,$21,$ee,$12,$c5,$ee,$24,$82,$14,$ee,$33,$a6,$ee,$42,$a6,$ee,$33,$81,$17,$ee,$24,$50,$89,$ed,$34,$15,$8e,$e5,$17,$af,$7a,$f7,$af,$88,$f9,$24,$1f,$a1,$51,$fa,$15,$2f,$91,$61,$f9,$16,$1f,$91,$61,$e9
frame249: .byte $58,$f2,$7f,$b5,$fd,$4f,$ff,$51,$f1,$1f,$c5,$fc,$57,$4e,$e5,$64,$c,$3e,$e5,$a0,$1f,$47,$32,$f4,$64,$1e,$82,$d6,$32,$e9,$2c,$60,$1e,$b2,$b2,$15,$11,$ec,$2b,$12,$5e,$e1,$39,$c,$4e,$e1,$3a,$c,$4e,$e2,$2a,$11,$5e,$e3,$2a,$8e,$e2,$28,$21,$7e,$e1,$45,$23,$8e,$e1,$24,$25,$ae,$d0,$b7,$a2,$1e,$b2,$9a,$f6,$cf,$5c,$f6,$af,$88,$f9,$25,$1f,$92,$51,$f9,$16,$2e,$81
frame250: .byte $5b,$fe,$22,$ff,$fe,$e5,$1f,$c2,$12,$fa,$6f,$b6,$fa,$8e,$51,$e8,$7e,$51,$e9,$6e,$41,$ed,$3e,$31,$ed,$a5,$5e,$e1,$e8,$b2,$d8,$93,$d2,$d8,$72,$e3,$2c,$e,$55,$2e,$53,$61,$40,$85,$32,$e7,$46,$8,$12,$61,$2e,$93,$93,$27,$ec,$2a,$c,$6e,$c3,$b8,$ed,$3b,$8e,$d4,$9a,$ec,$19,$e,$9e,$c1,$73,$3a,$ee,$33,$6c,$ec,$37,$b0,$1e,$64,$ac,$41,$ee,$4e,$1f,$3e,$1f,$3e,$1f,$3e,$1e,$51
frame251: .byte $58,$ff,$e2,$1f,$e3,$1f,$a4,$12,$f9,$7f,$98,$f9,$8f,$98,$f9,$7f,$c4,$fc,$4f,$c8,$e5,$1e,$7b,$e1,$16,$2d,$db,$18,$2d,$e8,$11,$a2,$c9,$52,$34,$b3,$b2,$16,$94,$c3,$1,$72,$16,$73,$e1,$53,$25,$95,$2e,$53,$62,$32,$16,$32,$e7,$39,$b0,$7e,$83,$ab,$eb,$3c,$8e,$b4,$c9,$f7,$ae,$83,$cd,$f1,$41,$e1,$ee,$13,$4b,$32,$e9,$45,$d4,$3e,$34,$8e,$17,$1b,$4a,$e2,$f2,$e3,$e3
frame252: .byte $57,$ff,$e1,$1f,$b0,$83,$f8,$8f,$88,$f9,$8f,$98,$f8,$8f,$98,$fc,$3f,$d5,$fb,$7f,$99,$ec,$2b,$be,$13,$63,$bb,$c0,$81,$72,$bc,$92,$41,$63,$b2,$15,$27,$3,$c4,$a2,$16,$65,$e2,$59,$87,$4e,$23,$1,$78,$55,$e3,$36,$15,$73,$3e,$73,$92,$1b,$e9,$3b,$ae,$b3,$c8,$ec,$1d,$ae,$92,$e1,$e1,$f1,$d4,$3e,$de,$28,$2e,$73,$3d,$ee,$13,$5e,$1e,$a3,$8e,$1e,$74,$9e,$2e,$41
frame253: .byte $4d,$ee,$11,$e5,$2e,$d2,$e6,$1e,$73,$23,$f8,$9f,$79,$f7,$af,$79,$f8,$9f,$89,$fb,$3f,$d4,$fc,$6f,$a8,$f8,$bf,$6b,$d3,$e8,$bc,$9,$e8,$81,$48,$14,$1e,$88,$25,$42,$ee,$19,$55,$ee,$39,$54,$e8,$28,$75,$5e,$b2,$66,$33,$f1,$e1,$f5,$af,$89,$f8,$cf,$4b,$34,$ee,$4b,$92,$eb,$e1,$f1,$e3,$ee,$43,$2e,$1e,$81,$53,$4e,$1e,$61
frame254: .byte $64,$e1,$e2,$ee,$5e,$5e,$e3,$e6,$ee,$3e,$6e,$e3,$e7,$ee,$2e,$6e,$e2,$e7,$a1,$e4,$e7,$12,$61,$e5,$e6,$21,$eb,$e8,$ee,$1e,$50,$3d,$1c,$e5,$3,$21,$92,$12,$9e,$50,$3b,$11,$49,$ea,$71,$25,$9e,$b0,$16,$3a,$ee,$16,$3b,$ee,$22,$5d,$ee,$22,$5c,$ee,$41,$5d,$ee,$32,$3e,$1f,$3e,$2e,$92,$51,$4e,$1e,$93,$23,$5e,$1e,$63,$44,$4e,$6d,$53,$44,$f6,$25,$4f,$63,$43,$f6,$43,$41,$1f,$44,$35,$f5,$43,$5f,$54,$35,$f4,$54,$29
frame255: .byte $54,$ff,$ff,$fb,$1f,$d6,$fa,$9f,$7a,$f7,$af,$6c,$f4,$cf,$2e,$2f,$1e,$4e,$e3,$e5,$12,$ee,$1e,$5e,$e4,$e3,$12,$ee,$3e,$6a,$1e,$5e,$7c,$1d,$e8,$b2,$de,$b7,$1e,$3e,$b5,$1e,$5e,$be,$be,$b8,$9,$90,$8e,$ab,$19,$8,$e7,$7,$a2,$72,$4e,$43,$2b,$36,$28,$c4,$1c,$26,$3e,$b1,$c2,$62,$eb,$2c,$26,$2e,$b3,$b3,$52,$eb,$3c,$16,$2e,$b2,$d1,$62,$ea,$3d,$15
frame256: .byte $46,$ff,$ff,$ff,$ed,$6f,$a8,$f8,$af,$7a,$f7,$bf,$4d,$ee,$5e,$4e,$e4,$e5,$ee,$2e,$8e,$e1,$e7,$ee,$2e,$6e,$e3,$e7,$ee,$2e,$8e,$de,$9d,$1a,$ec,$a2,$be,$c9,$1c,$ed,$e9,$ed,$ea,$ed,$e9,$ec,$d1,$9e,$cc,$29,$ec,$ea,$32,$e1,$41,$ea,$3e,$81,$e9,$4e,$81,$ea,$3e,$73,$e9,$2e,$83,$e9,$2e,$83,$e4
frame257: .byte $4a,$fe,$e1,$6f,$b9,$f6,$df,$4e,$2f,$2e,$2f,$1e,$3e,$ce,$be,$be,$be,$be,$be,$be,$ae,$ce,$ae,$ce,$be,$be,$be,$be,$be,$be,$ce,$ae,$de,$9e,$de,$9e,$e1,$82,$be,$d8,$2c,$ee,$15,$3d,$ee,$14,$1e,$3e,$e1,$e8,$ee,$1e,$8e,$e1,$e8,$ed,$e9,$eb,$eb,$e9,$ee,$39,$32,$7,$ee,$46,$93,$ee,$37,$93,$ee,$46,$93,$ee,$11
frame258: .byte $42,$ff,$ff,$ff,$e2,$9f,$7c,$f4,$e1,$f3,$e1,$f3,$e2,$f1,$e3,$ee,$4e,$5e,$e4,$e5,$ee,$5e,$4f,$1e,$3f,$1e,$2f,$1e,$3f,$1e,$3e,$e5,$e5,$ee,$3e,$6e,$e4,$e5,$f2,$e1,$f2,$e2,$f1,$e3,$f1,$e3,$f1,$e4,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e3,$e7,$ee,$2e,$7e,$e2,$e6,$ee,$2e,$8e,$c1
frame259: .byte $46,$fe,$e4,$1f,$a8,$f7,$bf,$5d,$f4,$e1,$f2,$e3,$f1,$e3,$f1,$e3,$ee,$3e,$6e,$e3,$e6,$ee,$5e,$4f,$1e,$4e,$e5,$e3,$f1,$e3,$f1,$e3,$f1,$e4,$f1,$e4,$ee,$5e,$4f,$29,$f5,$e2,$f1,$e3,$f1,$e4,$ee,$5e,$4e,$e5,$e5,$ee,$3e,$6e,$e3,$e7,$ee,$2e,$7e,$e1,$e8,$ee,$1e,$9e,$e1,$e3,$15,$ec,$e4,$15,$ec
frame260: .byte $45,$b1,$fe,$22,$fe,$14,$f9,$9f,$7c,$f4,$e1,$f3,$e2,$f2,$e2,$f2,$e2,$ee,$5e,$4e,$e4,$e5,$ee,$4e,$5f,$1e,$3f,$1e,$3f,$1e,$3e,$e5,$e4,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5f,$5c,$f4,$df,$2e,$2f,$1e,$3f,$1e,$4e,$e5,$e5,$ee,$3e,$6e,$e3,$e7,$ee,$2e,$7e,$e2,$e8,$ed,$e9,$ee,$1e,$9e,$de,$ae,$b1
frame261: .byte $46,$c1,$fe,$23,$fd,$5f,$9a,$f6,$df,$4e,$1f,$2e,$2f,$2e,$2f,$2e,$2e,$e5,$e4,$ee,$4e,$6e,$e4,$e5,$f1,$e3,$f2,$e2,$f2,$e2,$f2,$e3,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4f,$2d,$f3,$e2,$f1,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$5e,$e3,$e6,$ee,$3e,$6e,$e3,$e7,$ee,$2e,$7e,$e3,$e6,$ee,$3e,$7e,$e1,$e8,$ea
frame262: .byte $43,$ff,$fe,$42,$fb,$9f,$7c,$f4,$e1,$f3,$e1,$f3,$e2,$f1,$e3,$f1,$e3,$ee,$5e,$4e,$e3,$e6,$ee,$5e,$4f,$2e,$2f,$2e,$2f,$2e,$2f,$1e,$4e,$e5,$e4,$ee,$5e,$4f,$1e,$2f,$3e,$1f,$3e,$2f,$2e,$2f,$1e,$3f,$1e,$4e,$e4,$e5,$ee,$4e,$5e,$e5,$e4,$ee,$4e,$6e,$e4,$e5,$ee,$4e,$5e,$e3,$e7,$e8
frame263: .byte $47,$e5,$1f,$e2,$3f,$a8,$f8,$bf,$5d,$f3,$e2,$f2,$e2,$f2,$e3,$f1,$e3,$ee,$5e,$4e,$e3,$e6,$ee,$4e,$5f,$1e,$3f,$1e,$3f,$1e,$3e,$e5,$e4,$ee,$5e,$5e,$e4,$e5,$ee,$3e,$6e,$e5,$e2,$f3,$e1,$f3,$e2,$f1,$e3,$f1,$e4,$ee,$4e,$5e,$e4,$e6,$ee,$3e,$5e,$e4,$e5,$ee,$4e,$6e,$e2,$e7,$ee,$1e,$8e,$de,$9e,$71
frame264: .byte $49,$e5,$1f,$e2,$2f,$99,$f6,$cf,$5d,$f3,$e2,$f2,$e2,$f2,$e2,$f1,$e3,$ee,$4e,$5e,$e4,$e5,$f1,$e4,$f1,$e2,$f2,$e2,$f2,$e3,$ee,$5e,$4e,$e5,$e5,$ee,$5e,$4e,$e5,$b4,$2e,$e5,$cf,$4e,$3f,$1e,$3f,$1e,$3e,$e5,$e5,$ee,$4e,$5e,$e4,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$7e,$e2,$e6,$ee,$3e,$11,$5e,$e1,$e2,$24,$e9
frame265: .byte $48,$ff,$ff,$f4,$3f,$89,$f7,$bf,$5d,$f4,$e1,$f3,$e1,$f2,$e3,$f1,$e3,$ee,$4e,$5e,$e4,$e5,$f1,$e3,$f1,$e2,$f1,$e3,$f1,$e3,$ee,$5e,$4e,$e4,$e5,$ee,$50,$ed,$f4,$df,$2e,$2f,$1e,$36,$2e,$be,$36,$2e,$be,$35,$3e,$ae,$54,$3e,$ae,$63,$3e,$ae,$54,$2e,$ae,$73,$2e,$ae,$72,$3e,$ae,$63,$2e,$ae,$82,$2e,$81
frame266: .byte $47,$fe,$e4,$1f,$a3,$3,$f8,$af,$6d,$f3,$e2,$f2,$e2,$f2,$e3,$f1,$e3,$ee,$3e,$6e,$e3,$e5,$ee,$5e,$5f,$1e,$3f,$1e,$3f,$1e,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e5,$ee,$5e,$4f,$2a,$1,$f2,$df,$2e,$34,$8e,$7e,$31,$e1,$e4,$f2,$e1,$f4,$df,$3e,$1f,$2e,$2f,$1e,$2f,$2e,$2f,$1e,$3e,$41,$de,$4e,$41,$ce,$51
frame267: .byte $40,$fe,$e2,$1f,$e2,$3f,$a7,$f8,$bf,$6d,$f3,$e2,$f2,$e2,$f2,$e2,$f1,$e3,$ee,$4e,$58,$1e,$8e,$5f,$1e,$3f,$1e,$3a,$1e,$8e,$3e,$e5,$e4,$ee,$5e,$4e,$e4,$e5,$ee,$4e,$5e,$e5,$23,$cf,$5c,$f2,$e2,$f1,$e3,$4a,$e5,$f2,$e2,$f3,$df,$6b,$f7,$af,$89,$f8,$8f,$a8,$f8,$9f,$6a
frame268: .byte $44,$fe,$e3,$1f,$e2,$3f,$b9,$f7,$bf,$5d,$f4,$e1,$f2,$e2,$f2,$e3,$f1,$e2,$ee,$5e,$5e,$e3,$e6,$ee,$5e,$4f,$2e,$2f,$2e,$3f,$1e,$3f,$1e,$3f,$1e,$4e,$e4,$e5,$ee,$4e,$1f,$5e,$1f,$2e,$3f,$1e,$3f,$1e,$3e,$e5,$e5,$ee,$4e,$6e,$e3,$e5,$ee,$4e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$ec,$ea,$ee,$5c
frame269: .byte $40,$ff,$fe,$42,$fd,$6f,$8b,$f5,$df,$4e,$1f,$3e,$2f,$1e,$3f,$1e,$3f,$1e,$3e,$e3,$e6,$ee,$4e,$5f,$2e,$2f,$2e,$2f,$2e,$2f,$2e,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$f2,$df,$4e,$2f,$2e,$2f,$1e,$3f,$1e,$ce,$ae,$e1,$e7,$ee,$4e,$6e,$e4,$e4,$f1,$e4,$f1,$e3,$f2,$e1,$f3,$71
frame270: .byte $43,$ff,$41,$fe,$23,$fc,$6f,$8b,$f5,$e1,$f3,$e1,$f2,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$ee,$4e,$6e,$e3,$e6,$ee,$5e,$3f,$1e,$3f,$1e,$3f,$1e,$4e,$e4,$e5,$ee,$4e,$5e,$e3,$e6,$ee,$5e,$1f,$4e,$1f,$3e,$3f,$1e,$2f,$1e,$4e,$e4,$ea,$ec,$ed,$e9,$ee,$2e,$7e,$e4,$e4,$f1,$e2,$f3,$e1,$f4,$61
frame271: .byte $42,$ff,$32,$fd,$4f,$7b,$f5,$df,$3e,$1f,$2e,$3f,$1e,$3f,$1e,$3f,$1e,$4e,$e5,$e4,$ee,$4e,$4e,$e5,$e4,$f2,$e3,$f1,$e3,$f1,$e4,$ee,$5e,$4e,$e5,$c0,$7f,$29,$f8,$af,$7e,$1f,$3e,$2f,$2e,$2f,$1e,$ce,$ae,$e2,$e6,$ee,$5e,$4f,$1e,$3f,$2e,$2f,$3e,$1f,$4d,$e1,$1e,$8b,$e1,$3e,$76
frame272: .byte $40,$ff,$ff,$f3,$1f,$c6,$f8,$bf,$5d,$f3,$e1,$f2,$e2,$f2,$e3,$f1,$e5,$ee,$4e,$5e,$e5,$e3,$f1,$e3,$ee,$5e,$3f,$2e,$1e,$11,$e6,$e1,$f3,$e1,$f2,$e2,$f2,$cf,$40,$c9,$f3,$8,$e1,$f2,$e3,$46,$e9,$ee,$3e,$6e,$e5,$e3,$f2,$e2,$f4,$df,$5b,$f6,$af,$8a,$f8,$8e,$31,$ea,$61
frame273: .byte $42,$ff,$fe,$21,$fa,$8f,$7b,$f4,$e1,$f2,$e3,$f1,$e3,$f1,$e3,$f1,$e6,$ee,$3e,$6e,$e4,$e4,$ee,$5e,$3e,$e5,$e4,$f1,$e1,$e4,$2e,$2e,$1f,$3e,$1f,$3e,$2f,$2c,$f5,$bf,$6e,$2f,$2e,$3e,$e5,$e4,$ee,$5e,$5e,$e4,$e6,$ee,$3e,$61,$9e,$5f,$2e,$3f,$4c,$f6,$bf,$89,$f8,$9e,$41,$e9,$81
frame274: .byte $42,$ff,$fe,$31,$fe,$13,$f8,$af,$5d,$f3,$e1,$f3,$e2,$f1,$e3,$f1,$e5,$11,$ee,$2e,$7e,$e3,$e4,$f1,$e3,$f1,$e2,$f1,$e2,$e3,$1e,$3e,$1f,$3e,$1f,$3e,$1f,$2e,$1f,$28,$14,$f4,$d,$1c,$f3,$e2,$f2,$e2,$f2,$e3,$38,$e8,$ee,$4e,$4f,$1e,$3f,$3e,$1f,$4d,$f5,$bf,$6b,$f7,$a4,$2f,$28
frame275: .byte $41,$ff,$fe,$51,$fe,$13,$f9,$9f,$6c,$f4,$e1,$f2,$e2,$f2,$e3,$f1,$e6,$ee,$3e,$4e,$e5,$e4,$f1,$e3,$f1,$e2,$f2,$e1,$f3,$e1,$f4,$df,$4c,$f5,$9f,$8a,$f7,$e1,$f3,$e1,$f2,$e3,$f1,$e3,$f2,$e3,$f1,$e4,$ee,$4e,$5e,$e4,$e6,$ee,$3e,$5e,$e4,$ee,$3e,$64,$1e,$e2,$e2,$41,$ee,$48
frame276: .byte $3f,$ff,$fe,$61,$fe,$14,$fa,$8f,$7b,$f4,$e1,$f2,$e2,$f2,$e6,$ee,$3e,$6e,$e3,$e5,$ee,$4e,$4f,$1e,$3f,$2e,$1f,$3d,$f3,$e1,$f4,$df,$4d,$f4,$af,$7a,$f6,$e2,$f2,$e3,$f1,$e3,$26,$ea,$ee,$3e,$61,$1e,$e3,$e6,$ee,$4e,$5f,$1e,$3f,$2e,$2f,$2e,$2f,$3e,$1f,$4c,$f3,$71
frame277: .byte $3e,$ff,$fe,$81,$fe,$23,$fb,$7f,$8a,$f5,$cf,$4e,$1f,$2e,$6e,$e3,$e5,$ee,$4e,$4e,$e5,$e5,$1,$ed,$e4,$f1,$e2,$f3,$e1,$f3,$e1,$f2,$e2,$f3,$df,$4d,$f4,$af,$7b,$f6,$e2,$f1,$e4,$ee,$5e,$4e,$e4,$ee,$2e,$7e,$e5,$e5,$ee,$5e,$4f,$2e,$1f,$4d,$f4,$df,$5b,$f4,$61
frame278: .byte $3d,$ff,$fe,$42,$fb,$7f,$8a,$f5,$df,$3e,$2f,$2e,$3f,$1e,$6e,$e3,$e4,$ee,$5e,$4e,$e5,$e4,$f1,$e2,$f2,$e1,$f3,$e1,$f3,$e1,$f4,$df,$4c,$f5,$af,$7b,$f6,$e2,$f1,$e4,$ee,$5e,$4e,$e5,$ee,$2e,$7e,$e5,$e3,$f3,$e1,$f4,$df,$5c,$f6,$bf,$7a,$f7,$ae,$21,$e7,$71
frame279: .byte $3b,$ff,$ff,$f3,$1f,$e1,$4f,$99,$f6,$cf,$4d,$f3,$e2,$f2,$e3,$f1,$e5,$ee,$4e,$4e,$e5,$e4,$f1,$e2,$91,$ea,$e1,$f3,$e1,$f3,$e1,$f4,$cf,$4d,$f4,$af,$7a,$f6,$e2,$f2,$e4,$29,$e5,$21,$ee,$3e,$5f,$1e,$3f,$2e,$1f,$4d,$f5,$cf,$6a,$f8,$af,$79,$f5,$a1
frame280: .byte $42,$fe,$e1,$1f,$e3,$1f,$99,$f6,$cf,$4e,$1f,$3e,$1f,$3e,$1f,$3e,$3f,$1e,$5e,$e4,$e4,$b1,$e6,$e4,$b1,$e6,$e3,$f1,$e3,$f1,$e1,$f3,$e1,$f3,$e1,$f3,$e1,$f3,$e1,$f3,$bf,$6b,$f6,$e3,$f1,$e3,$f1,$e4,$ee,$5e,$4e,$e5,$e6,$ee,$3e,$6e,$e3,$e7,$52,$e8,$f2,$e2,$f5,$cf,$7a,$f9,$81
frame281: .byte $3a,$fe,$91,$fe,$32,$fa,$8f,$9a,$f7,$bf,$6b,$f6,$cf,$5c,$f5,$e1,$f3,$e3,$f1,$e2,$91,$ea,$e2,$a1,$e9,$e1,$f3,$e1,$f3,$cf,$5c,$f5,$df,$4d,$f4,$cf,$5b,$f6,$8f,$99,$f8,$e1,$f3,$e2,$f2,$e2,$85,$e7,$e3,$3d,$e3,$f3,$e1,$f5,$cf,$6b,$f7,$af,$89
frame282: .byte $33,$ff,$f3,$2f,$e2,$3f,$e1,$5f,$c6,$fb,$7f,$a8,$f9,$9f,$8e,$1f,$3d,$f4,$df,$4c,$f5,$cf,$5c,$f5,$cf,$5b,$f6,$bf,$6b,$f6,$bf,$6c,$f5,$bf,$6b,$f6,$af,$77,$fa,$7f,$aa,$f7,$e1,$f3,$e1,$f3,$e1,$f3,$e2,$f2,$e2,$f2
frame283: .byte $33,$ff,$ff,$ff,$fe,$a1,$fe,$32,$fe,$23,$fe,$13,$fe,$14,$fd,$bf,$6b,$f6,$bc,$2e,$aa,$f7,$af,$7a,$f7,$9f,$89,$f8,$8f,$97,$fa,$7f,$a7,$fa,$8f,$98,$f9,$71,$1f,$87,$fa,$6f,$b6,$fb,$6f,$b3,$fe,$12,$fe,$23,$fe,$11
frame284: .byte $31,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f8,$2e,$e3,$2e,$22,$ec,$7e,$13,$eb,$7e,$22,$eb,$6e,$41,$eb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$5f,$c4,$fd,$4f,$d4,$fd,$3f,$e1,$2f,$e2,$2f,$e2,$1f,$e3,$2f,$e2
frame285: .byte $20,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ea,$3f,$e1,$4f,$e1,$4f,$d5,$fd,$5f,$d4,$fe,$23,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f8
frame286: .byte $21,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$11,$fc,$7f,$88,$f7,$9f,$79,$f7,$9f,$88,$fa,$6f,$c2,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e2
frame287: .byte $26,$ff,$ff,$ff,$ff,$ff,$ff,$f4,$2f,$e1,$3f,$e1,$4f,$c5,$fc,$5f,$c6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$c5,$fc,$5f,$d4,$ff,$ff,$ff,$ff,$ff,$ff,$f2
frame288: .byte $24,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$d3,$fe,$15,$fc,$7f,$b8,$fa,$9f,$99,$f9,$af,$8a,$f8,$bf,$7b,$f8,$af,$89,$fa,$6f,$e1,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$fd
frame289: .byte $25,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$52,$fe,$20,$c1,$f6,$e4,$f1,$e9,$ed,$eb,$ed,$e9,$ee,$2e,$7f,$1e,$3f,$85,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f3
frame290: .byte $2b,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$91,$fc,$8,$16,$6e,$e5,$16,$be,$e4,$12,$e3,$ee,$2e,$5e,$e2,$e6,$ed,$e7,$ee,$2e,$4f,$2c,$f6,$5f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$41
frame291: .byte $26,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$a1,$fd,$25,$6f,$30,$c1,$18,$f4,$df,$4c,$f4,$df,$4c,$f3,$cf,$4c,$f5,$af,$88,$fa,$5f,$d2,$ff,$ff,$ff,$ff,$ff,$ff,$f9
frame292: .byte $25,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$81,$fe,$31,$fe,$23,$fd,$4f,$a8,$f9,$9f,$7b,$f6,$cf,$5c,$f6,$bf,$79,$f8,$9f,$97,$fb,$6f,$ff,$ff,$ff,$ff,$ff,$ff,$11
frame293: .byte $2e,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$eb,$3f,$e1,$2f,$e3,$2f,$e2,$2f,$e2,$2f,$e1,$3f,$e1,$4f,$1a,$15,$1,$ee,$2e,$30,$1e,$e3,$e7,$ee,$3e,$5f,$2e,$1f,$4d,$f5,$bf,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$11
frame294: .byte $30,$ff,$ff,$ff,$ff,$ff,$ff,$f9,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$e3,$1f,$e2,$2f,$e1,$4f,$c5,$61,$f5,$56,$1e,$7a,$74,$16,$e7,$ee,$1e,$9e,$ce,$de,$9e,$e3,$e5,$ee,$5e,$3f,$41,$ff,$ff,$ff,$ff,$ff,$ff,$f7
frame295: .byte $33,$ff,$ff,$ff,$ff,$ff,$fe,$71,$7,$fe,$22,$fe,$22,$fe,$23,$fe,$21,$fe,$23,$fe,$13,$fd,$49,$1f,$25,$81,$f3,$55,$4d,$bc,$be,$2f,$1e,$4e,$e5,$e6,$ee,$2e,$ae,$be,$de,$8e,$e3,$45,$9f,$ff,$ff,$ff,$ff,$ff,$fe,$d1
frame296: .byte $3b,$ff,$ff,$fe,$33,$fa,$8,$3f,$a0,$83,$fe,$23,$fe,$13,$21,$fb,$2f,$e2,$2f,$e2,$3f,$d4,$fc,$6c,$2e,$e1,$7b,$2e,$e2,$6b,$2e,$e3,$65,$75,$7e,$8e,$25,$e2,$ce,$26,$fa,$7f,$99,$f7,$df,$4e,$2f,$1e,$55,$81,$2c,$f7,$9f,$c4,$ff,$ff,$ff,$ff,$fe,$a1
frame297: .byte $42,$e5,$18,$5f,$31,$84,$f4,$18,$3f,$51,$83,$f5,$18,$4f,$41,$84,$f4,$26,$6f,$31,$67,$f3,$15,$8f,$31,$4a,$f6,$bf,$79,$b5,$e9,$a8,$8e,$e1,$53,$de,$e1,$e8,$ec,$ed,$cf,$fe,$51,$fe,$22,$fe,$13,$fd,$4f,$c5,$fb,$60,$8f,$6e,$ae,$ae,$e1,$e7,$ee,$5e,$2f,$88,$fc,$3f,$ff,$ff,$41
frame298: .byte $3f,$a2,$a8,$ee,$32,$7b,$ee,$21,$7b,$ee,$22,$5d,$ee,$22,$4e,$1e,$e3,$14,$e1,$f3,$e1,$f3,$df,$3d,$e6,$1e,$78,$e2,$5e,$a5,$aa,$ec,$26,$e2,$eb,$eb,$e1,$ff,$ff,$ff,$ff,$ec,$1f,$e2,$2f,$e1,$3f,$d4,$fc,$5f,$a7,$f8,$9f,$6b,$f4,$e3,$ee,$4e,$8e,$ae,$e4,$7f,$ff,$f2
frame299: .byte $47,$92,$c6,$ee,$23,$a8,$ee,$22,$8b,$ee,$11,$7c,$ee,$12,$6d,$ee,$21,$4e,$2e,$e2,$15,$e2,$f1,$e2,$ee,$5e,$3f,$3e,$1e,$51,$e6,$ae,$15,$ea,$6b,$8e,$b4,$8c,$eb,$34,$e4,$eb,$eb,$e3,$ff,$ff,$ff,$ff,$ea,$1f,$e2,$2f,$e1,$3f,$b6,$fa,$7f,$3e,$1e,$e5,$e4,$ee,$3e,$6e,$de,$9e,$9e,$de,$6e,$e3,$e1,$f3
frame300: .byte $45,$63,$c2,$14,$ed,$3d,$11,$4e,$e1,$3d,$5e,$e1,$3d,$6e,$d3,$d6,$ee,$13,$b8,$ed,$2c,$9e,$c2,$ba,$ec,$1b,$be,$c1,$ad,$eb,$27,$e2,$ec,$17,$e2,$f3,$df,$2e,$2e,$13,$e1,$e4,$a7,$e8,$a6,$be,$b0,$e3,$2e,$2e,$be,$be,$8e,$e1,$af,$ff,$ff,$ff,$ff,$ff,$f1,$1f,$e2,$2f,$e1,$3f,$d4,$fb,$6f,$98
frame301: .byte $4b,$44,$e2,$56,$7b,$4e,$25,$44,$66,$44,$e1,$cd,$14,$4e,$19,$e8,$4d,$7e,$b4,$d1,$15,$ec,$3d,$7e,$c3,$e2,$5e,$c3,$e2,$6e,$c3,$d7,$ec,$3d,$8e,$c2,$ca,$eb,$2b,$ae,$b2,$bb,$eb,$2a,$ce,$c1,$9d,$ec,$18,$e1,$ed,$17,$e1,$f4,$de,$23,$e3,$cd,$7e,$2d,$9b,$e2,$d5,$e2,$e9,$ed,$e9,$ed,$cf,$ff,$ff,$ff,$ff,$ff,$ee,$51
frame302: .byte $5e,$46,$a9,$ea,$44,$25,$ae,$95,$72,$38,$ea,$4b,$9e,$b4,$c7,$ec,$4d,$9e,$84,$e3,$62,$4e,$34,$e3,$67,$4b,$4e,$36,$72,$35,$54,$e3,$72,$58,$42,$4e,$2d,$e3,$4e,$27,$e9,$4e,$27,$e9,$4e,$36,$ea,$3e,$45,$ea,$3e,$46,$ea,$3e,$27,$ea,$3d,$ae,$93,$cc,$e9,$2a,$e1,$e9,$28,$e3,$e8,$27,$e5,$e8,$26,$e6,$e9,$15,$e8,$e8,$15,$e8,$e8,$24,$e8,$e9,$23,$e8,$c4,$ae,$88,$99,$e8,$4e,$19,$f8,$cf,$5b,$f6
frame303: .byte $5f,$ff,$fe,$d2,$ed,$2e,$37,$ea,$5c,$9e,$97,$a9,$e8,$54,$26,$ae,$85,$72,$48,$e9,$4b,$21,$7e,$95,$e1,$6e,$a5,$e1,$7e,$94,$e4,$8e,$64,$e4,$64,$2e,$24,$e4,$76,$4a,$4e,$47,$70,$e4,$54,$e3,$93,$56,$41,$4e,$3e,$2d,$4e,$2c,$e4,$4e,$37,$e8,$4e,$55,$e9,$3e,$56,$e8,$3e,$56,$e8,$4e,$38,$e8,$3e,$29,$e8,$3e,$1b,$e8,$2d,$de,$72,$cd,$e7,$2c,$e1,$e7,$2b,$e3,$e6,$29,$e5,$e7,$17,$e7,$e7,$16,$e8,$e3
frame304: .byte $5b,$ff,$ff,$ff,$fe,$d1,$e5,$6e,$a3,$e2,$8e,$96,$ba,$e7,$50,$18,$be,$75,$61,$69,$e7,$5a,$8,$8e,$85,$d8,$e9,$4e,$27,$e9,$4e,$55,$e8,$4e,$58,$e5,$4e,$47,$44,$b5,$e4,$86,$48,$4e,$58,$63,$24,$34,$e4,$93,$57,$e,$3e,$41,$2b,$e1,$3e,$4b,$e4,$3e,$66,$e7,$4e,$65,$e7,$4e,$66,$e7,$3e,$57,$e7,$4e,$39,$e7,$3e,$1b,$e7,$3c,$e1,$e6,$3b,$e2,$e6,$39,$e4,$e6,$29,$e5,$e6,$28,$e6,$e3
frame305: .byte $57,$ff,$ff,$ff,$ff,$ff,$15,$ea,$3e,$37,$e9,$6c,$9e,$76,$21,$9a,$e7,$56,$16,$9e,$85,$91,$47,$e8,$5d,$8e,$95,$e2,$6e,$94,$e4,$7e,$74,$e5,$8e,$54,$e5,$64,$3d,$4e,$48,$64,$94,$e4,$95,$33,$34,$4e,$3a,$34,$82,$14,$e3,$21,$cd,$4e,$4b,$e3,$4e,$56,$e7,$4e,$65,$e8,$3e,$66,$e7,$4e,$47,$e8,$3e,$39,$e7,$3e,$2b,$e6,$4d,$de,$63,$ce,$1e,$62,$ce,$1e,$72,$be,$3e,$21
frame306: .byte $56,$ff,$ff,$ff,$ff,$fe,$e5,$6e,$92,$e4,$8e,$94,$d9,$e8,$7b,$9e,$85,$41,$79,$e9,$58,$14,$8e,$85,$e1,$7e,$95,$e1,$7e,$95,$e2,$8e,$74,$e5,$9e,$44,$e5,$74,$5a,$4e,$48,$76,$64,$e4,$96,$25,$41,$4e,$32,$17,$34,$b4,$e3,$21,$cd,$4e,$4b,$e3,$4e,$57,$e6,$4e,$66,$e7,$3e,$66,$e7,$4e,$47,$e8,$3e,$48,$e7,$4e,$2a,$e7,$3e,$1c,$e6,$3d,$de,$63,$cd,$e7,$3b,$e2,$e2
frame307: .byte $58,$ff,$ff,$ff,$ff,$e1,$5f,$a8,$e9,$2e,$38,$e9,$6b,$8e,$a8,$99,$e9,$56,$15,$8e,$a4,$aa,$ea,$5e,$17,$e9,$5e,$19,$e7,$5e,$2c,$e3,$4e,$57,$64,$94,$e4,$87,$e,$62,$4e,$49,$53,$81,$14,$e3,$a2,$5b,$4e,$32,$1b,$e1,$4e,$48,$11,$e4,$4e,$57,$e7,$3e,$66,$e7,$4e,$56,$e7,$4e,$57,$e7,$3e,$48,$e7,$4e,$2a,$e7,$3e,$1c,$e6,$4c,$de,$73,$be,$1e,$73,$ae,$2e,$72,$ae,$3e,$21
frame308: .byte $57,$ff,$ff,$ff,$ee,$33,$fb,$7f,$98,$eb,$4b,$9e,$b6,$9a,$e9,$55,$14,$ae,$a5,$9a,$eb,$5b,$9e,$a4,$e1,$9e,$75,$e1,$a0,$7e,$25,$e4,$76,$58,$5e,$48,$63,$35,$15,$e3,$95,$3a,$4e,$4e,$2c,$4e,$32,$1b,$e2,$4e,$38,$e7,$4e,$47,$e7,$4e,$56,$e7,$4e,$57,$e7,$3e,$57,$e7,$4e,$38,$e8,$3e,$2a,$e7,$4d,$ce,$73,$be,$1e,$73,$ae,$2e,$82,$9e,$3e,$82,$8e,$4e,$81,$8e,$6e,$11
frame309: .byte $57,$ff,$ff,$ff,$ee,$33,$fb,$8f,$89,$ea,$4b,$ae,$a7,$7b,$ea,$54,$12,$de,$a4,$9b,$ea,$5c,$9e,$95,$da,$e7,$4e,$12,$1b,$e3,$4e,$47,$74,$94,$e4,$86,$33,$52,$4e,$49,$44,$a4,$e3,$a1,$5c,$4e,$31,$2a,$e2,$4e,$39,$e6,$4e,$56,$e7,$4e,$65,$e8,$3e,$66,$e7,$4e,$47,$e8,$3e,$39,$e7,$4d,$ce,$73,$be,$2e,$64,$8e,$3e,$83,$6e,$5e,$83,$5e,$6e,$82,$5e,$7e,$82,$4e,$8e,$21
frame310: .byte $58,$ff,$ff,$ff,$f2,$5f,$a8,$e8,$1e,$49,$e8,$5c,$ae,$87,$9b,$e7,$64,$24,$ce,$76,$8d,$e8,$5c,$ae,$85,$e2,$ae,$55,$e1,$de,$25,$e3,$b3,$85,$5e,$59,$84,$45,$e5,$a7,$35,$5e,$4b,$54,$65,$e4,$21,$91,$68,$4e,$42,$1d,$b4,$e5,$92,$1e,$14,$e6,$8e,$44,$e7,$7e,$45,$e7,$7e,$44,$e6,$8e,$44,$e5,$9e,$54,$e2,$ce,$44,$de,$2e,$44,$ae,$4e,$44,$8e,$6e,$53,$6e,$9e,$43,$4e,$b8
frame311: .byte $55,$ff,$ff,$92,$fc,$8f,$8a,$e2,$1e,$7b,$e3,$5e,$2c,$e3,$8c,$ce,$28,$7,$8d,$e2,$76,$32,$e2,$e2,$6b,$61,$8e,$36,$e1,$de,$17,$e5,$da,$6e,$6e,$19,$6e,$6e,$28,$6e,$8c,$96,$e8,$c9,$6e,$7d,$96,$e6,$e2,$86,$e6,$c,$b8,$6e,$60,$cb,$86,$e6,$c2,$19,$5e,$8a,$c5,$e9,$9c,$5e,$a9,$b5,$ea,$9c,$5e,$8b,$b5,$e7,$cc,$5e,$5e,$1b,$5e,$4e,$2c,$5e,$2e,$3d,$4d,$e5
frame312: .byte $55,$fe,$22,$fe,$13,$fc,$5e,$16,$e9,$6e,$28,$e5,$7e,$1c,$e1,$8e,$19,$34,$a8,$e1,$88,$55,$8d,$9d,$dd,$8e,$59,$d8,$e6,$21,$5d,$8e,$95,$d7,$e9,$6c,$8e,$a5,$c8,$ec,$3c,$8e,$d2,$c8,$ec,$3c,$8e,$b4,$c7,$eb,$4d,$7e,$a4,$e2,$6e,$a3,$e3,$6e,$b3,$e2,$7e,$b3,$e1,$7e,$c3,$d7,$ed,$2e,$16,$ee,$11,$e1,$6f,$b7,$fb,$6e,$d1,$e2,$6e,$d1,$e3,$6e,$b2,$e3,$6e,$a3
frame313: .byte $36,$e4,$e2,$f1,$e9,$ed,$c6,$ae,$7b,$d8,$e3,$be,$53,$e2,$cf,$5b,$f6,$bf,$6b,$f5,$bf,$6b,$f6,$bf,$6a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$89,$f8,$9f,$89,$f8,$9f,$89,$f9,$8f,$99,$f8,$9f,$98,$f9,$9e,$91
frame314: .byte $50,$e4,$e7,$ee,$2e,$7e,$e1,$e8,$ee,$1e,$8e,$e1,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$5e,$4d
frame315: .byte $42,$e9,$ed,$e9,$ed,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$de,$9e,$de,$9e,$de,$9e,$de,$9e,$de,$9e,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$c1
frame316: .byte $40,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb
frame317: .byte $44,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$ec,$ea,$e8,$33,$e8,$e7,$45,$e6,$e4,$78,$e3,$e6,$58,$e3
frame318: .byte $4b,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$e8,$33,$e8,$e7,$45,$e6,$e5,$67,$e4,$e3,$88,$e3,$e5,$66,$11,$e3,$e5,$66,$e5,$e5,$66,$e5,$e5,$66,$e5,$e6,$56,$e5,$e7,$45,$e6
frame319: .byte $51,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$ec,$ea,$e8,$33,$e8,$e7,$45,$e6,$e6,$56,$e5,$e6,$57,$e4,$e4,$77,$e4,$e6,$56,$e5,$e6,$55,$e6,$e6,$55,$e6,$e6,$56,$e5,$e6,$56,$e5,$e6,$55,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e6,$55,$e6,$e6,$55,$e6
frame320: .byte $57,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$e9,$23,$e8,$e8,$34,$e7,$e6,$57,$e4,$e6,$55,$11,$e4,$e5,$67,$e4,$e6,$55,$e6,$e7,$45,$e6,$e7,$44,$e7,$e7,$45,$e6,$e6,$55,$e6,$e6,$56,$e5,$e6,$56,$e5,$e6,$56,$e5,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e6,$55,$e6,$e6,$56,$e5,$e5,$66,$e5
frame321: .byte $58,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$ee,$1e,$8e,$74,$5e,$6e,$74,$5e,$6e,$74,$6e,$5e,$74,$7e,$4e,$74,$6e,$5e,$74,$6e,$5e,$a1,$4e,$7e,$92,$4e,$7e,$74,$4e,$7e,$65,$5e,$6e,$65,$6e,$5e,$65,$6e,$5e,$65,$6e,$5e,$65,$5e,$6e,$74,$5e,$6e,$74,$5e,$6e,$74,$5e,$6e,$74,$5e,$6e,$74,$5e,$6e,$65,$5e,$6e,$65,$6e,$5e,$65,$6e,$5e,$56,$7e,$41
frame322: .byte $57,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$ed,$e9,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e6,$55,$e6,$e7,$46,$e5,$e8,$35,$e6,$e8,$34,$e7,$e8,$34,$e7,$e7,$45,$e6,$e6,$55,$e6,$e6,$56,$e5,$e6,$56,$e5,$e6,$56,$e5,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e6,$55,$e6,$e6,$56,$e5,$e5,$66,$e5
frame323: .byte $57,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$ec,$ea,$e9,$25,$e6,$e7,$45,$e6,$e7,$45,$e6,$e6,$55,$e6,$e6,$55,$e6,$e7,$46,$e5,$e8,$35,$e6,$e9,$25,$e6,$e8,$34,$e7,$e7,$44,$e7,$e7,$45,$e6,$e6,$56,$e5,$e6,$56,$e5,$e6,$56,$e5,$e6,$55,$e6,$e6,$55,$e6,$e6,$55,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e6,$55,$e6,$e6,$56,$e5,$e6,$56,$e5
frame324: .byte $58,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$ec,$ea,$ea,$15,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$46,$e5,$e8,$36,$e5,$e9,$25,$e6,$e8,$11,$14,$e7,$e8,$34,$e7,$e7,$45,$e6,$e7,$45,$e6,$e6,$56,$e5,$e6,$56,$e5,$e6,$56,$e5,$e6,$55,$e6,$e6,$55,$e6,$e6,$55,$e6,$e7,$45,$e6,$e7,$45,$e6,$e7,$45,$e6,$e6,$56,$e5,$e6,$56,$e5
frame325: .byte $5a,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$ec,$ea,$ee,$1e,$8e,$74,$6e,$5e,$74,$5e,$6e,$74,$6e,$5e,$74,$6e,$5e,$74,$6e,$5e,$83,$51,$1e,$4e,$92,$41,$1e,$5e,$91,$7e,$5e,$83,$5e,$6e,$83,$8e,$3e,$74,$8e,$3e,$65,$8e,$3e,$56,$7e,$4e,$65,$6e,$5e,$65,$6e,$5e,$62,$12,$5e,$6e,$56,$5e,$6e,$65,$5e,$6e,$74,$5e,$6e,$74,$5e,$6e,$65,$6e,$5e,$65,$6e,$51
frame326: .byte $58,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$ee,$2e,$7e,$92,$7e,$4e,$92,$7e,$4e,$92,$7e,$4e,$83,$7e,$4e,$92,$8e,$3e,$a1,$8e,$3e,$a1,$7e,$4e,$92,$5e,$6e,$83,$6e,$5e,$74,$6e,$5e,$74,$6e,$5e,$83,$6e,$5e,$83,$6e,$5e,$83,$71,$1e,$2e,$83,$ae,$1e,$83,$ae,$1e,$83,$9e,$2e,$74,$6e,$5e,$74,$7e,$4e,$74,$7e,$4e,$65,$6e,$5e,$65,$6e,$51
frame327: .byte $56,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$ee,$4e,$5e,$83,$6e,$5e,$83,$6e,$5e,$83,$74,$1c,$e8,$38,$c,$ce,$92,$cc,$e9,$2d,$be,$92,$62,$4c,$e9,$24,$62,$ce,$92,$64,$2c,$e9,$26,$33,$ce,$92,$63,$3c,$e9,$27,$23,$ce,$92,$7e,$4e,$92,$6e,$5e,$92,$6e,$5e,$92,$6e,$5e,$83,$6e,$5e,$83,$6e,$51
frame328: .byte $5a,$eb,$eb,$eb,$eb,$eb,$eb,$e7,$c,$eb,$e7,$c,$eb,$e7,$c,$eb,$e8,$12,$eb,$e8,$12,$eb,$e8,$12,$eb,$e8,$21,$eb,$e9,$11,$eb,$e9,$11,$eb,$e9,$ed,$e9,$ed,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$82,$1e,$be,$80,$ee,$ae,$74,$3e,$8e,$65,$4e,$7e,$65,$4e,$7e,$65,$4e,$7e,$65,$4e,$7e,$65,$4e,$7e,$65,$4e,$7e,$65,$4e,$7e,$74,$4e,$7e,$74,$4e,$7e,$74,$5e,$6e,$74,$7e,$4e,$83,$7e,$41
frame329: .byte $5c,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$e7,$8,$eb,$e7,$8,$eb,$e7,$8,$eb,$e7,$8,$eb,$e7,$c,$eb,$e7,$c,$eb,$e8,$12,$eb,$e8,$12,$eb,$e8,$12,$eb,$e8,$12,$eb,$e8,$21,$eb,$e8,$21,$eb,$e7,$e,$eb,$e7,$e,$eb,$e7,$e,$eb,$e7,$c,$eb,$e7,$32,$ea,$e6,$44,$e8,$e6,$44,$e8,$e5,$55,$e7,$e5,$55,$e7,$e5,$54,$e8,$e5,$54,$e8,$e5,$54,$e8,$e6,$44,$e8,$e6,$44,$e8,$e6,$44,$e8,$e6,$45,$e7
frame330: .byte $5a,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$e7,$12,$ec,$e7,$12,$ec,$e7,$12,$ec,$e7,$12,$ec,$e7,$21,$ec,$e7,$21,$ec,$e7,$21,$ec,$e8,$11,$ec,$e8,$11,$ec,$e8,$11,$ec,$e8,$ee,$1e,$7e,$e2,$e7,$21,$ec,$e6,$ee,$3e,$60,$ce,$ce,$63,$2e,$be,$63,$4e,$9e,$54,$5e,$8e,$45,$5e,$8e,$45,$5e,$8e,$45,$5e,$8e,$54,$5e,$8e,$45,$5e,$8e,$45,$4e,$9e,$54,$5e,$8e,$63,$5e,$8e,$54,$5e,$81
frame331: .byte $55,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$71,$1e,$de,$62,$1e,$de,$6e,$e3,$e6,$ee,$3e,$5e,$e4,$e5,$32,$ec,$e5,$34,$ea,$e4,$45,$e9,$e4,$45,$e9,$e3,$55,$e9,$e3,$55,$e9,$e4,$45,$e9,$e4,$45,$e9,$e4,$45,$e9,$e5,$35,$e9,$e4,$45,$e9,$e4,$45,$e9,$e4,$46,$e8
frame332: .byte $60,$e7,$ee,$2e,$7e,$e2,$e4,$12,$ee,$2e,$41,$2e,$e2,$e4,$12,$ee,$2e,$42,$1e,$e2,$e4,$21,$ee,$2e,$51,$1e,$e2,$e5,$11,$ee,$2e,$51,$1e,$e2,$e5,$ee,$4e,$5e,$e4,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$23,$ed,$e4,$26,$ea,$e4,$26,$ea,$e3,$36,$ea,$e3,$37,$e9,$e2,$46,$ea,$e3,$36,$ea,$e3,$36,$ea,$e3,$35,$eb,$e3,$36,$ea,$e3,$36,$ea,$e4,$26,$ea,$e4,$27,$e9,$e4,$28,$e8,$e5,$18,$e8,$e5,$16,$ea
frame333: .byte $5c,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$40,$c0,$ce,$ae,$42,$60,$ce,$6e,$d0,$8e,$5e,$e1,$8,$e4,$ed,$33,$e3,$ed,$15,$e3,$e4,$1d,$e4,$e4,$1c,$e5,$e4,$28,$e8,$e4,$27,$e9,$ed,$e9,$ee,$1e,$8e,$e2,$e7,$ee,$2e,$7e,$de,$9e,$e1,$e8,$e3,$1b,$e7,$e3,$1c,$e6,$e3,$19,$14,$e4,$e3,$19,$33,$e3,$ee,$13,$2e,$31
frame334: .byte $57,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$14,$ee,$1e,$8e,$e1,$e1,$17,$ed,$e1,$1b,$e9,$e1,$18,$c,$e8,$e1,$18,$c,$e8,$ed,$e9,$f2,$e2,$f2,$e2,$e2,$1e,$1e,$5e,$21,$8e,$be,$22,$8e,$ae,$31,$8e,$ae,$32,$7e,$ae,$32,$8e,$9e,$31,$ae,$8e,$b0,$8e,$7e,$b1,$4e,$6e,$c0,$ee,$6e,$c0,$ee,$6e,$ce,$ae,$ce,$ae,$11,$ae,$ae,$11,$be,$9e,$11,$be,$9e,$ce,$a1
frame335: .byte $5b,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$40,$91,$ed,$e3,$24,$ed,$e2,$35,$ec,$e2,$35,$ec,$e1,$46,$eb,$e1,$46,$eb,$a0,$84,$7e,$a2,$b1,$40,$13,$fa,$8e,$c8,$78,$e9,$d5,$8e,$9d,$58,$e9,$c7,$7e,$9c,$a4,$e9,$ca,$4e,$9c,$96,$e8,$c6,$10,$c2,$3e,$7b,$72,$61,$e8,$b7,$2e,$e2,$b7,$3e,$e1,$b7,$4e,$db,$75,$ec,$a8,$4e,$db,$73,$ee,$1b,$55,$ee,$1c,$46,$ed,$c3,$7e,$d1
frame336: .byte $5d,$f1,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$f4,$11,$bf,$7a,$ee,$42,$6a,$ee,$32,$7a,$ee,$32,$89,$ee,$32,$98,$ed,$55,$14,$7e,$c6,$43,$46,$56,$4e,$35,$34,$55,$e1,$66,$c5,$ee,$14,$c5,$ee,$14,$c5,$ee,$14,$b6,$ee,$14,$42,$56,$ee,$14,$89,$ee,$14,$89,$ee,$14,$89,$ed,$58,$9e,$d5,$51,$29,$ed,$55,$23,$7e,$d5,$62,$18,$ed,$57,$ae,$d5,$7a,$ed,$55,$ce,$d5,$6b,$ee,$14,$6b,$ee,$14,$11,$4b
frame337: .byte $23,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f2,$28,$9e,$e2,$e2,$41,$ff,$ff,$ff,$ff,$ff,$ec,$1f,$ff,$ff,$ff,$e9,$1f,$e3,$1f,$e3,$1f,$ff,$fe,$71
frame338: .byte $1c,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$34,$fd,$9f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$b1
frame339: .byte $20,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e2,$5f,$c7,$fb,$8f,$a9,$fa,$9f,$a7,$fd,$4f,$e2,$2f,$ff,$ff,$ff,$ff,$ff,$fc
frame340: .byte $29,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$22,$fe,$25,$fc,$7f,$a8,$f9,$9f,$8a,$f7,$af,$8a,$f7,$bf,$7a,$f8,$af,$8a,$f7,$af,$8a,$f8,$af,$89,$f9,$9f,$99,$f8,$9f,$99,$11
frame341: .byte $2c,$ff,$ff,$ff,$ff,$ff,$fe,$54,$fd,$5f,$c6,$fa,$8f,$a7,$fb,$7f,$a8,$f9,$8f,$99,$f8,$9f,$89,$f9,$8f,$98,$fa,$7f,$a6,$fb,$7f,$a7,$fa,$7f,$a7,$fb,$7f,$a7,$fa,$7f,$a7,$fa,$8f,$a7,$d1
frame342: .byte $2f,$ff,$ff,$fa,$2f,$e1,$5f,$c5,$fb,$7f,$b6,$fc,$6f,$c5,$fc,$6f,$a8,$f9,$8f,$98,$f9,$8f,$98,$fa,$7f,$a7,$fa,$5f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fa,$7f,$a7,$fb,$6f,$b7,$e7
frame343: .byte $2f,$ff,$ff,$f9,$3f,$e1,$4f,$d5,$fb,$7f,$a7,$fb,$7f,$b6,$fc,$5f,$b7,$fa,$8f,$98,$f8,$9f,$98,$f9,$8f,$a8,$f8,$9f,$86,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$a7,$fa,$8f,$98,$f9,$8f,$98,$e7
frame344: .byte $2f,$ff,$ff,$f9,$2f,$e1,$4f,$d6,$fb,$7f,$98,$f9,$9f,$a7,$fb,$6f,$c6,$fa,$7f,$a7,$f9,$9f,$89,$f8,$9f,$89,$f9,$8f,$98,$f9,$8f,$98,$f9,$7f,$a7,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$e7
frame345: .byte $33,$ff,$ff,$f9,$3f,$d4,$fd,$6f,$b7,$f9,$8f,$99,$f8,$9f,$a8,$fa,$7f,$b6,$fa,$8f,$98,$f8,$af,$7a,$f7,$af,$7b,$f6,$af,$7a,$f7,$af,$5c,$f4,$df,$33,$28,$f3,$24,$8f,$23,$47,$f4,$24,$7f,$98,$f9,$8f,$98,$f9,$8e,$71
frame346: .byte $36,$ff,$fe,$c1,$fe,$23,$fc,$5f,$c6,$fb,$7f,$99,$f8,$9f,$98,$fa,$8f,$a7,$fb,$6f,$a7,$fa,$8f,$89,$f8,$af,$7a,$f7,$af,$7a,$f6,$bf,$2e,$2f,$15,$1a,$ee,$44,$59,$ee,$43,$68,$ee,$43,$78,$f9,$7f,$a7,$fa,$7f,$98,$f9,$8f,$98,$e7
frame347: .byte $34,$ff,$fe,$d1,$fe,$22,$fd,$5f,$c6,$fa,$7f,$99,$f8,$9f,$99,$f9,$8f,$a7,$fb,$6f,$a7,$fa,$8f,$89,$f8,$af,$7a,$f6,$bf,$6b,$ee,$4e,$5e,$e3,$e6,$ee,$24,$79,$f8,$8f,$98,$f9,$8f,$97,$fa,$7f,$a7,$f9,$8f,$98,$f9,$8e,$71
frame348: .byte $33,$ff,$fe,$d1,$fe,$23,$fc,$5f,$c6,$fa,$8f,$89,$f8,$9f,$a8,$f9,$8f,$a7,$fb,$6f,$a7,$fa,$8f,$89,$f7,$bf,$6b,$f6,$be,$e2,$71,$ce,$e5,$71,$9f,$89,$f8,$9f,$88,$f9,$8f,$98,$f9,$7f,$a7,$fa,$7f,$a7,$f9,$8f,$98,$e7
frame349: .byte $35,$ff,$fe,$d1,$fe,$23,$fc,$5f,$c6,$fa,$8f,$89,$f8,$9f,$a8,$f9,$8f,$a7,$fb,$6f,$a7,$fa,$8f,$89,$f7,$bf,$6b,$ed,$41,$14,$ce,$e3,$e6,$ee,$56,$29,$f8,$9f,$89,$f8,$8f,$98,$f9,$8f,$98,$f9,$7f,$a7,$fa,$7f,$98,$f9,$8e,$71
frame350: .byte $35,$ff,$fe,$d2,$fe,$13,$fc,$6f,$b6,$fa,$8f,$89,$f8,$af,$98,$f9,$8f,$a7,$fb,$6f,$a7,$fa,$8f,$89,$f7,$be,$d2,$8c,$ee,$16,$3c,$ee,$4e,$5f,$23,$39,$f8,$9f,$89,$f8,$9f,$88,$f9,$8f,$98,$f9,$7f,$a7,$fa,$7f,$a7,$f9,$8e,$71
frame351: .byte $37,$ff,$fe,$d2,$fe,$14,$fb,$6f,$b6,$fa,$8f,$89,$f8,$af,$98,$f9,$8f,$a7,$fb,$6f,$a7,$fa,$8f,$7a,$ee,$11,$ab,$ee,$12,$7c,$ee,$34,$3c,$ee,$47,$1a,$f3,$23,$9f,$89,$f8,$9f,$89,$f8,$8f,$98,$f9,$8f,$97,$fa,$7f,$a7,$fa,$7f,$98,$e7
frame352: .byte $35,$ff,$fe,$d2,$fe,$14,$fb,$6f,$b6,$fa,$8f,$89,$f8,$af,$98,$f9,$8f,$b6,$fb,$6f,$a7,$f9,$9f,$7a,$f7,$ae,$e1,$28,$ce,$e1,$63,$ce,$e4,$e5,$f2,$42,$9f,$89,$f8,$9f,$89,$f8,$9f,$88,$f9,$8f,$98,$f9,$8f,$88,$f9,$8f,$98,$e7
frame353: .byte $37,$ff,$fe,$d3,$fd,$4f,$b6,$fa,$7f,$a8,$f8,$af,$89,$f9,$8f,$a7,$fb,$6f,$b6,$fa,$8f,$89,$ee,$31,$8a,$ee,$32,$6c,$ee,$21,$7c,$ed,$73,$ce,$e4,$e5,$f3,$23,$af,$7a,$f6,$bf,$6a,$f7,$af,$7a,$f7,$af,$79,$f8,$9f,$89,$f8,$9f,$89,$e6
frame354: .byte $40,$ff,$d1,$fe,$13,$f8,$af,$78,$f9,$8f,$99,$f8,$9f,$98,$fa,$7f,$a8,$f9,$8f,$98,$ee,$31,$9a,$ee,$14,$7a,$ee,$14,$6c,$ee,$12,$6d,$ee,$12,$6d,$ec,$73,$de,$e3,$81,$af,$14,$2a,$f7,$af,$6b,$f6,$80,$7f,$58,$3,$f5,$80,$7f,$4a,$12,$f4,$cf,$5b,$f6,$af,$7a,$f6,$ce,$51
frame355: .byte $44,$ff,$fe,$a1,$fe,$25,$42,$f6,$bf,$89,$f8,$8f,$89,$f8,$9f,$89,$f8,$8e,$e4,$27,$8e,$e5,$27,$8e,$e4,$46,$be,$e1,$46,$be,$e1,$46,$ae,$e2,$36,$ce,$e2,$17,$ce,$d6,$4c,$ee,$4e,$4f,$2e,$3f,$40,$8b,$f6,$72,$3f,$57,$33,$f4,$75,$3f,$28,$43,$f1,$95,$2f,$19,$f7,$bf,$6b,$f6,$cf,$4d,$e4
frame356: .byte $43,$ff,$fe,$b2,$fe,$15,$41,$f7,$af,$89,$f8,$8f,$98,$f8,$9f,$89,$f8,$7e,$e5,$28,$7e,$e5,$36,$8e,$e4,$46,$9e,$e3,$45,$be,$e2,$44,$ce,$e3,$25,$de,$e2,$25,$de,$d7,$1e,$1e,$e4,$e5,$f1,$e3,$f3,$e4,$f1,$b2,$7f,$17,$55,$ee,$57,$74,$ee,$38,$f9,$9f,$89,$f7,$bf,$6b,$f6,$cf,$4d,$e4
frame357: .byte $41,$ff,$fe,$b2,$fe,$15,$fc,$af,$97,$f9,$8f,$98,$f8,$9f,$89,$ee,$51,$77,$f2,$17,$7f,$12,$77,$ee,$53,$78,$ee,$34,$6a,$ee,$24,$6b,$ee,$23,$5c,$ee,$22,$6c,$ee,$16,$3c,$ee,$4e,$5f,$1e,$4f,$3a,$29,$ee,$39,$47,$ee,$38,$f9,$8f,$98,$f9,$9f,$7a,$f7,$bf,$6b,$f5,$cf,$5d,$e4
frame358: .byte $3e,$ff,$fe,$b3,$fe,$14,$fc,$af,$97,$f9,$8f,$98,$f8,$9f,$89,$f8,$7f,$a7,$f1,$18,$7f,$12,$69,$ee,$34,$6a,$ee,$25,$5b,$ee,$23,$5c,$ee,$31,$6d,$ed,$62,$de,$e4,$e6,$f1,$e4,$61,$ed,$a2,$9e,$e4,$77,$1f,$28,$f9,$8f,$98,$f9,$9f,$7a,$f7,$af,$6c,$f5,$cf,$5d,$e4
frame359: .byte $42,$ff,$fe,$b3,$fe,$14,$fc,$af,$97,$f9,$8f,$98,$f8,$9f,$89,$ee,$31,$97,$ee,$53,$77,$ee,$53,$77,$ee,$45,$59,$ee,$34,$6a,$ee,$24,$5c,$ee,$22,$6c,$ee,$22,$5d,$ee,$16,$3c,$ee,$4e,$5f,$2c,$3,$f3,$a2,$be,$d9,$63,$ee,$4a,$f8,$9f,$98,$f9,$8f,$8a,$f7,$af,$6c,$f5,$cf,$5d,$e4
frame360: .byte $43,$ff,$fe,$b2,$fe,$15,$fc,$af,$88,$f9,$8f,$89,$f8,$9f,$89,$f8,$7e,$e5,$28,$7e,$e4,$37,$8e,$e4,$37,$9e,$e2,$47,$ae,$e2,$36,$be,$e3,$26,$ce,$e2,$16,$de,$e1,$62,$d7,$2e,$8e,$57,$2e,$bc,$23,$f4,$91,$ae,$e2,$86,$6e,$e3,$8f,$98,$f9,$8f,$89,$f8,$af,$7a,$f6,$cf,$5c,$f5,$ce,$51
frame361: .byte $47,$ff,$fe,$a2,$fe,$24,$42,$f6,$bf,$88,$f9,$8f,$89,$f8,$9f,$89,$ee,$32,$88,$ee,$43,$77,$ee,$44,$68,$ee,$44,$69,$ee,$34,$5b,$ee,$33,$5b,$91,$e6,$16,$d7,$2e,$44,$5d,$73,$e7,$32,$d7,$3e,$8e,$47,$2e,$bc,$14,$f3,$92,$ae,$e1,$97,$9,$ee,$39,$f9,$8f,$98,$f8,$9f,$8a,$f7,$af,$6c,$f5,$cf,$5c,$e5
frame362: .byte $48,$ff,$fe,$91,$fe,$33,$53,$f5,$cf,$6a,$f9,$7f,$98,$f2,$34,$8f,$23,$48,$61,$ed,$43,$85,$2e,$d4,$38,$54,$eb,$34,$84,$5e,$b3,$39,$54,$ee,$3c,$33,$ea,$34,$b5,$1e,$d3,$2c,$42,$ed,$e3,$25,$ec,$e8,$ee,$2e,$6e,$e3,$e,$92,$3f,$3a,$12,$f3,$af,$98,$f9,$8f,$98,$f9,$8f,$8a,$f7,$af,$6c,$f5,$cf,$5c,$e5
frame363: .byte $4a,$ff,$ff,$f7,$35,$3f,$41,$1c,$f3,$e1,$11,$f1,$23,$63,$2e,$e5,$41,$82,$3e,$e4,$41,$82,$4e,$e3,$41,$82,$4e,$e3,$32,$82,$4e,$e4,$c,$82,$3f,$48,$41,$ee,$32,$48,$33,$ee,$3e,$5e,$e4,$e5,$ee,$5e,$4e,$e5,$e3,$f2,$e2,$f2,$11,$cf,$69,$f7,$af,$97,$f9,$8f,$98,$f9,$8f,$98,$f8,$af,$7a,$f6,$cf,$5c,$f5,$ce,$51
frame364: .byte $4a,$e3,$1e,$31,$ee,$33,$a0,$c2,$ee,$34,$a6,$ee,$15,$a7,$ec,$77,$9e,$be,$be,$be,$be,$be,$ae,$de,$8e,$e1,$e9,$ed,$e9,$ed,$e9,$ed,$e4,$14,$ed,$42,$a2,$3e,$e2,$32,$a1,$4e,$e3,$e,$a0,$7e,$e3,$e6,$ee,$4e,$5e,$e4,$e5,$ee,$5e,$3f,$1e,$3f,$4c,$f5,$af,$7a,$f6,$bf,$8a,$f7,$8f,$98,$f9,$8f,$89,$f8,$af,$6b,$e6
frame365: .byte $59,$70,$84,$20,$e2,$41,$40,$81,$e9,$c4,$c,$e,$3e,$8b,$90,$e3,$e7,$c9,$e,$3e,$6c,$98,$e6,$c8,$9e,$6d,$79,$e5,$e1,$4c,$e5,$ee,$4e,$5e,$e5,$e4,$ee,$5e,$5e,$e3,$e6,$ee,$3e,$6e,$e2,$e7,$ee,$2e,$8e,$62,$7e,$86,$1b,$26,$e9,$52,$b2,$5e,$c3,$2b,$24,$ec,$51,$b2,$4e,$c5,$1e,$4e,$de,$8e,$e1,$e8,$ee,$2e,$7e,$e2,$e6,$ee,$4e,$5f,$1e,$3f,$1d,$f4,$df,$5c,$f5,$cf,$5c,$e5
frame366: .byte $5a,$86,$83,$6a,$e2,$77,$27,$ae,$2a,$42,$6b,$14,$aa,$42,$5e,$47,$d4,$15,$e4,$8e,$10,$14,$e5,$5e,$40,$14,$e5,$5e,$75,$e5,$5e,$75,$e5,$5e,$84,$e2,$12,$5e,$94,$da,$e4,$21,$5d,$ae,$48,$e1,$ae,$46,$e3,$9f,$8a,$f7,$af,$79,$f7,$af,$6c,$f4,$e1,$f4,$e1,$a1,$ea,$e2,$64,$e9,$e4,$63,$c1,$8e,$66,$2c,$16,$e8,$61,$d1,$6e,$86,$1d,$16,$e8,$ed,$ea,$ec,$eb,$ea,$ec,$ea,$ec,$ea,$d1
frame367: .byte $56,$24,$2b,$21,$7e,$17,$42,$e1,$6e,$36,$42,$e2,$5e,$44,$e9,$5e,$44,$e8,$6e,$44,$e8,$6e,$44,$e9,$5e,$35,$e9,$5e,$44,$e9,$5e,$53,$e9,$3e,$73,$e9,$3e,$74,$e7,$4e,$74,$e7,$5e,$65,$e6,$2e,$94,$e7,$1e,$a4,$fd,$4f,$d4,$fc,$5e,$a2,$e6,$4e,$93,$e6,$5f,$b6,$fb,$7f,$99,$f8,$bf,$5c,$ea,$1a,$e2,$24,$21,$d2,$8e,$cd,$23,$ee,$4d,$f4,$de,$91,$cd,$e8,$68,$d9,$45
frame368: .byte $28,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$b1,$fe,$31,$ff,$ff,$e7,$1f,$e3,$2f,$e2,$2f,$e2,$2f,$e2,$2e,$a1,$e9,$2e,$83,$e8,$3f,$d5,$fb,$8f,$93
frame369: .byte $1a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3
frame370: .byte $1b,$1f,$71,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$81
frame371: .byte $1a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3
frame372: .byte $1a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3
frame373: .byte $28,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e7,$1f,$e2,$3f,$e1,$4f,$d4,$fd,$4f,$d4,$fe,$13,$fe,$13,$ff,$ff,$ff,$81,$fe,$23,$fe,$13,$fe,$22,$ff,$e1,$5f,$b1
frame374: .byte $5f,$e5,$ee,$4e,$5e,$e4,$e5,$b1,$e5,$33,$ca,$2e,$53,$69,$a1,$e6,$45,$9a,$1e,$64,$68,$a1,$e6,$45,$9e,$e4,$55,$8e,$e4,$56,$8e,$e3,$57,$7e,$e3,$67,$8e,$e1,$58,$9e,$d5,$89,$ed,$58,$ae,$c6,$7a,$ec,$67,$ae,$c6,$89,$ec,$51,$17,$9e,$c4,$12,$79,$ec,$68,$8e,$d6,$96,$ee,$15,$a6,$ee,$14,$b5,$ee,$23,$d4,$ee,$23,$d4,$ee,$22,$e1,$4e,$e2,$3d,$5e,$e1,$5a,$6e,$e1,$84,$ae,$d8,$9,$ae,$d8,$9,$be,$c1
frame375: .byte $64,$e8,$ea,$ec,$ea,$ec,$ea,$81,$e3,$ea,$1,$26,$de,$e1,$26,$ce,$e2,$45,$be,$e2,$45,$9e,$e4,$45,$8e,$e5,$47,$6e,$e5,$39,$6e,$e4,$3a,$5e,$e4,$2b,$6e,$e3,$1c,$7e,$e2,$16,$15,$7f,$10,$65,$7f,$10,$45,$7e,$e2,$10,$c1,$25,$7e,$e2,$2,$c,$66,$ee,$20,$13,$75,$ee,$37,$75,$ee,$36,$94,$ee,$35,$a4,$ee,$35,$b3,$ee,$34,$c3,$ee,$33,$d4,$ee,$23,$d5,$ee,$12,$e1,$6e,$d5,$a9,$eb,$84,$e1,$e9,$81,$e5,$e8,$81,$11,$e3,$e8
frame376: .byte $64,$e5,$e3,$1d,$e6,$ee,$3e,$7e,$e2,$e7,$ee,$20,$32,$1d,$ee,$22,$6c,$ee,$23,$6b,$ee,$23,$6c,$ee,$13,$6c,$ee,$14,$6b,$ee,$14,$7a,$ee,$13,$a8,$ee,$13,$a7,$ee,$22,$b5,$ee,$41,$c5,$ee,$41,$72,$35,$f5,$16,$5f,$21,$c,$54,$f1,$30,$c6,$3e,$e5,$1,$37,$3e,$e5,$77,$4e,$e4,$69,$3e,$e4,$69,$3e,$e4,$5a,$4e,$e3,$4c,$3e,$e3,$4c,$3e,$e3,$3d,$3e,$e3,$3d,$3e,$e3,$5b,$6e,$d8,$41,$19,$ec,$81,$11,$ae,$e1,$81,$11,$be,$d1
frame377: .byte $62,$e1,$f3,$e1,$f3,$e1,$f3,$e2,$f2,$1,$bf,$22,$67,$f2,$26,$8f,$13,$67,$f1,$36,$8e,$e5,$46,$8e,$e4,$47,$8e,$e3,$48,$8e,$e2,$3a,$8e,$e1,$2b,$8e,$e1,$2b,$8e,$e1,$27,$7,$7e,$e2,$24,$25,$7e,$e2,$24,$25,$8e,$e1,$23,$35,$8e,$e1,$23,$27,$7e,$e1,$1,$37,$7e,$e1,$69,$6e,$e1,$5a,$6e,$e1,$5a,$6e,$e1,$4c,$3e,$e3,$3d,$3e,$e3,$3d,$2e,$e4,$3d,$2e,$e4,$3d,$3e,$e3,$69,$4e,$e3,$81,$11,$8e,$e3,$81,$11,$9e,$e2
frame378: .byte $51,$e4,$ee,$5e,$5e,$e4,$e5,$ee,$4e,$4e,$e5,$32,$ce,$e5,$26,$8f,$12,$68,$f1,$45,$6f,$24,$55,$f3,$45,$4f,$44,$72,$f4,$4f,$d3,$fe,$12,$fe,$22,$fe,$21,$c1,$f3,$16,$15,$1f,$31,$52,$e1,$1e,$c1,$52,$61,$62,$ec,$6,$21,$71,$f2,$41,$2f,$a6,$fb,$6f,$b5,$fc,$5f,$c4,$fd,$3f,$e1,$3d,$2e,$e4,$3d,$3e,$e3,$5a,$5e,$e2,$84,$ae,$d8,$1e,$1e,$c1
frame379: .byte $60,$e7,$ee,$2e,$6e,$e2,$e7,$ee,$2e,$7e,$e3,$41,$e1,$ee,$33,$5b,$ee,$33,$6a,$ee,$34,$5a,$ee,$34,$5a,$ee,$34,$5a,$ee,$34,$78,$ee,$34,$87,$ee,$33,$a6,$ee,$33,$a7,$ee,$22,$b7,$ee,$22,$b8,$ee,$12,$51,$58,$ee,$11,$52,$58,$ee,$11,$52,$5a,$ec,$20,$92,$6a,$eb,$77,$ae,$b7,$7b,$e9,$79,$be,$86,$ac,$e7,$6a,$ce,$75,$cc,$e7,$3d,$de,$63,$de,$1e,$53,$de,$1e,$55,$ae,$2e,$58,$4e,$6e,$48,$9,$e7,$91,$61
frame380: .byte $57,$ff,$ff,$ff,$11,$82,$f2,$48,$6e,$e3,$59,$5e,$e3,$59,$6e,$e2,$59,$5e,$e2,$6a,$4e,$e1,$5c,$6e,$b6,$b8,$e9,$7b,$9e,$87,$aa,$e8,$7a,$ae,$78,$9b,$e8,$88,$51,$5e,$86,$11,$85,$15,$e9,$78,$42,$5e,$98,$70,$d2,$6e,$7a,$91,$17,$e7,$ab,$7e,$7b,$99,$e6,$c8,$9e,$6d,$6a,$e6,$d5,$ce,$5d,$5c,$e5,$d4,$de,$5d,$4d,$e6,$a8,$be,$76,$11,$c4,$eb,$9,$e3,$9,$eb,$9,$81
frame381: .byte $5d,$ff,$ff,$ff,$a2,$f1,$4a,$5e,$e3,$4b,$4e,$e3,$5a,$5e,$e2,$5a,$5e,$e2,$5a,$5e,$e1,$6a,$6e,$c8,$88,$ea,$51,$47,$9e,$86,$24,$5a,$e9,$61,$53,$be,$9d,$2b,$e9,$41,$51,$c,$51,$5e,$85,$15,$50,$e1,$24,$e8,$97,$33,$5e,$88,$81,$56,$e7,$9a,$11,$7e,$7a,$b7,$e7,$b9,$9e,$5d,$89,$e5,$d7,$ae,$5e,$15,$ce,$4e,$15,$ce,$4e,$14,$de,$4d,$5d,$e5,$a9,$be,$65,$e2,$7e,$91,$11,$e4,$9,$eb,$11,$19
frame382: .byte $5e,$ff,$ff,$ff,$d2,$ee,$24,$d6,$ec,$5d,$5e,$c5,$d5,$ec,$5d,$5e,$c5,$d5,$eb,$6c,$7e,$98,$a9,$e7,$b7,$be,$5d,$5c,$e6,$d4,$ce,$6e,$12,$90,$7e,$60,$e1,$14,$3,$24,$3,$23,$e6,$52,$36,$32,$e,$4e,$57,$7,$61,$41,$17,$e4,$9d,$11,$7e,$4a,$b1,$27,$e4,$ab,$12,$7e,$4a,$d9,$e2,$cb,$ae,$2d,$9b,$e2,$d8,$ce,$2d,$7d,$e2,$d6,$e1,$e2,$d7,$de,$2a,$da,$e3,$8e,$35,$11,$e7,$b,$e4,$9,$ea,$9,$81
frame383: .byte $64,$ff,$ea,$1e,$91,$ea,$1e,$a2,$e8,$2e,$a3,$e5,$4e,$a4,$e3,$6e,$86,$e3,$6e,$75,$e4,$6e,$66,$e5,$6e,$46,$e6,$7e,$28,$e4,$e,$6b,$61,$4e,$24,$25,$a6,$24,$e1,$62,$58,$62,$6d,$72,$48,$53,$6d,$41,$c,$56,$53,$21,$4e,$10,$e2,$34,$64,$42,$14,$e1,$64,$2e,$27,$e1,$6e,$96,$d8,$e7,$7d,$9e,$67,$e1,$9e,$57,$e1,$be,$28,$e1,$cd,$ad,$db,$bd,$da,$cd,$d9,$dd,$e1,$7e,$1d,$e1,$6e,$2d,$d8,$e1,$db,$db,$e1,$9e,$29,$e3,$4a
frame384: .byte $5b,$ff,$fe,$a1,$fe,$31,$71,$f7,$18,$1f,$53,$82,$f1,$78,$5e,$e1,$79,$7e,$b8,$89,$e8,$b6,$be,$6c,$6e,$77,$e2,$6e,$82,$e4,$af,$6c,$f4,$e1,$f3,$e1,$ee,$21,$67,$14,$65,$61,$84,$64,$9,$46,$c4,$86,$44,$46,$eb,$63,$c,$23,$6e,$bb,$2b,$eb,$70,$30,$32,$8e,$a6,$23,$30,$c7,$ea,$a4,$be,$98,$a8,$e8,$7e,$26,$e6,$7e,$3a,$e1,$8e,$3c,$c9,$e2,$da,$ae,$2e,$27,$be,$2e,$34,$de,$2e,$31
frame385: .byte $5b,$ff,$ff,$fa,$1f,$e2,$16,$1f,$73,$61,$f6,$56,$1f,$27,$76,$ee,$18,$68,$ec,$96,$9e,$ba,$4a,$ea,$b4,$be,$9a,$6a,$e9,$8a,$9e,$79,$a9,$e6,$81,$1a,$11,$9e,$2c,$9d,$dd,$42,$3e,$1b,$e1,$42,$3e,$38,$e2,$34,$2e,$47,$fb,$5e,$50,$32,$c2,$64,$e3,$34,$2b,$52,$43,$3b,$7,$2e,$2e,$2e,$24,$e2,$e1,$e,$98,$dd,$e,$7b,$21,$ae,$38,$e1,$be,$28,$e1,$cd,$9e,$1d,$c9,$e1,$e1,$ab,$de,$22
frame386: .byte $55,$ff,$ff,$fa,$1f,$e2,$16,$1f,$73,$61,$f6,$47,$1f,$27,$76,$ee,$17,$87,$ec,$96,$9e,$ba,$59,$eb,$a4,$ae,$aa,$6a,$e9,$8a,$8e,$96,$e1,$6e,$96,$e1,$6e,$97,$c7,$e8,$85,$25,$7e,$89,$42,$49,$e7,$93,$43,$9e,$79,$18,$19,$e7,$b0,$32,$ae,$98,$34,$38,$e9,$c2,$ce,$9a,$6a,$e9,$8a,$8e,$96,$e1,$7e,$77,$e1,$ae,$38,$e1,$cd,$9e,$1d,$c9,$e1,$e1,$aa,$e1,$e2,$21
frame387: .byte $57,$ff,$fe,$b1,$fe,$22,$fb,$c,$18,$1f,$44,$50,$bf,$36,$51,$3,$ee,$47,$67,$ee,$18,$68,$ec,$96,$9e,$ba,$4a,$ea,$b4,$be,$9a,$6a,$e9,$8a,$8e,$98,$a8,$e8,$8c,$8e,$78,$c8,$e7,$94,$24,$9e,$6a,$42,$4a,$e5,$a3,$43,$ae,$5e,$e4,$e5,$c0,$32,$ce,$5a,$3,$3,$2a,$e4,$e2,$2e,$2e,$3d,$6d,$e3,$ba,$be,$39,$e1,$9e,$48,$e1,$ae,$38,$e1,$ce,$19,$dd,$ca,$dd,$ca,$de,$13
frame388: .byte $56,$e5,$1f,$d1,$fe,$33,$fe,$13,$fd,$6e,$14,$ea,$8d,$2e,$e1,$48,$10,$30,$1e,$d6,$87,$ed,$86,$8e,$c9,$69,$eb,$a4,$ae,$b9,$69,$eb,$96,$9e,$b9,$69,$eb,$88,$8e,$b7,$a8,$e9,$84,$24,$8e,$99,$32,$39,$e9,$93,$23,$9e,$8e,$e2,$e7,$ee,$2e,$7b,$14,$1b,$e7,$d2,$e1,$e6,$c4,$de,$5c,$6c,$e5,$aa,$9e,$79,$b8,$e7,$8c,$ae,$58,$cc,$e3,$8c,$de,$1a,$bd,$e1,$ab,$e1,$41
frame389: .byte $55,$e1,$9,$fd,$1f,$e2,$6f,$d2,$fe,$25,$e1,$4e,$b5,$e3,$1e,$e1,$48,$10,$30,$1e,$d6,$77,$ee,$27,$68,$ed,$94,$9e,$d9,$49,$ed,$95,$8e,$d8,$68,$ed,$86,$8e,$d8,$68,$ed,$86,$8e,$d8,$3,$28,$ec,$90,$32,$9e,$ba,$6,$ae,$be,$be,$be,$be,$bb,$2b,$eb,$b2,$be,$ba,$4a,$eb,$88,$8e,$b8,$88,$eb,$79,$9e,$98,$ab,$e6,$8b,$be,$49,$ad,$e3,$9a,$e1,$e1,$b9,$e1,$51
frame390: .byte $5a,$e4,$1f,$d0,$9f,$d2,$12,$fd,$3f,$e1,$4e,$24,$eb,$57,$18,$1e,$e1,$4e,$31,$ee,$15,$76,$11,$ee,$17,$67,$ee,$28,$48,$ee,$19,$49,$ed,$94,$9e,$d9,$49,$ed,$94,$9e,$e1,$84,$8e,$e2,$84,$8e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e1,$e9,$ed,$a2,$ae,$da,$2a,$ee,$18,$48,$ee,$27,$67,$ee,$19,$49,$ec,$71,$16,$11,$7e,$b7,$aa,$e7,$8a,$ce,$49,$ad,$e3,$a9,$e1,$e2,$a9,$e1,$51
frame391: .byte $51,$d0,$9f,$d0,$9f,$c6,$fe,$12,$fe,$25,$e2,$4e,$96,$e4,$1e,$c5,$81,$81,$ec,$67,$71,$1e,$d7,$68,$ed,$94,$9e,$d9,$49,$ed,$94,$9e,$d9,$49,$ed,$94,$9e,$d9,$49,$ed,$94,$9e,$d9,$6,$9e,$de,$9e,$de,$9e,$de,$9e,$de,$9e,$de,$9e,$da,$2a,$ed,$a2,$ae,$e1,$84,$8e,$e1,$94,$8e,$e1,$94,$9e,$ca,$4a,$ea,$8a,$9e,$88,$ac,$e4,$9a,$de,$39,$ae,$15
frame392: .byte $4e,$e3,$4f,$c4,$fb,$af,$97,$fa,$6f,$a8,$f8,$ae,$51,$11,$e3,$c7,$19,$1e,$5d,$61,$ee,$2d,$66,$ea,$d5,$8e,$8d,$5a,$e7,$c6,$ae,$7c,$5b,$e6,$c6,$be,$6c,$5b,$e7,$b5,$ce,$7d,$2d,$e6,$e2,$1c,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$1e,$8e,$e1,$e8,$ed,$e9,$ed,$e9,$a2,$e1,$e9,$a2,$de,$a9,$3d,$ea,$85,$ce,$a8,$6b,$ee,$32,$6a,$f7,$ae,$21
frame393: .byte $48,$e3,$df,$2e,$1f,$2e,$1f,$2e,$3f,$1e,$4e,$e4,$e5,$ee,$3e,$7e,$e1,$e8,$ed,$ea,$ec,$ea,$eb,$eb,$ea,$eb,$eb,$ea,$eb,$e6,$c2,$e2,$e2,$e3,$6a,$e3,$e1,$99,$e3,$cb,$8e,$4a,$d8,$e8,$3e,$38,$c1,$ee,$17,$f9,$7f,$a8,$f8,$af,$6d,$f3,$e3,$ee,$5e,$6e,$e2,$e8,$ed,$ed,$e8,$ee,$1e,$7e,$e3,$e5,$f1,$e2,$e3
frame394: .byte $4e,$e1,$e9,$eb,$ec,$e8,$ee,$2e,$6e,$e3,$e4,$ee,$4e,$4e,$e5,$e2,$f2,$e1,$f3,$df,$4b,$e2,$1e,$9a,$e1,$2e,$9a,$d1,$a1,$db,$e7,$5b,$ce,$75,$bd,$e6,$6a,$e1,$e5,$6a,$e2,$e4,$69,$e4,$e3,$68,$e5,$e3,$76,$e6,$e3,$75,$e8,$e3,$f1,$e4,$f1,$e4,$d1,$e4,$e6,$98,$cf,$5d,$f4,$df,$3e,$2f,$2e,$3e,$e4,$e5,$ee,$3e,$7e,$de,$ae,$9e,$11
frame395: .byte $4c,$6e,$e5,$33,$bf,$6b,$f6,$bf,$6b,$f6,$ce,$71,$e2,$de,$62,$e1,$ce,$91,$dc,$f6,$bf,$6a,$f7,$af,$79,$e1,$5e,$79,$c8,$e6,$9b,$ae,$58,$cd,$da,$be,$1d,$ab,$41,$9c,$bb,$35,$5d,$bb,$37,$3c,$cb,$3e,$8d,$b3,$e8,$db,$4e,$6e,$1c,$3e,$5e,$3b,$4e,$2e,$5c,$5b,$e7,$d7,$5e,$ae,$1f,$3e,$3f,$1e,$7e,$e2,$e9,$ee,$2e,$e1,$e1
frame396: .byte $64,$e5,$e3,$ee,$3e,$7e,$de,$be,$9e,$e1,$e7,$ee,$3e,$4f,$1e,$2d,$4e,$4d,$ab,$e3,$b8,$48,$2e,$2a,$83,$b2,$e2,$88,$2e,$12,$e1,$1,$47,$2e,$32,$e4,$38,$2e,$32,$e4,$37,$28,$54,$2e,$34,$72,$86,$32,$e3,$38,$27,$ce,$24,$72,$aa,$e2,$38,$2b,$8e,$23,$92,$c6,$e3,$39,$3d,$2e,$45,$92,$f1,$68,$2e,$e5,$87,$3e,$e4,$b4,$3e,$e3,$d4,$3e,$e1,$e2,$34,$ed,$e2,$44,$ea,$e5,$35,$e8,$e7,$36,$e3,$eb,$37,$be,$e2,$3f,$e2,$4e,$e5
frame397: .byte $39,$7e,$be,$ae,$de,$8e,$e2,$e6,$ee,$4e,$4e,$e5,$e3,$f2,$df,$4d,$f5,$cf,$5c,$f6,$bf,$6c,$f5,$cf,$5c,$f5,$cf,$5c,$f7,$af,$7b,$f5,$cf,$4e,$1f,$2e,$2f,$1e,$4e,$e4,$e6,$ee,$2e,$8e,$de,$ae,$be,$ce,$9e,$de,$7f,$1e,$1f,$76,$f4,$1f,$ff,$fa
frame398: .byte $3b,$1e,$be,$ae,$ce,$ae,$de,$9e,$de,$9e,$de,$9e,$de,$9e,$de,$9e,$de,$9e,$de,$7e,$e2,$e8,$ed,$e9,$ed,$ea,$eb,$eb,$eb,$eb,$ea,$ec,$e9,$ed,$e8,$ee,$1e,$7e,$e2,$e5,$ee,$5e,$2f,$5a,$ff,$ff,$ff,$ff,$ff,$fe,$e2,$1f,$e3,$1f,$e2,$2f,$e2,$2f,$e2,$21
frame399: .byte $39,$1e,$2f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3d,$ee,$16,$2c,$ee,$36,$1b,$ee,$4e,$4f,$1d,$f6,$4f,$d4,$fc,$5f,$c5,$fb,$6f,$c5,$fc,$5f,$c5,$fc,$5f,$c5,$fc,$5f,$c5,$fc,$5f,$b6,$fb,$6f,$b6,$fb,$6f,$a7,$fa,$7f,$a7
frame400: .byte $3e,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1f,$3d,$ea,$66,$ce,$c6,$5b,$ed,$74,$9e,$e3,$73,$6f,$36,$fb,$6f,$a8,$f8,$af,$76,$7,$f8,$50,$3f,$86,$21,$f8,$62,$1f,$85,$fc,$5f,$b7,$fa,$7f,$b7,$fa,$7f,$a8,$f8,$af,$7a,$f7,$af,$7a,$f7,$a1
frame401: .byte $40,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1f,$3d,$e7,$69,$ce,$96,$8b,$ea,$68,$9e,$d6,$76,$ee,$55,$fb,$6f,$b7,$f9,$9f,$89,$f8,$af,$85,$14,$f6,$40,$63,$f6,$73,$2f,$48,$f8,$21,$7f,$71,$27,$f9,$8f,$97,$fa,$8f,$8a,$f7,$af,$7b,$f6,$cf,$5c,$21
frame402: .byte $3b,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1e,$45,$cd,$e6,$6a,$ce,$76,$ab,$e9,$69,$9e,$c5,$96,$ee,$35,$fb,$6f,$b6,$fa,$7f,$a7,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fa,$7f,$a7,$fa,$8f,$98,$f8,$af,$7a,$f7,$bf,$6b,$f5,$c5
frame403: .byte $3d,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1e,$35,$dd,$e5,$5c,$ce,$66,$bb,$e8,$6a,$9e,$b5,$a6,$ee,$25,$fb,$6f,$b6,$fa,$8f,$98,$fa,$7f,$a3,$3,$fa,$30,$3f,$a7,$fa,$7f,$a6,$fa,$7f,$a7,$fa,$7f,$a8,$f8,$af,$7a,$f7,$bf,$6b,$f6,$c5
frame404: .byte $42,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1e,$34,$e1,$de,$45,$dc,$e5,$6c,$be,$66,$c9,$e9,$5c,$6e,$d5,$fc,$5f,$b7,$f9,$8f,$95,$7,$f9,$32,$3f,$93,$23,$f9,$33,$2f,$94,$23,$f8,$50,$3f,$85,$3,$f7,$7f,$a7,$fa,$7f,$a8,$f8,$af,$7a,$f7,$bf,$6b,$f6,$c7
frame405: .byte $3d,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1e,$21,$e5,$e1,$e3,$3e,$2d,$e3,$6d,$ce,$46,$db,$e6,$5d,$9e,$95,$c6,$ec,$5f,$c5,$fb,$6f,$b6,$fa,$8f,$a7,$fa,$6f,$b7,$fa,$7f,$a7,$fa,$7f,$a6,$fa,$7f,$a7,$fa,$8f,$89,$f8,$af,$6b,$f6,$cf,$5c,$91
frame406: .byte $40,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1e,$21,$e5,$e1,$e2,$4e,$2d,$e3,$5e,$1c,$e4,$6d,$be,$65,$d9,$e8,$5d,$6e,$c5,$fb,$6f,$b6,$fa,$7f,$a7,$fb,$6f,$a7,$f9,$11,$6f,$70,$86,$f7,$8,$6f,$b7,$f9,$8f,$97,$fa,$7f,$a8,$f8,$9f,$8a,$f7,$af,$6c,$f5,$c9
frame407: .byte $43,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1e,$11,$e6,$e1,$e2,$3e,$3d,$e2,$6e,$1c,$e3,$6e,$1b,$e5,$5e,$19,$e8,$4e,$16,$eb,$5f,$b6,$f8,$9f,$23,$3a,$f5,$c,$8f,$a8,$fa,$e,$3f,$a0,$e3,$fa,$7f,$a7,$f9,$8f,$98,$f9,$7f,$a7,$f9,$9f,$89,$f8,$af,$6b,$f6,$cf,$5c,$91
frame408: .byte $40,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1e,$11,$e6,$e1,$e1,$4e,$3d,$e2,$5e,$2c,$e3,$5e,$2b,$e4,$6e,$19,$e7,$5e,$16,$b2,$b4,$f3,$c,$af,$6c,$fa,$8f,$98,$fa,$7f,$b7,$fa,$6f,$b6,$fa,$8f,$98,$f9,$8f,$97,$f9,$8f,$98,$f9,$9f,$7a,$f7,$bf,$6b,$f6,$c9
frame409: .byte $44,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1e,$11,$e6,$e1,$e1,$3e,$4d,$e2,$5e,$2c,$e3,$5e,$2b,$e4,$5e,$29,$e7,$4e,$26,$b2,$a5,$f3,$e,$af,$7b,$fa,$8f,$98,$fa,$7f,$a5,$11,$fb,$41,$1f,$a5,$11,$fa,$51,$2f,$98,$f9,$8f,$97,$f9,$8f,$98,$f9,$9f,$7a,$f7,$bf,$6b,$f6,$c9
frame410: .byte $43,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1e,$11,$e6,$e1,$e1,$3e,$4d,$e1,$6e,$2c,$e2,$6e,$2b,$e4,$5e,$29,$e7,$4e,$26,$b2,$a5,$f3,$e1,$f8,$af,$a7,$fa,$7f,$b7,$fa,$7f,$a5,$11,$fa,$51,$1f,$a5,$11,$fa,$8f,$98,$f8,$8f,$98,$f9,$8f,$99,$f7,$af,$7b,$f6,$bf,$5c,$a1
frame411: .byte $42,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1d,$1e,$7e,$1e,$13,$e4,$de,$16,$e2,$ce,$26,$e2,$be,$45,$e2,$9e,$74,$e2,$6b,$2a,$5f,$3e,$1f,$7a,$fb,$7f,$a7,$fb,$7f,$a7,$fa,$51,$1f,$a5,$11,$fa,$51,$1f,$a8,$f9,$8f,$88,$f9,$8f,$98,$f8,$af,$7a,$f7,$bf,$6b,$f5,$ca
frame412: .byte $42,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1e,$13,$e4,$de,$25,$e2,$ce,$26,$e2,$be,$45,$e2,$9e,$74,$e2,$6a,$2b,$5f,$24,$1a,$f7,$af,$b7,$fa,$7f,$b7,$fa,$7f,$a5,$11,$fa,$51,$1f,$a5,$11,$fa,$8f,$98,$f8,$8f,$98,$f9,$8f,$8a,$f7,$af,$7b,$f6,$bf,$5c,$a1
frame413: .byte $3e,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1e,$14,$e3,$de,$25,$e2,$ce,$35,$e2,$be,$45,$e2,$9e,$75,$e1,$6e,$b4,$f1,$51,$af,$7b,$fa,$7f,$a7,$fb,$7f,$a7,$fb,$6f,$a7,$fa,$7f,$a7,$fa,$8f,$97,$f9,$8f,$98,$f9,$9f,$7a,$f7,$bf,$6b,$f5,$ca
frame414: .byte $3f,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1e,$14,$e3,$de,$25,$e2,$ce,$36,$e1,$be,$55,$e1,$9e,$75,$e1,$6e,$b5,$ee,$43,$5a,$f4,$df,$a7,$fa,$7f,$b7,$fb,$6f,$b6,$fb,$6f,$a7,$fa,$7f,$a7,$fa,$7f,$98,$f9,$8f,$99,$f7,$af,$7b,$f6,$bf,$6c,$91
frame415: .byte $40,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1d,$5e,$3d,$e2,$5e,$2c,$e3,$6e,$1b,$e5,$5e,$19,$e7,$5e,$16,$eb,$5f,$89,$ee,$42,$1e,$2f,$81,$17,$fa,$7f,$b6,$fc,$6f,$b6,$fb,$6f,$a7,$fa,$7f,$a7,$fa,$7f,$a7,$f9,$8f,$99,$f7,$af,$7b,$f6,$bf,$6c,$91
frame416: .byte $3e,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1d,$5e,$3d,$e2,$5e,$2c,$e3,$6e,$1b,$e4,$7d,$9e,$85,$d6,$ec,$4f,$b6,$f9,$8f,$23,$3a,$f5,$23,$7f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$5f,$b7,$fa,$7f,$a7,$fa,$8f,$89,$f8,$af,$6b,$f6,$cf,$5c,$91
frame417: .byte $3c,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1e,$25,$e1,$de,$45,$dc,$e5,$6c,$be,$66,$c9,$e9,$5c,$6e,$d4,$fc,$5f,$b6,$fa,$8f,$98,$f5,$42,$6f,$b6,$fb,$6f,$b5,$fc,$5f,$c5,$fb,$7f,$a7,$fa,$7f,$99,$f8,$9f,$7a,$f7,$bf,$6b,$f5,$c9
frame418: .byte $3c,$1e,$1f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1e,$b3,$7d,$ea,$57,$ce,$a6,$7b,$ea,$68,$9e,$c6,$86,$ee,$15,$fc,$6f,$b7,$fa,$7f,$a8,$f9,$8f,$97,$fb,$6f,$b6,$fb,$6f,$b7,$fa,$7f,$98,$f8,$9f,$8a,$f6,$bf,$5c,$f5,$df,$3e,$1f,$3e,$15
frame419: .byte $40,$1e,$2f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$1e,$c5,$4d,$ec,$55,$ce,$c6,$5a,$ed,$67,$6e,$e3,$5f,$c5,$fb,$7f,$a8,$f9,$8f,$99,$f8,$9f,$82,$15,$f9,$21,$4f,$a2,$15,$f9,$11,$7f,$a7,$fa,$8f,$89,$f8,$af,$6c,$f5,$df,$3e,$1f,$2e,$2f,$2e,$21
frame420: .byte $40,$1e,$6e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e6,$ee,$3e,$6e,$e3,$e5,$ee,$4e,$4e,$e3,$e5,$ee,$3e,$5e,$e4,$32,$ce,$e4,$44,$7f,$24,$fc,$5f,$c5,$fc,$5f,$c5,$fc,$5f,$c5,$fc,$5f,$b0,$e2,$fb,$6f,$b6,$fd,$4f,$d4,$fd,$4f,$c5,$fb,$6f,$b6,$fa,$7f,$a7,$fa,$71
frame421: .byte $2a,$3e,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$ce,$9e,$de,$9e,$e1,$e7,$ee,$3e,$5e,$e5,$e3,$f3,$cf,$86,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$c1
frame422: .byte $2a,$ce,$be,$be,$ce,$ae,$ce,$ae,$be,$be,$be,$be,$be,$ce,$9e,$e1,$e8,$ee,$1e,$7e,$e3,$e5,$ee,$5e,$3f,$3c,$f8,$6f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f3
frame423: .byte $2a,$e7,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$eb,$ec,$ea,$ec,$ea,$ed,$e8,$ee,$1e,$7e,$e3,$e5,$f1,$e2,$f3,$cf,$87,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$c1
frame424: .byte $3f,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e4,$e5,$ee,$4e,$5e,$e5,$e4,$ee,$5e,$47,$1e,$be,$35,$5e,$be,$15,$5e,$cc,$66,$ee,$17,$95,$fd,$4f,$d4,$fd,$5f,$b6,$fb,$6f,$b6,$fc,$5f,$c5,$fc,$5f,$b7,$fa,$7f,$a7,$fa,$7f,$a7,$fa,$6f,$b6,$fb,$7f,$a7,$f4
frame425: .byte $37,$f5,$cf,$5c,$f5,$cf,$5c,$f6,$bf,$6b,$f7,$af,$7a,$f8,$9e,$51,$e8,$8e,$34,$e8,$7e,$35,$e9,$5e,$35,$eb,$3e,$45,$fd,$4f,$d4,$fc,$5f,$c5,$fc,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b7,$fa,$7f,$a7,$fa,$6f,$b6,$fb,$7f,$a7,$eb
frame426: .byte $36,$f8,$9f,$89,$f8,$9f,$89,$f8,$9f,$89,$f9,$8f,$a7,$fa,$7e,$91,$e6,$6e,$75,$e5,$5e,$75,$e7,$3e,$76,$fc,$5f,$d4,$fd,$4f,$d5,$fb,$6f,$b6,$fb,$6f,$c5,$fc,$5f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$7f,$a7,$fa,$7e,$71
frame427: .byte $36,$f8,$9f,$89,$f8,$9f,$89,$f8,$9f,$98,$f9,$8f,$a7,$fa,$7e,$a1,$e5,$6e,$85,$e5,$4e,$85,$e6,$3e,$86,$fc,$5f,$d4,$fd,$4f,$c5,$fc,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b7,$fa,$7e,$61
frame428: .byte $36,$f8,$9f,$89,$f8,$9f,$89,$f8,$9f,$98,$f9,$8f,$a7,$fa,$7e,$a1,$e5,$6e,$85,$e5,$4e,$85,$e6,$3e,$86,$fc,$5f,$d4,$fd,$4f,$c5,$fc,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$7f,$a7,$fa,$7e,$61
frame429: .byte $36,$f8,$9f,$89,$f8,$9f,$89,$f8,$9f,$98,$f9,$8f,$a7,$fa,$7e,$a1,$e5,$6e,$85,$e5,$4e,$85,$e6,$3e,$86,$fc,$5f,$d4,$fd,$4f,$c6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$7f,$a7,$fa,$7e,$61
frame430: .byte $34,$f9,$8f,$98,$f9,$8f,$98,$fa,$7f,$a7,$fb,$6f,$b6,$fc,$5e,$94,$e5,$4e,$85,$e7,$2e,$86,$fb,$6f,$d4,$fd,$4f,$d5,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$a7,$fb,$6f,$b6,$fb,$6f,$b7,$fa,$7f,$a7,$e6
frame431: .byte $33,$fc,$5f,$d4,$fd,$4f,$e1,$3f,$e1,$3f,$e2,$2f,$e3,$1f,$f9,$2f,$e1,$5f,$b6,$fb,$7f,$b6,$fc,$5f,$c5,$fc,$5f,$b7,$fa,$7f,$a7,$fa,$7f,$a7,$fa,$7f,$a7,$fa,$7f,$a7,$fa,$7f,$98,$f9,$8f,$a7,$fa,$7f,$a7,$fa,$7e,$61
frame432: .byte $2c,$ff,$ff,$ff,$ff,$ff,$fe,$62,$fd,$6f,$a7,$fa,$8f,$98,$fa,$7f,$b6,$fc,$5f,$b6,$fa,$7f,$a8,$f9,$8f,$89,$f8,$9f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f8,$9f,$89,$f8,$9f,$98,$e5
frame433: .byte $2d,$ff,$ff,$ff,$ff,$ff,$24,$fb,$7f,$99,$f8,$9f,$89,$f9,$8f,$a8,$fa,$7f,$a6,$fb,$6f,$a8,$f8,$9f,$89,$f7,$af,$7a,$f7,$af,$7a,$f8,$9f,$89,$f8,$9f,$89,$f8,$9f,$89,$f7,$af,$7a,$f7,$ae,$41
frame434: .byte $2e,$ff,$ff,$ff,$ff,$e4,$4f,$a8,$f9,$9f,$7b,$f6,$bf,$7a,$f8,$9f,$89,$f9,$8f,$a7,$f9,$8f,$89,$f7,$af,$7a,$f7,$af,$6b,$f6,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$6b,$f6,$bf,$6b,$f5,$ce,$21
frame435: .byte $2f,$ff,$ff,$ff,$ff,$e2,$7f,$9a,$f6,$bf,$6c,$f5,$cf,$5c,$f6,$bf,$7a,$f7,$af,$89,$f8,$9f,$89,$f7,$af,$7a,$f6,$bf,$6b,$f5,$cf,$5d,$f3,$e1,$f3,$e1,$f3,$e1,$f4,$df,$4d,$f4,$df,$4d,$f4,$df,$4d,$e1
frame436: .byte $2e,$ff,$ff,$ff,$ff,$e2,$7f,$8a,$f7,$bf,$5d,$f4,$df,$5c,$f6,$bf,$6b,$f7,$af,$89,$f8,$9f,$89,$f7,$af,$7a,$f6,$bf,$6b,$f5,$df,$4d,$f4,$df,$4d,$f4,$df,$4d,$f4,$df,$5c,$f5,$cf,$5c,$f5,$ce,$11
frame437: .byte $2e,$ff,$ff,$ff,$ff,$e2,$5f,$a9,$f7,$af,$6c,$f5,$cf,$5d,$f5,$cf,$6b,$f6,$bf,$7a,$f8,$9f,$89,$f8,$9f,$7a,$f6,$bf,$6b,$f6,$bf,$6b,$f5,$df,$4d,$f4,$df,$4d,$f5,$cf,$5c,$f5,$df,$4e,$1f,$2e,$2d
frame438: .byte $43,$ff,$ff,$ff,$ff,$ff,$fe,$77,$f8,$bf,$5d,$f3,$e2,$f2,$e2,$f1,$e3,$f1,$e3,$f2,$e2,$f3,$e1,$f3,$e1,$f2,$12,$bf,$31,$1c,$f2,$12,$cf,$12,$1d,$f1,$12,$cf,$11,$1e,$2e,$e4,$e6,$ee,$2e,$8e,$de,$be,$ae,$de,$86,$1e,$8e,$64,$1e,$ce,$44,$1e,$e2,$e1,$42,$ee,$3c,$43,$21,$e1,$2c,$11
frame439: .byte $45,$ff,$ff,$ff,$ee,$32,$fc,$af,$6c,$f3,$e1,$f2,$e3,$ee,$5e,$4e,$e4,$e4,$ee,$5e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$6e,$e3,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$3e,$6e,$41,$7e,$ce,$2f,$6b,$f6,$e1,$73,$ec,$ea,$ec,$ea,$ed,$e9,$ee,$1e,$7e,$e2,$e7,$ee,$3e,$5e,$e5,$61
frame440: .byte $3c,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$c1,$fc,$bf,$4e,$1f,$2e,$2e,$e5,$e5,$ee,$3e,$6e,$e3,$e5,$ee,$4e,$5e,$e4,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$8e,$e1,$e8,$ee,$1e,$8e,$e1,$e6,$ee,$3e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e6,$ee,$3e,$be,$be,$ce,$ae,$e2,$e7
frame441: .byte $2f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$a1,$fe,$33,$fe,$14,$fd,$4f,$d5,$fc,$5f,$c4,$fd,$4f,$d5,$ee,$24,$b6,$eb,$99,$6e,$9c,$86,$e7,$e2,$76,$e6,$e3,$76,$e5,$e4,$77,$e3,$e6,$61
frame442: .byte $33,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e1,$2f,$e2,$2f,$d8,$f8,$bf,$5d,$f4,$e1,$f3,$e1,$f3,$df,$4d,$f2,$c1,$1f,$2c,$f4,$cf,$4d,$f4,$e1,$f2,$e3,$ee,$5e,$4e,$e4,$e5,$ee,$4e,$5e,$e3,$e6,$ee,$2e,$7e,$e1,$e6,$e5
frame443: .byte $38,$ff,$ff,$ff,$ff,$ff,$ff,$f1,$2f,$e2,$23,$2f,$a0,$c2,$fb,$c,$1f,$c2,$12,$1,$f8,$40,$1f,$76,$21,$f8,$8f,$98,$3,$f5,$af,$87,$f9,$7f,$a7,$fa,$7f,$97,$f7,$9f,$79,$f7,$bf,$5d,$f3,$e2,$f1,$e3,$ee,$5e,$5e,$e4,$e5,$ee,$3e,$6e,$91
frame444: .byte $4c,$ea,$ec,$eb,$eb,$eb,$eb,$eb,$eb,$ec,$ea,$ec,$ea,$ed,$e9,$ed,$e9,$ee,$1e,$8e,$e1,$e8,$ee,$2e,$7e,$e3,$e6,$ee,$4e,$5e,$e5,$e4,$f1,$e3,$81,$eb,$e2,$72,$32,$e7,$e1,$70,$c2,$ea,$c7,$c,$1e,$da,$72,$12,$1,$eb,$87,$40,$1e,$e2,$56,$51,$2f,$12,$67,$f8,$90,$7f,$4a,$f7,$9f,$88,$f9,$8f,$97,$f9,$8f,$79,$f7,$bf,$61
frame445: .byte $31,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e5,$1f,$e3,$1f,$e3,$1f,$e3,$1f,$e3,$2f,$e2,$2f,$e2,$3f,$e1,$3f,$e1,$4f,$d4,$fd,$5f,$c6,$fb,$6f,$b7,$fb,$7f,$99,$f8,$1,$6f,$70,$37,$f8,$af,$6c,$f4,$23,$af,$21
frame446: .byte $1a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3
frame447: .byte $1a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3
frame448: .byte $1a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3
frame449: .byte $1a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3
frame450: .byte $2d,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$c1,$e1,$2e,$e5,$2c,$4c,$2e,$15,$b4,$b5,$c5,$b4,$b5,$d3,$c4,$b5,$d4,$a5,$c3,$d5,$b4,$b5,$c5,$b4,$b6,$51
frame451: .byte $33,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$c1,$f2,$1c,$4c,$14,$1c,$2c,$4b,$4d,$4c,$4b,$41,$1b,$5b,$78,$54,$17,$5b,$78,$a2,$42,$3c,$78,$96,$6d,$3b,$89,$4d,$4b,$4c,$4d,$3c,$45
frame452: .byte $2f,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$c1,$fe,$32,$d2,$e3,$2c,$4b,$4d,$4c,$4b,$5c,$5b,$78,$5c,$5b,$79,$98,$3c,$78,$a7,$4d,$3b,$68,$7d,$3c,$56,$9d,$3d,$44
frame453: .byte $34,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$d1,$d2,$e2,$2d,$4b,$42,$1a,$3d,$4b,$5b,$5c,$4b,$41,$1a,$5c,$4c,$97,$4c,$69,$a7,$4c,$87,$5b,$5c,$41,$29,$54,$23,$6c,$4d,$35,$bc,$4c,$45
frame454: .byte $3c,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$52,$ee,$52,$c4,$d3,$d4,$b4,$c5,$c4,$c3,$d4,$21,$94,$b4,$d4,$11,$a4,$b5,$c6,$a4,$b6,$b9,$74,$b5,$c5,$8,$65,$b3,$e1,$54,$bb,$4d,$45,$bb,$5c,$45,$ca,$6b,$55,$ba,$6a,$67,$a9,$6a,$64
frame455: .byte $49,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e2,$1e,$12,$ee,$52,$80,$73,$e1,$2e,$14,$68,$e1,$3d,$48,$6d,$4d,$47,$7d,$41,$1b,$48,$6d,$4d,$4a,$3e,$17,$a4,$a3,$e1,$91,$23,$5b,$3d,$51,$e2,$a4,$e1,$45,$c9,$5d,$37,$b8,$6c,$58,$a7,$7b,$5b,$77,$7a,$6c,$68,$6a,$7c,$3b,$10,$ca,$7c,$2c,$7,$1b,$55
frame456: .byte $55,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f8,$1e,$51,$d2,$c3,$e3,$2c,$3b,$5e,$14,$b4,$a5,$e1,$4b,$4a,$7d,$46,$86,$8e,$33,$78,$69,$e1,$48,$20,$88,$21,$4d,$6b,$3b,$38,$cb,$3b,$38,$ca,$59,$58,$c9,$59,$5b,$a7,$69,$6d,$77,$68,$8d,$67,$68,$8d,$69,$49,$6e,$13,$c0,$4a,$21,$2e,$13,$c0,$4a,$10,$ce,$23,$a5,$a0,$71,$e3,$29,$6a,$7,$2e,$14,$95,$a0,$72,$51
frame457: .byte $5f,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$52,$e4,$1d,$2c,$3e,$23,$c3,$b5,$e1,$4b,$4a,$5e,$14,$b4,$71,$25,$e2,$3a,$57,$7e,$33,$96,$77,$e2,$48,$77,$12,$49,$3,$68,$3,$3a,$38,$da,$4a,$38,$da,$49,$5a,$b8,$59,$5c,$98,$58,$6e,$26,$86,$67,$e3,$68,$56,$8e,$25,$94,$96,$e1,$3c,$6,$a1,$c,$e2,$3b,$6,$90,$32,$e3,$39,$68,$3,$2e,$34,$95,$80,$32,$e2,$58,$67,$41,$27,$42,$78,$58,$76,$63,$48,$1d,$76
frame458: .byte $64,$1f,$ff,$ff,$ff,$ff,$ff,$61,$c2,$f1,$2c,$3c,$1e,$44,$b5,$11,$72,$e4,$4b,$76,$4e,$34,$b6,$74,$e3,$4b,$62,$14,$4e,$34,$c3,$3b,$e2,$4c,$35,$8e,$34,$c3,$75,$76,$26,$b4,$75,$7e,$2a,$57,$49,$d9,$67,$4c,$b7,$76,$5e,$1a,$75,$67,$e2,$87,$10,$c6,$7e,$35,$80,$32,$67,$e3,$3a,$3,$19,$4e,$53,$90,$31,$90,$2e,$53,$96,$80,$4e,$53,$a6,$62,$12,$e4,$4b,$64,$69,$35,$6c,$43,$76,$73,$7e,$21,$18,$7e,$1e,$96,$7c,$ea,$65
frame459: .byte $69,$1f,$ff,$ff,$ff,$ff,$e7,$2b,$3e,$e5,$3b,$4b,$2e,$34,$b3,$b4,$e2,$5a,$86,$4e,$34,$a7,$74,$12,$d3,$b7,$74,$e2,$5b,$36,$11,$6e,$24,$c3,$69,$63,$36,$c3,$72,$15,$4e,$1b,$59,$46,$e1,$a5,$84,$9d,$95,$75,$ca,$96,$56,$e1,$98,$56,$6e,$37,$80,$47,$6e,$34,$a2,$12,$94,$e3,$4a,$21,$29,$4e,$43,$a7,$62,$12,$e5,$3a,$57,$10,$ce,$44,$a7,$40,$32,$a1,$64,$b6,$46,$76,$37,$e2,$7,$76,$82,$5e,$77,$78,$14,$e7,$3,$58,$9e,$e1,$49,$8e,$e3,$24
frame460: .byte $63,$1f,$ff,$ff,$ff,$fe,$51,$d1,$e4,$1e,$13,$b4,$e1,$3d,$4a,$41,$1b,$5b,$4b,$4d,$5b,$4b,$8a,$4b,$69,$8a,$4b,$78,$5d,$4b,$41,$28,$54,$52,$6b,$3d,$34,$e1,$b4,$b4,$6d,$a4,$b4,$8b,$96,$96,$a9,$86,$87,$c8,$76,$87,$d7,$84,$a6,$d5,$a0,$4a,$2,$e2,$3c,$49,$21,$2e,$33,$a6,$70,$32,$e4,$3a,$48,$3,$1e,$53,$b5,$67,$74,$37,$a0,$12,$48,$48,$17,$ea,$55,$de,$c6,$6a,$ed,$21,$55,$8e,$e2,$23,$27,$7e,$e2,$2c,$6f,$31
frame461: .byte $63,$1f,$ff,$ff,$d2,$ee,$52,$c3,$e1,$2e,$22,$c4,$d3,$d4,$b4,$c4,$d4,$b4,$c4,$21,$b3,$a5,$c4,$11,$c3,$b5,$b8,$a3,$b5,$b8,$94,$b3,$e1,$35,$42,$6b,$4c,$44,$e1,$95,$c4,$6c,$a5,$a5,$8b,$96,$95,$aa,$85,$96,$c8,$84,$a7,$d4,$a1,$c,$96,$e1,$3b,$10,$cb,$3e,$33,$a2,$12,$a4,$e4,$2a,$59,$2,$e4,$49,$59,$6,$e4,$49,$59,$67,$43,$69,$3a,$66,$71,$6b,$2b,$47,$be,$d6,$69,$ee,$18,$58,$ee,$30,$32,$77,$fb,$6f,$c3,$f5
frame462: .byte $67,$1f,$ff,$fe,$e3,$1d,$3e,$e4,$28,$7,$4e,$11,$e1,$56,$8e,$13,$c5,$76,$e1,$4d,$47,$7d,$41,$1b,$47,$11,$5d,$1,$1c,$3a,$4e,$15,$c3,$a4,$d8,$23,$35,$a4,$de,$8a,$4c,$50,$c1,$d8,$5c,$48,$c7,$6b,$59,$a7,$6b,$5b,$88,$5a,$6d,$5a,$6,$97,$e1,$3b,$6,$a6,$e1,$3a,$1,$2a,$4e,$33,$87,$a4,$e4,$38,$5a,$21,$2e,$35,$66,$a5,$92,$46,$64,$c6,$6d,$61,$e4,$56,$71,$5e,$c5,$79,$ed,$86,$7e,$e1,$21,$75,$8e,$d2,$61,$68,$fb,$5f,$d2,$f6
frame463: .byte $6a,$1f,$ff,$ec,$1e,$21,$e3,$1d,$3d,$2e,$22,$c4,$c4,$d4,$c4,$b4,$d5,$b4,$b4,$d5,$69,$60,$77,$c4,$68,$79,$e1,$39,$11,$47,$9c,$5c,$38,$12,$48,$ab,$4a,$49,$52,$4a,$59,$49,$c8,$69,$58,$c8,$68,$6a,$b7,$68,$7b,$98,$58,$7c,$89,$11,$1a,$5e,$24,$b1,$11,$a2,$12,$e2,$49,$69,$3,$1e,$33,$96,$90,$31,$e4,$39,$59,$7,$2e,$25,$76,$87,$80,$19,$65,$97,$75,$35,$e7,$87,$62,$4e,$72,$15,$8b,$ec,$59,$7e,$e1,$3c,$7e,$e1,$2d,$8e,$c2,$e1,$6f,$c3,$f8
frame464: .byte $6b,$1f,$ff,$e6,$1e,$42,$ee,$22,$e2,$3b,$1e,$15,$d5,$a2,$e1,$4d,$5a,$2e,$15,$c5,$a2,$e1,$57,$14,$51,$27,$3d,$65,$ab,$2c,$77,$9b,$2b,$87,$9b,$3a,$32,$3b,$4c,$3e,$15,$a4,$c4,$d5,$a4,$c4,$c6,$95,$c5,$b6,$95,$c6,$97,$87,$b6,$97,$78,$b7,$a4,$88,$b7,$a0,$69,$7b,$5c,$10,$c9,$3,$2b,$3e,$12,$12,$90,$32,$b4,$c6,$90,$32,$d3,$b6,$90,$32,$d4,$b5,$90,$32,$c5,$97,$87,$b7,$95,$88,$b6,$82,$d8,$b5,$91,$d2,$16,$b4,$eb,$7,$6a,$2e,$e3,$6f,$b4,$d1
frame465: .byte $5a,$1f,$eb,$1f,$e2,$3f,$d6,$e2,$2e,$c6,$e1,$3e,$ca,$94,$ed,$97,$7e,$c9,$86,$eb,$99,$6e,$ba,$87,$eb,$c6,$5e,$d6,$15,$28,$ed,$61,$e4,$ec,$54,$ce,$e1,$55,$be,$d6,$5b,$ed,$74,$be,$c8,$44,$16,$ec,$89,$6e,$b9,$87,$ea,$a8,$7e,$aa,$79,$ea,$87,$ae,$b0,$33,$7b,$e9,$32,$36,$ce,$92,$42,$7b,$e9,$24,$28,$ae,$92,$42,$a6,$eb,$99,$6e,$aa,$92,$8,$ea,$a9,$20,$8e,$c7,$93,$22,$e5
frame466: .byte $49,$1d,$2f,$c5,$fa,$8f,$9a,$f8,$92,$1f,$5d,$f4,$bf,$69,$ee,$31,$99,$ee,$31,$99,$f5,$bf,$4e,$2e,$e2,$11,$e5,$ee,$24,$2e,$1e,$e2,$32,$e1,$ee,$3e,$6e,$e3,$83,$9e,$e4,$46,$8f,$98,$f9,$8f,$a7,$f9,$8f,$98,$f8,$9f,$8a,$ee,$11,$9b,$ee,$12,$7c,$ee,$13,$6c,$ee,$12,$6d,$ee,$11,$6e,$1f,$2e,$2f,$1e,$3e,$e1
frame467: .byte $3d,$18,$9f,$7a,$f7,$af,$7a,$67,$ec,$a3,$ae,$de,$7e,$be,$be,$9e,$ce,$ae,$be,$b5,$2e,$3e,$de,$8e,$e1,$e7,$ee,$2e,$4e,$e5,$e3,$f2,$e2,$f8,$9f,$89,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$89,$f8,$af,$6b,$f6,$cf,$5c,$f4,$df,$4e,$1f,$3e,$2f,$1e,$3f,$1e,$4e,$a1
frame468: .byte $41,$1d,$7f,$99,$f7,$af,$6b,$f7,$af,$7a,$a1,$ee,$29,$65,$ee,$29,$26,$ee,$5d,$f3,$e5,$23,$eb,$ed,$e9,$ee,$2e,$7e,$e3,$e5,$ec,$c,$e6,$eb,$ea,$e1,$43,$ee,$20,$19,$f8,$9f,$89,$f8,$9f,$88,$f9,$8f,$98,$f9,$9f,$7b,$f6,$bf,$6c,$f5,$cf,$4e,$1f,$3e,$1f,$3e,$2f,$2e,$3e,$71
frame469: .byte $41,$1e,$91,$fe,$23,$fd,$8f,$8a,$f5,$bf,$6b,$f7,$af,$7b,$41,$f1,$a3,$3f,$1a,$8,$f4,$bf,$6b,$f3,$ec,$e9,$ee,$3e,$6e,$61,$ae,$4e,$61,$60,$ce,$4e,$de,$8e,$23,$7e,$a4,$39,$35,$ee,$59,$51,$f1,$9f,$89,$f8,$8f,$98,$f9,$9f,$89,$f7,$bf,$6b,$f6,$cf,$5c,$f5,$df,$3e,$1e,$41
frame470: .byte $60,$1e,$c7,$f9,$9f,$8a,$f3,$3,$ad,$2e,$5e,$2d,$2e,$5e,$23,$37,$2e,$6e,$77,$3e,$6e,$1c,$5e,$3d,$e1,$4e,$2e,$2e,$14,$89,$1c,$e1,$57,$63,$de,$16,$85,$1e,$2d,$69,$41,$e1,$e1,$5b,$e5,$e1,$5b,$62,$9e,$25,$c4,$29,$e3,$4e,$69,$e3,$4e,$69,$e3,$4e,$69,$e3,$4e,$68,$e4,$5e,$68,$e3,$4e,$78,$e3,$5e,$5a,$e2,$5e,$5b,$e1,$5e,$5b,$e1,$6e,$3c,$e1,$6e,$3d,$d6,$e3,$dd,$6e,$3e,$1c,$7e,$2e,$2b,$7e,$1e,$4a
frame471: .byte $59,$1f,$92,$fb,$7f,$9a,$f6,$b9,$2e,$db,$93,$ed,$a8,$5e,$9d,$68,$e8,$e2,$49,$e7,$d6,$9d,$16,$c7,$9b,$e8,$88,$b6,$4c,$87,$d4,$2e,$18,$6e,$14,$1e,$22,$e1,$de,$62,$e2,$ce,$53,$e1,$d5,$39,$4e,$1e,$12,$59,$4e,$1e,$7a,$54,$18,$e8,$95,$33,$7e,$89,$c7,$e7,$9c,$6e,$88,$c8,$e7,$9b,$8e,$6b,$99,$e6,$b9,$9e,$5c,$8a,$e5,$c8,$ae,$5d,$6b,$e4,$e1,$6b,$e4,$e1,$5d,$e2,$e3,$11
frame472: .byte $45,$1f,$ff,$ff,$ff,$fb,$58,$2f,$17,$73,$ee,$57,$20,$14,$ee,$48,$28,$ee,$5e,$11,$2e,$e5,$e1,$f4,$cf,$5d,$f3,$e1,$45,$ec,$e2,$3b,$e6,$e1,$46,$23,$e7,$8b,$41,$4e,$87,$c8,$e9,$6c,$8e,$96,$d4,$ec,$7f,$a6,$fa,$7f,$a8,$f8,$9f,$89,$f7,$af,$7b,$f5,$cf,$5c,$e4,$1e,$4d,$e4,$1e,$3e,$1e,$32
frame473: .byte $5f,$1f,$e3,$1f,$e3,$1f,$e3,$1f,$e3,$2e,$e1,$1e,$54,$ec,$3,$1e,$14,$ec,$6d,$3e,$c7,$d3,$eb,$8d,$3e,$b9,$92,$8,$ec,$74,$1,$40,$8e,$c7,$1b,$8,$ec,$e2,$8,$12,$ed,$e2,$c,$12,$ec,$e2,$63,$ec,$e1,$62,$ee,$1e,$15,$2e,$e2,$74,$16,$1e,$e3,$7b,$1e,$e3,$7b,$1e,$e3,$7b,$2e,$e2,$6c,$2e,$e2,$6c,$1e,$e2,$8b,$2e,$e1,$8b,$3e,$d8,$b3,$ec,$aa,$4e,$ba,$a4,$eb,$aa,$5e,$ab,$95,$e9,$c9,$6e,$8c,$91
frame474: .byte $50,$1f,$ff,$92,$fe,$24,$fc,$5f,$b5,$f2,$15,$af,$12,$4b,$ee,$43,$5b,$ee,$25,$4b,$ed,$92,$be,$d9,$2b,$ed,$84,$ae,$d8,$5a,$eb,$86,$9e,$c7,$88,$ec,$96,$7e,$da,$3a,$eb,$b3,$be,$ba,$2c,$eb,$a2,$be,$ca,$3a,$ec,$a1,$de,$b7,$3e,$1e,$a7,$4e,$1e,$b6,$4e,$1e,$a8,$3d,$eb,$83,$e1,$ea,$92,$e2,$e9,$92,$e2,$e8,$a2,$e3,$e7,$b1,$e3,$e7,$b1
frame475: .byte $4a,$1f,$f1,$2f,$e1,$4f,$d4,$fb,$6f,$99,$eb,$3c,$ae,$a4,$c9,$e8,$6b,$ae,$86,$ba,$e8,$6c,$ae,$76,$d9,$e7,$6d,$8e,$95,$e1,$6e,$a5,$d8,$e7,$7c,$9e,$77,$ca,$e6,$7b,$ae,$86,$ba,$e8,$6b,$ae,$77,$ba,$e7,$79,$ce,$77,$6e,$2e,$77,$1e,$7e,$7e,$e1,$e8,$ee,$1e,$8f,$3e,$1f,$4d,$f4,$df,$4d,$f3,$e1,$73,$ea,$e2,$71
frame476: .byte $55,$1f,$ff,$eb,$3f,$e1,$4f,$c4,$fc,$6e,$52,$e7,$9e,$34,$e6,$ae,$16,$e6,$8e,$26,$e5,$ae,$25,$e5,$ae,$43,$e6,$9e,$43,$e7,$8e,$33,$e8,$8e,$34,$e8,$6e,$35,$e6,$9e,$25,$e6,$8e,$71,$e5,$ae,$61,$e5,$ae,$61,$e4,$ae,$71,$e4,$ae,$71,$e3,$ce,$61,$e1,$e1,$e6,$67,$e3,$e5,$e5,$29,$e6,$ee,$1e,$7e,$e3,$e6,$f1,$27,$6f,$c5,$43,$f5,$45,$7e,$e5,$46,$ae,$e2,$37
frame477: .byte $45,$1f,$ff,$ff,$c1,$fe,$24,$fd,$4f,$c5,$f8,$9f,$8b,$f7,$af,$7a,$f7,$af,$7a,$e4,$2e,$6a,$e4,$2e,$7a,$e3,$2e,$79,$e4,$2e,$88,$e5,$1e,$86,$e6,$2e,$6a,$e5,$1e,$6a,$f6,$bf,$6b,$f5,$cf,$2e,$2e,$65,$6e,$5e,$6e,$42,$be,$5e,$15,$be,$5e,$e4,$e4,$ee,$4e,$4e,$e5,$e4,$f3,$46,$33,$2f,$93,$31
frame478: .byte $48,$1f,$ff,$ee,$51,$fe,$23,$fe,$15,$fb,$6f,$98,$f7,$af,$7c,$f5,$bf,$7a,$f6,$af,$7b,$f6,$be,$e3,$35,$be,$e2,$45,$be,$e2,$46,$9e,$e2,$57,$7e,$e3,$54,$be,$e3,$51,$e1,$ee,$2e,$7e,$e3,$e6,$ee,$3e,$6e,$e3,$51,$cf,$5c,$e5,$1e,$4b,$e3,$5e,$3b,$e3,$7e,$2a,$e3,$ba,$be,$3e,$e5,$e4,$ee,$4e,$5e,$e5,$e4
frame479: .byte $46,$1f,$fc,$4f,$d7,$fa,$7f,$a7,$f9,$af,$6c,$f3,$df,$4d,$f5,$cf,$6c,$f5,$cf,$5d,$f4,$de,$51,$c,$cd,$e5,$20,$8b,$ce,$78,$9a,$e9,$7a,$9e,$b6,$6e,$1e,$a5,$3e,$6e,$94,$2e,$7e,$9e,$de,$ae,$ce,$ae,$ce,$a6,$4e,$1f,$3e,$19,$8e,$4e,$28,$9e,$4e,$18,$ce,$1e,$18,$e3,$ae,$18,$e9,$2e,$38,$f8,$91
frame480: .byte $43,$1f,$ff,$11,$fe,$13,$fe,$13,$fe,$22,$fe,$22,$fe,$13,$fd,$4f,$c5,$fb,$6f,$a7,$fa,$7f,$c5,$fc,$5f,$c5,$fc,$5f,$c5,$ee,$13,$d5,$ee,$26,$a4,$e9,$da,$3e,$ad,$a2,$ed,$a8,$4e,$e4,$64,$8e,$e4,$72,$9e,$e5,$e4,$ee,$5e,$4f,$1e,$3f,$1e,$3f,$19,$43,$f3,$48,$2e,$54,$eb,$2b,$ce,$a2
frame481: .byte $2b,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fb,$3f,$e2,$3f,$98,$f9,$8e,$73,$e8,$4e,$3e,$2e,$31,$e2,$e5,$ee,$3e,$7e,$e1,$e9,$ed,$e9,$ec,$ea,$ec,$eb,$c1
frame482: .byte $36,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f9,$7f,$8c,$ee,$24,$3e,$13,$4e,$6e,$e4,$e5,$ee,$4e,$6e,$e2,$e7,$ee,$2e,$7e,$e3,$e7,$ee,$2e,$7e,$e2,$e8,$eb,$ec,$e9,$ec,$eb,$eb,$eb,$ec,$ea,$ec,$e9,$11,$ec,$e8,$ee,$1e,$8d
frame483: .byte $2f,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$14,$fa,$cf,$4e,$1f,$2e,$3e,$bf,$1e,$2f,$3e,$1f,$3e,$2f,$1e,$3f,$1e,$4e,$e4,$e6,$ee,$2e,$8e,$de,$ae,$be,$be,$be,$be,$be,$ce,$ae,$be,$cb
frame484: .byte $3c,$1f,$ff,$ff,$ff,$ff,$f2,$5f,$8c,$f4,$e2,$f1,$e4,$ee,$5e,$5e,$e1,$e9,$e9,$ed,$ea,$ed,$e9,$ed,$e9,$ed,$ea,$ec,$e9,$ec,$e9,$ed,$ea,$ed,$e9,$ed,$ea,$ec,$eb,$ec,$eb,$ea,$ec,$e9,$ed,$e9,$ee,$1e,$9e,$de,$9e,$de,$9e,$d1,$1e,$7e,$e2,$e7,$ee,$4e,$59
frame485: .byte $50,$19,$ee,$3e,$6e,$e4,$e5,$42,$e3,$27,$e2,$52,$e5,$27,$d6,$3e,$33,$7d,$54,$e3,$47,$c6,$2e,$52,$8c,$62,$e5,$28,$d4,$3e,$53,$7d,$53,$e3,$38,$c5,$5e,$15,$7c,$56,$c6,$7b,$58,$a8,$7b,$49,$89,$8a,$4a,$6a,$8b,$3b,$4b,$9a,$2d,$2d,$99,$2e,$e2,$9f,$88,$f8,$5f,$c5,$fc,$5f,$c5,$fc,$5f,$c5,$fc,$6f,$c6,$fc,$5f,$e1,$2f,$e3,$2f,$ff,$71
frame486: .byte $3b,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$23,$e2,$2e,$e2,$4c,$4e,$e2,$5a,$6e,$d7,$87,$ed,$86,$9e,$ba,$4a,$eb,$b2,$be,$be,$be,$be,$ce,$ae,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$ae,$de,$7e,$e3,$e4,$f2,$e1,$25,$ea,$41,$e7,$e9,$ed,$e9,$d1
frame487: .byte $41,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$13,$ee,$12,$e2,$4e,$e1,$4b,$6e,$d6,$98,$ec,$77,$9e,$b8,$6a,$eb,$94,$ce,$aa,$3c,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$e9,$ed,$e7,$ee,$3e,$4f,$1e,$24,$2e,$c1,$2e,$11,$5e,$b3,$2e,$6e,$b5,$1e,$5e,$be,$ce,$ac
frame488: .byte $3e,$ed,$e2,$f1,$e2,$f1,$e4,$ee,$4e,$4e,$e3,$e6,$ee,$2e,$7e,$e1,$e8,$ed,$e9,$ed,$e9,$ec,$ea,$e5,$ee,$4e,$8e,$e1,$ea,$ec,$e9,$ed,$e9,$ed,$e9,$ec,$ea,$ec,$eb,$eb,$eb,$eb,$ed,$e9,$ee,$2e,$8e,$d4,$4d,$21,$ea,$2a,$af,$89,$fc,$5f,$ff,$ff,$ff,$ff,$e2,$3f,$d4
frame489: .byte $43,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f3,$1f,$e3,$4f,$d4,$fd,$51,$1e,$32,$72,$e1,$82,$ee,$39,$fa,$7f,$b6,$fd,$4d,$2e,$61,$a3,$c2,$e7,$29,$3b,$3e,$82,$91,$b3,$e9,$38,$19,$5e,$94,$71,$85,$eb,$46,$19,$4e,$b6,$23,$95,$eb,$9b,$4e,$91,$18,$c3,$ea,$ad,$1e,$c5,$10,$c1,$11
frame490: .byte $2b,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$36,$f8,$ce,$e5,$e9,$ec,$ec,$e8,$ee,$2e,$7e,$e2,$e6,$ee,$4e,$4f,$1e,$3f,$1e,$2f,$2e,$2f,$3d,$f4,$df,$4d,$f4,$71
frame491: .byte $3e,$1f,$ff,$ff,$ff,$ff,$ff,$e7,$5f,$b7,$f9,$af,$2e,$3e,$e4,$e5,$ee,$3e,$7e,$de,$ae,$be,$ce,$9e,$de,$8e,$e2,$e7,$ee,$2e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$1,$ec,$eb,$eb,$ec,$ea,$ec,$ea,$ec,$ea,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$11,$e7,$ee,$2e,$6e,$e5,$e5,$91
frame492: .byte $61,$13,$67,$e4,$e5,$77,$e2,$e5,$87,$e1,$e5,$a6,$e1,$e5,$a6,$d7,$29,$c6,$b7,$48,$c6,$b6,$66,$e1,$5a,$68,$5e,$15,$a5,$a4,$e1,$68,$5b,$4e,$25,$85,$c3,$e2,$58,$4d,$3e,$25,$84,$e1,$2e,$34,$84,$e1,$2e,$34,$84,$e1,$3e,$24,$83,$e2,$4e,$15,$73,$e2,$52,$39,$46,$4e,$2b,$8e,$1e,$2e,$15,$e1,$e2,$d6,$e1,$e2,$c6,$e3,$e1,$c5,$e5,$dd,$3e,$7c,$e1,$2e,$7d,$d2,$e7,$e1,$f4,$df,$4d,$f4,$df,$4b,$f6,$bf,$6b,$21
frame493: .byte $40,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$96,$fa,$8f,$99,$f8,$aa,$6e,$a0,$e5,$99,$ed,$49,$be,$b4,$84,$18,$ea,$48,$42,$7e,$b3,$83,$56,$ea,$47,$38,$3e,$a4,$73,$f3,$e1,$f3,$e1,$f3,$e1,$f2,$e3,$ee,$5e,$5e,$e4,$e5,$ee,$3e,$7e,$e2,$e7,$ee,$2e,$8e,$e1,$e8,$ed,$e9,$ed,$e9,$d1
frame494: .byte $4c,$e3,$7f,$a7,$fb,$6e,$64,$e6,$6e,$2a,$e4,$6d,$ce,$55,$be,$1e,$55,$ad,$e7,$59,$ce,$95,$8a,$ed,$48,$5e,$e5,$47,$5f,$14,$74,$f2,$47,$3f,$34,$73,$f3,$47,$3f,$43,$64,$f4,$72,$3f,$4d,$f3,$e1,$f2,$e3,$ee,$5e,$5e,$e3,$e7,$ee,$2e,$8e,$e1,$e8,$ed,$e9,$ed,$e9,$ed,$e9,$ee,$1e,$9e,$de,$9e,$de,$9e,$e1,$e8,$ee,$1e,$8b
frame495: .byte $45,$b7,$24,$f6,$bf,$89,$fb,$7f,$b6,$fc,$5f,$d5,$fb,$af,$5e,$1f,$2e,$4e,$e4,$e6,$ee,$2e,$7e,$e1,$e9,$ed,$e9,$ed,$ea,$ec,$ea,$ed,$e9,$ee,$1e,$8e,$e3,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$3e,$6e,$e4,$e6,$ee,$3e,$6e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$6e,$e2,$e7,$ee,$1e,$9e,$ce,$ae,$ce,$b6
frame496: .byte $3b,$e3,$9f,$a8,$fb,$6f,$c5,$fd,$4f,$e1,$3f,$e1,$4f,$b9,$f7,$bf,$5d,$f3,$e2,$f2,$e2,$f2,$e2,$f2,$e3,$f3,$e1,$f3,$e1,$f3,$e1,$f4,$df,$4d,$f5,$cf,$5c,$f5,$cf,$5c,$f4,$df,$4e,$1f,$2e,$2f,$2e,$2f,$1e,$4e,$e5,$e4,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$6b
frame497: .byte $3a,$ff,$61,$fe,$24,$fe,$14,$fb,$14,$1f,$b7,$fd,$4f,$e2,$2f,$e2,$4f,$b8,$f9,$9f,$7a,$f8,$9f,$98,$f9,$8f,$a7,$fa,$7f,$a8,$f8,$9f,$7a,$f1,$24,$be,$e5,$32,$ce,$e5,$e5,$ee,$5e,$4e,$e5,$e4,$f1,$32,$cf,$5c,$f5,$cf,$5c,$f4,$df,$4d,$f4,$de,$11
frame498: .byte $38,$ff,$ff,$ff,$ff,$ff,$54,$fc,$3f,$e1,$2f,$e2,$1f,$e1,$5f,$c6,$fa,$8f,$a5,$12,$f9,$52,$3f,$75,$23,$f7,$9f,$78,$f8,$8f,$7a,$f7,$9f,$70,$c6,$f7,$21,$6f,$82,$17,$f7,$21,$8f,$8a,$f8,$af,$6a,$f7,$af,$76,$7,$fa,$e,$3f,$a3,$22,$e4
frame499: .byte $34,$ff,$ff,$ff,$ff,$ff,$fe,$b0,$81,$fc,$9,$fe,$11,$11,$fe,$13,$fc,$6f,$a8,$f8,$c,$5f,$89,$fa,$7f,$b6,$fd,$4f,$c5,$fc,$6f,$b7,$fa,$6f,$a7,$fa,$7f,$a7,$fb,$7f,$b4,$fc,$5f,$c2,$12,$fc,$21,$2f,$c2,$12,$fb,$23,$1d
frame500: .byte $33,$ff,$ff,$ff,$ff,$ff,$fe,$e4,$2f,$e1,$11,$1f,$ff,$22,$fe,$15,$fc,$5f,$d4,$fd,$4f,$2e,$3f,$b6,$fc,$5f,$c6,$fb,$6f,$b6,$fb,$6f,$a7,$fa,$7f,$a7,$f9,$8f,$a7,$fa,$c,$2f,$a2,$1,$fb,$20,$1f,$b1,$41,$fa,$24,$18
frame501: .byte $35,$ff,$ff,$ff,$ff,$ff,$ff,$11,$fe,$10,$df,$e3,$1f,$e2,$3f,$e1,$4f,$c6,$fc,$5f,$c5,$f1,$e3,$fc,$5f,$d5,$fc,$5f,$c5,$fc,$5f,$b7,$fa,$7f,$a7,$f9,$8f,$98,$fa,$20,$7f,$a0,$e2,$fb,$c,$2f,$b0,$c2,$fa,$23,$2f,$a1,$42,$61
frame502: .byte $31,$ff,$ff,$ff,$ff,$ff,$ff,$91,$fe,$41,$ff,$ff,$e7,$1f,$e3,$1f,$82,$fe,$32,$fe,$30,$83,$fb,$41,$1f,$ff,$ff,$ff,$e9,$1f,$e3,$1f,$e3,$1f,$e3,$1f,$e2,$2f,$e3,$1f,$e2,$2f,$e2,$2f,$e2,$1f,$e2,$2f,$e2,$12
frame503: .byte $3e,$14,$fd,$2f,$e3,$1f,$e2,$8f,$8a,$f7,$70,$1f,$77,$1,$f7,$64,$1f,$65,$62,$f3,$58,$2f,$17,$82,$ee,$58,$82,$ee,$49,$82,$ee,$3a,$82,$ee,$2d,$53,$ee,$1d,$62,$ee,$1e,$1f,$3e,$1f,$38,$14,$f6,$2f,$d3,$fe,$23,$fe,$14,$fd,$4f,$e1,$2f,$ff,$ff,$ff,$ff,$ff,$f8
frame504: .byte $3b,$e1,$4f,$d4,$fd,$6f,$aa,$f6,$64,$2f,$59,$3,$f3,$b0,$1f,$2b,$f6,$32,$6f,$63,$2,$3f,$75,$fc,$cf,$4d,$f3,$e1,$f1,$e3,$ee,$5e,$1f,$3e,$1f,$3e,$2f,$2e,$1f,$4c,$f8,$50,$3f,$b0,$c2,$fd,$9,$fd,$2f,$e3,$1f,$e2,$2f,$e3,$1f,$ff,$ff,$ff,$fe,$a1
frame505: .byte $37,$e3,$1f,$e4,$1f,$e3,$1f,$ff,$31,$fe,$30,$9f,$e1,$5f,$c5,$fb,$6f,$b6,$fc,$8f,$8b,$f6,$53,$4f,$55,$1,$f8,$62,$1f,$78,$f9,$8f,$79,$f6,$bf,$6c,$f4,$e1,$f3,$e1,$f3,$df,$5c,$f6,$af,$b0,$c1,$fc,$1f,$e3,$1f,$e3,$1f,$ff,$ff,$e5
frame506: .byte $3e,$e4,$1f,$e3,$1f,$e3,$1f,$e4,$1f,$e3,$1f,$e3,$1f,$e4,$1f,$e3,$1f,$e3,$1f,$e3,$2f,$e3,$1f,$e3,$12,$35,$4f,$22,$1d,$f2,$e3,$bf,$e4,$93,$9a,$1,$f4,$9f,$88,$f9,$7f,$8a,$f6,$af,$6b,$f6,$cf,$5d,$f5,$cf,$5c,$f6,$bf,$7a,$f9,$8f,$b2,$1,$fb,$24,$1f,$b1,$e8
frame507: .byte $4b,$e3,$3e,$a6,$e3,$3e,$e2,$1e,$43,$fe,$13,$fe,$22,$fe,$23,$fd,$4f,$d4,$fe,$14,$fd,$4f,$d5,$fd,$4f,$d5,$71,$e2,$11,$45,$ea,$af,$eb,$2e,$22,$e2,$3a,$58,$78,$95,$d3,$a8,$68,$ed,$92,$ce,$c9,$3b,$ec,$a2,$52,$44,$1e,$6e,$5e,$e4,$e4,$ee,$5e,$3e,$e5,$e5,$ee,$4e,$4f,$2e,$2f,$2e,$3f,$2e,$2f,$3e,$1f,$4d,$f4,$db
frame508: .byte $65,$e1,$8e,$58,$e2,$6e,$77,$e3,$5e,$95,$e4,$4e,$b3,$e4,$5e,$c1,$e4,$5f,$b7,$f9,$8e,$b1,$e3,$8e,$a1,$e3,$8e,$92,$e4,$86,$1e,$12,$e4,$a4,$1d,$40,$75,$e9,$ad,$2f,$ff,$ee,$52,$b3,$c4,$e2,$4a,$48,$67,$62,$70,$83,$65,$87,$e7,$27,$29,$8e,$72,$71,$a8,$3,$e4,$2e,$3e,$1e,$32,$e3,$e2,$b3,$e5,$e4,$95,$e3,$e6,$67,$e2,$b2,$85,$7e,$49,$39,$37,$e5,$94,$82,$50,$3e,$49,$2e,$14,$1e,$69,$1e,$17,$1e,$5e,$a4,$45,$2a,$ea,$31
frame509: .byte $5e,$e1,$ae,$29,$e1,$8e,$67,$e2,$7e,$76,$e4,$5e,$94,$e4,$5e,$b2,$e4,$6e,$b1,$e2,$8f,$8a,$ea,$1e,$2a,$e9,$1e,$3a,$e7,$2e,$3b,$e5,$3a,$15,$c0,$1b,$a4,$eb,$9d,$1f,$ff,$f1,$1c,$2e,$22,$e2,$4a,$4a,$48,$34,$60,$c5,$56,$77,$71,$b4,$63,$88,$e7,$36,$29,$9e,$72,$e3,$ae,$72,$e3,$be,$81,$e1,$cf,$4c,$f3,$cf,$6b,$b1,$ee,$19,$85,$92,$e3,$a7,$58,$1e,$5a,$57,$a2,$e2,$a4,$96,$45,$29,$85,$c1,$11
frame510: .byte $50,$ce,$95,$9e,$1e,$68,$7e,$2e,$4b,$5e,$2e,$2e,$32,$de,$1f,$4b,$f7,$af,$89,$f8,$9f,$7b,$f3,$e2,$f3,$e2,$e7,$1c,$e3,$e5,$3b,$e4,$61,$95,$33,$4e,$73,$25,$91,$61,$ff,$ee,$12,$fe,$13,$ee,$13,$43,$84,$ed,$61,$46,$6e,$bd,$10,$76,$68,$45,$1e,$23,$72,$a4,$eb,$1e,$55,$fb,$7f,$99,$f7,$af,$6c,$e6,$2d,$de,$71,$dd,$f6,$ae,$a3,$cb,$e8
frame511: .byte $56,$24,$3e,$d3,$a0,$35,$ee,$12,$ab,$ec,$48,$de,$b6,$5d,$ea,$eb,$eb,$ec,$ea,$ed,$e8,$ee,$1e,$7e,$e1,$e7,$ee,$1e,$7e,$e2,$e6,$ee,$4e,$4e,$e5,$e4,$ee,$5e,$5e,$ce,$be,$42,$5e,$da,$8,$35,$ee,$28,$84,$fe,$21,$fe,$62,$fe,$13,$ee,$14,$8,$95,$ec,$90,$c4,$6e,$6e,$31,$42,$6e,$6e,$31,$ce,$6e,$e3,$e6,$ee,$21,$6c,$e5,$1e,$85,$e8,$2e,$91,$fe,$31,$fe,$14,$e9
frame512: .byte $56,$1f,$ff,$f4,$1e,$51,$ee,$13,$e3,$2e,$e1,$4c,$5e,$e2,$3c,$7e,$e1,$49,$ae,$d4,$6d,$ee,$1e,$8e,$e3,$e7,$ee,$3e,$7e,$e2,$e7,$ee,$3e,$5e,$e4,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e1,$f3,$df,$39,$14,$f3,$84,$1f,$48,$fb,$6f,$ff,$82,$b1,$e6,$30,$e7,$3b,$2e,$49,$64,$62,$e,$23,$8e,$15,$42,$72,$68,$e1,$54,$17,$36,$8e,$33,$c3,$68,$e5,$1b,$56,$5e,$41
frame513: .byte $41,$1f,$ff,$ff,$ff,$ff,$ff,$fb,$2f,$e2,$3f,$e1,$42,$1f,$a7,$fa,$6f,$a7,$f9,$9e,$e1,$29,$be,$d5,$4e,$1e,$ce,$ae,$de,$8f,$7a,$f8,$99,$14,$2e,$b8,$a0,$73,$ea,$51,$1c,$12,$4e,$94,$e2,$7e,$a2,$e4,$6f,$b6,$fc,$5f,$d4,$fc,$5f,$c5,$f2,$28,$5c,$44,$23,$24,$48,$5a,$72,$31
frame514: .byte $4b,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$22,$e5,$1e,$e1,$3e,$42,$ed,$3e,$51,$23,$e8,$4e,$41,$23,$e9,$5e,$26,$ea,$4e,$26,$ea,$4e,$27,$e9,$4e,$36,$e9,$3e,$55,$e9,$4e,$45,$e9,$6e,$25,$e9,$1,$2e,$25,$e9,$3e,$55,$e9,$3e,$55,$e9,$3e,$55,$e9,$2e,$74,$e9,$2e,$74,$e7,$2e,$a3,$e4,$5e,$a4,$e2,$6e,$95,$e2,$51
frame515: .byte $3d,$1f,$ff,$ff,$ff,$ff,$ff,$d1,$fe,$31,$fe,$31,$fe,$30,$71,$fc,$12,$3f,$b6,$fb,$7f,$a7,$fa,$6f,$b6,$fc,$5f,$c5,$fc,$6f,$b6,$e8,$1e,$76,$e7,$4e,$56,$e7,$4e,$47,$e6,$5e,$47,$e6,$5e,$40,$12,$e6,$5e,$54,$e8,$6e,$35,$e9,$5e,$44,$ec,$1e,$62,$ff,$fe,$e3
frame516: .byte $2f,$1f,$ff,$ff,$ff,$ff,$ff,$c2,$fe,$31,$fe,$31,$fe,$31,$23,$fb,$20,$8f,$b7,$fa,$7f,$b1,$14,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fb,$5f,$c4,$fe,$21,$ff,$ff,$ff,$ee,$51
frame517: .byte $30,$1f,$ff,$ff,$ff,$ff,$ff,$fe,$e3,$1f,$e3,$24,$2f,$a0,$74,$fa,$12,$4f,$a7,$fa,$7f,$b6,$fc,$5f,$c5,$fc,$5f,$c5,$fc,$5f,$c5,$fc,$5f,$c5,$fc,$6f,$b6,$fc,$6f,$c6,$fd,$5f,$c6,$fc,$5f,$c5,$fd,$3e,$41
frame518: .byte $31,$1f,$ff,$ff,$ff,$ff,$ff,$fe,$e4,$2f,$e3,$14,$4f,$80,$35,$f9,$12,$6f,$80,$35,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$b6,$fb,$7f,$a7,$fa,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b6,$fa,$7f,$b7,$fb,$7f,$b6,$fc,$6e,$21
frame519: .byte $36,$1f,$ff,$ff,$ff,$ff,$ee,$22,$fe,$31,$fe,$31,$fe,$31,$54,$f7,$23,$5f,$72,$36,$f7,$3,$6f,$70,$16,$f7,$af,$7a,$f7,$af,$70,$16,$f8,$12,$5f,$98,$f9,$9f,$89,$f8,$9f,$89,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$89,$f9,$8f,$98,$e3
frame520: .byte $41,$1f,$ff,$ff,$fe,$e4,$1f,$e2,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$e2,$7,$5f,$81,$27,$f6,$21,$8f,$60,$17,$f6,$1,$7f,$6b,$f6,$bf,$5c,$f5,$cf,$51,$1a,$f5,$12,$9f,$42,$46,$f5,$51,$6f,$5c,$f5,$cf,$5d,$f4,$df,$3e,$1f,$30,$23,$7f,$32,$48,$f3,$15,$8f,$31,$58,$f2,$24,$9e,$11
frame521: .byte $46,$1f,$ff,$ff,$fe,$e4,$3f,$e1,$2f,$e2,$2f,$e2,$2f,$e2,$3,$7f,$50,$39,$f4,$21,$af,$42,$1a,$f3,$32,$9f,$33,$2a,$f2,$41,$af,$24,$28,$f3,$12,$bf,$22,$1c,$f2,$e2,$f2,$e2,$f2,$12,$cf,$10,$3c,$f1,$3,$bf,$21,$4a,$f1,$43,$9f,$1e,$3e,$e5,$e4,$f1,$e2,$f1,$e3,$f1,$e4,$ee,$5e,$4e,$e5,$e4,$c1
frame522: .byte $56,$1f,$ff,$ff,$ff,$fe,$22,$fe,$22,$56,$f4,$23,$af,$20,$3c,$f1,$3,$ce,$e5,$23,$de,$e4,$23,$de,$e4,$23,$e1,$ee,$32,$3e,$1e,$e2,$42,$e1,$ee,$24,$3d,$ee,$25,$2d,$ee,$25,$2c,$ee,$32,$10,$3c,$ee,$30,$3e,$2e,$e2,$23,$e2,$ee,$22,$1e,$4e,$e2,$21,$e3,$ee,$32,$1e,$3e,$e3,$21,$e4,$ee,$10,$3e,$4e,$e1,$3,$e4,$ee,$12,$3e,$3e,$de,$9e,$de,$9e,$ce,$ae,$ce,$a7
frame523: .byte $57,$1f,$ee,$12,$fe,$13,$fe,$21,$ff,$fe,$22,$71,$f7,$25,$7f,$32,$3b,$f1,$3,$de,$e5,$3,$de,$e5,$3,$de,$e4,$33,$de,$e3,$23,$e1,$ee,$32,$3e,$1e,$e2,$33,$e1,$ee,$24,$3d,$ee,$24,$4c,$ee,$25,$2d,$ee,$25,$1e,$1e,$e2,$51,$e1,$ee,$22,$1e,$4e,$e2,$3,$e2,$ee,$3e,$6e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$22,$1e,$4e,$e1,$1,$e5,$ed,$e9,$ec,$ea,$ec,$ea,$ec,$ea,$61
frame524: .byte $54,$1f,$ff,$fe,$e2,$1f,$e2,$3f,$e1,$3e,$11,$71,$f7,$33,$8f,$32,$3a,$f2,$3,$cf,$10,$3d,$ee,$50,$3d,$ee,$50,$3e,$1e,$e4,$3,$e1,$ee,$33,$2e,$1e,$e3,$23,$e1,$ee,$33,$3d,$ee,$23,$4d,$ee,$15,$3d,$ee,$15,$2e,$1e,$e1,$52,$e1,$ee,$24,$1e,$1e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e8,$ed,$e9,$ec,$ea,$ec,$ea,$ec,$ea,$61
frame525: .byte $4e,$1f,$ff,$ff,$ff,$fe,$a1,$eb,$2e,$68,$e6,$2d,$1,$bf,$20,$3c,$f1,$21,$df,$12,$1e,$1e,$e5,$3,$de,$e5,$3,$e1,$ee,$40,$3e,$1e,$e3,$32,$e1,$ed,$10,$c3,$e1,$ec,$1,$33,$de,$b7,$4d,$eb,$74,$ce,$d6,$3d,$ee,$15,$2e,$1e,$e2,$42,$e1,$ee,$1e,$8e,$e1,$e8,$ed,$e9,$ed,$e9,$ed,$e9,$ee,$1e,$9e,$de,$9e,$de,$9e,$de,$9e,$de,$96
frame526: .byte $50,$1f,$ff,$ff,$ff,$fe,$a1,$fd,$9f,$7b,$f1,$1,$de,$82,$92,$1d,$e7,$39,$21,$e1,$ee,$52,$1e,$1e,$e4,$23,$de,$e4,$23,$de,$e4,$23,$de,$82,$72,$3d,$e8,$45,$24,$ce,$85,$42,$4c,$e8,$63,$24,$ce,$96,$c,$3d,$eb,$51,$3,$e1,$ea,$eb,$eb,$eb,$eb,$ec,$e9,$ed,$e9,$ed,$ea,$ec,$ea,$ec,$ea,$91,$e2,$ea,$82,$e2,$eb,$73,$e1,$ec,$54,$e1,$71
frame527: .byte $5b,$1f,$e3,$2f,$e2,$2f,$e2,$3f,$ff,$ee,$51,$fe,$18,$f8,$bf,$10,$3c,$f1,$3,$de,$83,$70,$3e,$1e,$73,$70,$3e,$1e,$e4,$23,$de,$e4,$3,$e1,$ee,$42,$3d,$e5,$1a,$33,$de,$45,$73,$4c,$e5,$56,$34,$ce,$56,$53,$4c,$72,$c6,$23,$3d,$74,$b5,$24,$1e,$17,$59,$71,$e5,$86,$8e,$d8,$58,$ee,$1e,$8e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$b1,$e3,$e7,$a3,$e2,$e8,$93,$e2,$e9,$84,$e1,$ea,$74,$e1,$71
frame528: .byte $5d,$12,$6f,$b6,$fb,$7f,$a7,$fa,$8f,$98,$e7,$3e,$48,$e5,$8e,$18,$e4,$bb,$9b,$32,$cc,$11,$6b,$1,$e1,$d6,$b0,$3e,$1e,$15,$b2,$3e,$1d,$79,$23,$e1,$c8,$92,$3e,$1b,$8a,$23,$e1,$a9,$a2,$4d,$9c,$82,$5c,$9d,$72,$5c,$8e,$44,$25,$c7,$e5,$42,$4d,$7e,$63,$e5,$8e,$72,$e5,$8e,$81,$e5,$8f,$98,$fa,$7f,$a7,$eb,$1e,$37,$ea,$2e,$37,$ea,$3e,$28,$92,$b3,$e2,$c4,$3b,$4e,$1c,$45,$61,$24,$e1,$71
frame529: .byte $58,$1a,$5f,$b7,$fa,$7f,$aa,$f7,$e4,$ee,$5a,$43,$25,$eb,$b6,$ae,$87,$9c,$e7,$74,$32,$ce,$77,$40,$3e,$1e,$57,$50,$3e,$1e,$75,$50,$3e,$2e,$65,$52,$3e,$1e,$66,$42,$3e,$1e,$58,$32,$3e,$1e,$4a,$c,$4d,$e3,$c1,$25,$ce,$1e,$45,$c9,$ea,$4c,$8e,$d1,$c9,$f8,$9f,$89,$f8,$af,$7b,$f6,$cf,$6d,$e5,$1e,$3e,$89,$2e,$3e,$89,$3e,$2e,$89,$3e,$2e,$7a,$4e,$1e,$77,$12,$4e,$18
frame530: .byte $4b,$1e,$40,$13,$fa,$8f,$97,$f7,$9f,$7b,$f6,$a1,$5f,$2e,$4e,$e3,$1,$e3,$ee,$10,$1e,$5e,$d2,$1e,$7e,$e3,$e6,$ee,$4e,$5e,$e4,$41,$de,$e4,$e5,$ee,$3e,$7e,$e2,$e7,$ee,$1e,$7e,$e1,$e8,$ee,$1e,$8e,$de,$9e,$ce,$ae,$be,$be,$be,$be,$ae,$ce,$ae,$ce,$ae,$ce,$be,$ce,$ce,$ae,$e1,$e8,$ee,$3e,$6e,$e3,$e6,$ee,$4e,$5c
frame531: .byte $3b,$1e,$52,$14,$f9,$9f,$98,$f9,$8f,$98,$fa,$bf,$6b,$f6,$9f,$88,$fb,$7f,$a8,$f9,$8f,$98,$f9,$8f,$98,$f8,$9f,$7a,$f6,$cf,$3e,$3e,$e3,$e8,$ec,$ec,$e9,$ed,$e8,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e9,$ec,$ee,$1e,$7f,$38,$fa,$7f,$98,$f8,$9e,$51
frame532: .byte $3a,$1e,$92,$fe,$14,$fd,$7f,$ab,$f7,$af,$59,$f8,$9f,$7a,$f7,$af,$7a,$f9,$8f,$a7,$fa,$7f,$a6,$fb,$7f,$a7,$f9,$af,$7a,$f7,$bf,$6c,$f5,$cf,$4e,$1f,$2e,$3e,$e5,$e5,$ee,$4e,$5e,$e3,$e6,$ee,$3e,$7e,$e2,$e7,$f1,$e3,$f3,$55,$1f,$65,$fc,$6e,$51
frame533: .byte $4b,$1e,$d3,$fd,$6f,$b6,$fb,$7f,$b7,$f9,$8f,$8a,$ee,$52,$1e,$1e,$e5,$82,$7f,$14,$57,$f5,$3,$9f,$40,$19,$f4,$1,$9f,$40,$39,$f4,$20,$82,$9e,$e5,$53,$be,$e3,$52,$73,$4e,$d5,$18,$71,$ed,$41,$af,$2e,$2f,$2e,$2f,$2e,$2e,$e5,$e5,$ee,$1e,$8e,$de,$9e,$de,$ae,$ce,$be,$ce,$be,$ce,$ae,$e1,$e8,$ee,$4e,$5f,$1e,$28
frame534: .byte $4a,$1f,$26,$fb,$7f,$a8,$f9,$9f,$98,$f8,$9f,$89,$f8,$af,$6c,$f5,$1,$9e,$c2,$82,$39,$eb,$37,$23,$ae,$a2,$80,$3b,$ea,$28,$3,$9e,$c5,$44,$18,$ed,$ea,$eb,$38,$de,$b4,$8c,$eb,$4a,$ae,$b4,$9c,$ea,$48,$de,$a4,$7e,$1e,$b2,$7e,$2e,$b2,$60,$1c,$f4,$df,$4d,$f3,$e1,$f3,$e1,$f3,$e1,$f2,$e2,$f2,$e2,$f2,$e2,$11
frame535: .byte $54,$1f,$d3,$fe,$13,$fe,$13,$fe,$13,$fd,$4f,$d4,$fd,$4f,$c0,$11,$fc,$3f,$d3,$ed,$2e,$43,$21,$ea,$3e,$23,$e,$ea,$2e,$33,$c,$ea,$2e,$23,$41,$ea,$2e,$13,$33,$ea,$2e,$13,$24,$e9,$3d,$33,$3e,$a4,$b4,$15,$ea,$4b,$1,$6e,$a4,$e2,$5e,$b4,$44,$84,$eb,$44,$e2,$ed,$26,$ce,$e2,$3b,$5f,$5a,$71,$ee,$46,$b1,$fe,$22,$fe,$13,$fe,$13,$fd,$4f,$c5,$fc,$51
frame536: .byte $2e,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f5,$3f,$e1,$3f,$e1,$3f,$e1,$3f,$e1,$3f,$e1,$3f,$d4,$fd,$4f,$d4,$fd,$4f,$d4,$e8,$2e,$75,$e4,$6e,$84,$e4,$6e,$92,$e5,$3e,$b4,$ff,$ff,$ff,$ff,$ff,$fe,$51
frame537: .byte $2e,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$52,$fe,$14,$fe,$13,$fe,$12,$fe,$13,$fe,$14,$fd,$4f,$d3,$fd,$4f,$d5,$fc,$5f,$c5,$fc,$5e,$a1,$e6,$5e,$a1,$e6,$5f,$c5,$fe,$12,$fd,$5f,$ff,$ff,$ff,$fe,$31
frame538: .byte $2d,$1f,$ff,$ff,$ff,$ff,$ff,$fe,$e2,$3f,$e1,$4f,$d5,$fd,$3f,$e1,$3f,$d4,$fd,$4f,$d5,$fc,$5f,$c4,$fc,$5f,$c6,$fb,$6f,$b6,$fa,$7f,$a7,$fa,$7f,$a7,$fa,$7f,$a7,$fa,$7f,$c4,$fb,$7f,$b6,$ed
frame539: .byte $2e,$1f,$ff,$ff,$ff,$ff,$ea,$3f,$d5,$fc,$6f,$c5,$fc,$5f,$c4,$fc,$5f,$c5,$fc,$5f,$c5,$fc,$5f,$c5,$fb,$6f,$b6,$fb,$6f,$b7,$fa,$7f,$98,$f9,$8f,$98,$f9,$8f,$99,$f8,$9f,$89,$f8,$9f,$89,$ee,$11
frame540: .byte $2e,$1f,$ff,$ff,$ff,$ff,$e8,$5f,$c5,$fc,$6f,$b6,$fc,$5f,$c4,$fc,$5f,$b6,$fb,$6f,$c5,$fc,$5f,$c5,$fb,$6f,$b5,$fc,$6f,$a7,$fa,$7f,$a8,$f9,$8f,$98,$f9,$8f,$8a,$f7,$af,$7a,$f7,$af,$7a,$ee,$21
frame541: .byte $32,$1f,$ff,$ff,$ff,$f4,$4f,$c6,$fb,$6f,$b7,$fb,$6f,$b5,$fc,$4f,$c5,$fc,$5f,$c6,$fb,$6f,$b7,$fa,$6f,$b6,$fa,$6f,$b7,$fa,$7f,$a7,$f9,$9f,$89,$f8,$9f,$89,$f8,$9e,$c4,$aa,$eb,$4a,$ae,$a5,$aa,$e8,$79,$be,$78
frame542: .byte $2e,$1f,$ff,$ff,$ff,$ff,$e7,$5f,$c6,$fb,$7f,$b6,$fc,$4f,$c4,$fd,$4f,$c6,$fb,$6f,$c5,$fc,$5f,$b6,$fb,$5f,$c5,$fc,$6f,$a7,$fa,$7f,$a8,$f9,$8f,$98,$f9,$8f,$98,$f8,$af,$7a,$f7,$af,$7a,$ee,$21
frame543: .byte $33,$1f,$ff,$ff,$ff,$ff,$e8,$4f,$d5,$fc,$6f,$b6,$fc,$5f,$c3,$fd,$5f,$b6,$fb,$6f,$b6,$fc,$5f,$b6,$fb,$5f,$b6,$fb,$7f,$a7,$fa,$7f,$a7,$f9,$9f,$89,$f8,$9f,$89,$f8,$9e,$65,$e2,$9e,$65,$e2,$ae,$46,$e1,$be,$19,$51
frame544: .byte $2e,$1f,$ff,$ff,$ff,$ff,$e7,$5f,$c6,$fb,$6f,$c5,$fc,$5f,$c4,$fd,$4f,$c5,$fb,$7f,$b6,$fb,$6f,$b6,$fb,$6f,$a6,$fb,$6f,$b7,$fa,$7f,$98,$f9,$9f,$89,$f8,$9f,$89,$f8,$9f,$89,$f8,$9f,$89,$ee,$31
frame545: .byte $30,$1f,$ff,$ff,$ff,$ff,$e9,$2f,$d5,$fc,$6f,$b6,$fc,$5f,$c4,$fd,$4f,$c5,$fc,$6f,$b6,$fb,$6f,$b6,$fb,$6f,$b5,$fb,$7f,$a7,$fa,$7f,$98,$f9,$9f,$89,$f8,$9f,$89,$f7,$af,$7a,$f7,$ae,$14,$e7,$ae,$15,$a1
frame546: .byte $45,$1f,$ff,$ff,$ff,$ff,$e8,$5f,$b6,$fc,$6f,$b6,$fc,$4f,$d3,$e3,$1e,$e1,$5c,$4e,$d6,$c5,$ec,$6d,$7e,$a5,$b9,$ea,$5a,$8e,$b6,$b7,$eb,$5e,$24,$eb,$6d,$6e,$a6,$c8,$e8,$7c,$21,$5e,$88,$b2,$16,$e7,$8b,$9e,$78,$c6,$e9,$8d,$5e,$89,$d6,$e7,$9c,$7e,$7a,$a8,$e7,$aa,$8e,$7a,$c5,$e8,$ac,$4c
frame547: .byte $48,$1f,$ff,$ff,$ff,$ff,$e8,$4f,$d5,$fc,$6f,$b6,$fc,$5f,$c4,$fc,$5e,$11,$ee,$25,$c4,$ed,$6c,$7e,$a6,$c8,$ea,$56,$32,$84,$1e,$65,$5d,$26,$e3,$67,$e5,$e4,$5c,$9e,$96,$e1,$4e,$a7,$e1,$4e,$a7,$e2,$4e,$98,$e1,$4e,$98,$e1,$4e,$98,$d5,$e9,$8d,$5e,$8a,$c6,$e7,$ab,$7e,$7a,$b7,$e7,$ab,$7e,$7a,$d4,$b1
frame548: .byte $45,$1f,$ff,$ff,$ff,$ff,$e8,$5f,$c6,$fb,$6f,$b6,$fc,$5f,$c4,$fd,$4f,$c5,$c4,$ed,$6c,$7e,$b5,$c8,$ea,$56,$41,$83,$2e,$65,$7b,$25,$e4,$59,$e3,$e5,$5c,$9e,$87,$e1,$4e,$a7,$e1,$4e,$a8,$d5,$e9,$8e,$14,$e9,$8e,$14,$e9,$8d,$5e,$99,$c5,$e9,$9b,$7e,$7a,$b7,$e7,$ab,$7e,$7a,$b7,$e7,$ad,$4b
frame549: .byte $46,$1f,$ff,$ff,$ff,$ff,$e8,$4f,$d5,$fc,$6f,$b6,$fc,$5f,$c4,$fc,$5f,$c5,$c4,$ed,$6c,$7e,$a6,$c8,$ea,$56,$32,$83,$2e,$65,$6c,$26,$e3,$59,$e4,$e4,$5c,$9e,$87,$e1,$4e,$a7,$e1,$4e,$a7,$e2,$4e,$98,$e1,$4e,$98,$e1,$4e,$98,$d5,$e9,$8d,$5e,$99,$b7,$e7,$ab,$7e,$7a,$b7,$e7,$ab,$7e,$7a,$d4,$b1
frame550: .byte $46,$1f,$ff,$ff,$ff,$ff,$e8,$4f,$d5,$fc,$6f,$a7,$fa,$7f,$b5,$fc,$4f,$c6,$d4,$ec,$5e,$16,$ea,$5c,$9e,$95,$c9,$e9,$6b,$9e,$95,$d6,$ea,$6e,$15,$ea,$6e,$16,$e9,$6d,$7e,$97,$ac,$e6,$7a,$1,$9e,$48,$94,$15,$14,$e3,$99,$7,$50,$ee,$49,$c6,$e8,$9c,$6e,$89,$c7,$e7,$9c,$7e,$79,$c7,$e7,$ac,$5b
frame551: .byte $46,$1f,$ff,$ff,$ff,$ff,$e8,$4f,$d5,$fb,$6f,$b7,$fa,$7f,$b5,$fc,$4e,$52,$ea,$5e,$35,$e8,$6d,$8e,$86,$e1,$7e,$95,$e2,$6e,$95,$e2,$7e,$76,$e2,$41,$1e,$86,$e1,$5e,$a6,$e1,$5e,$97,$d7,$e8,$7d,$7e,$88,$c7,$e8,$8d,$6e,$88,$d5,$e9,$8d,$6e,$79,$d6,$e7,$ab,$7e,$7a,$b7,$e7,$ac,$7e,$6a,$d4,$c1
frame552: .byte $46,$1f,$ff,$ff,$ff,$ff,$e8,$3f,$d5,$fc,$6f,$b6,$fb,$6f,$c5,$fb,$5e,$52,$e9,$6e,$45,$e7,$6e,$18,$e7,$6e,$26,$e9,$5e,$26,$e8,$6e,$27,$e7,$6e,$30,$12,$e7,$5e,$34,$e9,$6e,$26,$e8,$7d,$7e,$87,$d8,$e7,$7d,$7e,$88,$d6,$e7,$9d,$5e,$89,$d5,$e8,$9d,$5e,$89,$d6,$e7,$9d,$6e,$79,$d6,$e7,$ac,$5c
frame553: .byte $46,$1f,$ff,$ff,$ff,$ff,$e8,$3f,$d5,$fc,$6f,$a7,$fb,$7f,$b5,$fb,$5e,$52,$e9,$6e,$45,$e7,$6e,$18,$e7,$6e,$26,$e9,$5e,$26,$e8,$6e,$27,$e7,$6e,$30,$12,$e7,$6e,$24,$e9,$7e,$16,$e8,$7d,$7e,$87,$d8,$e7,$7d,$7e,$88,$d6,$e7,$9d,$5e,$89,$d5,$e8,$9d,$5e,$89,$d6,$e7,$9d,$6e,$79,$d6,$e7,$ac,$5c
frame554: .byte $46,$1f,$ff,$ff,$ff,$ff,$e8,$3f,$d5,$fc,$6f,$a7,$fb,$7f,$b5,$fb,$5e,$52,$ea,$5e,$45,$e7,$6e,$18,$e7,$7e,$16,$e9,$6e,$16,$e8,$7e,$17,$e7,$7e,$20,$12,$e7,$6e,$24,$e9,$7e,$16,$e8,$7d,$7e,$87,$d8,$e7,$7d,$7e,$88,$d6,$e7,$9d,$5e,$89,$d5,$e8,$9d,$5e,$89,$d6,$e7,$9d,$6e,$79,$d6,$e6,$bc,$5c
frame555: .byte $46,$1f,$ff,$ff,$ff,$f5,$1f,$e2,$5f,$b7,$fa,$7f,$99,$f8,$9f,$97,$e2,$3e,$b5,$e2,$5e,$97,$a9,$e9,$7a,$9e,$89,$a8,$e8,$9b,$8e,$85,$8,$a8,$e8,$50,$8b,$4e,$a9,$b5,$ea,$9a,$6e,$a8,$b7,$e8,$9a,$8e,$88,$b9,$e7,$8b,$9e,$78,$b9,$e6,$9c,$7e,$7a,$b7,$e7,$ab,$7e,$7a,$b7,$e6,$bb,$8e,$5b,$b8,$a1
frame556: .byte $4f,$1f,$ff,$ff,$16,$fa,$9f,$89,$f8,$af,$7a,$f7,$bf,$5c,$75,$eb,$b8,$6e,$c8,$96,$ed,$66,$9e,$d9,$2d,$ea,$a2,$e2,$e8,$b2,$e1,$e7,$c4,$ce,$6e,$14,$be,$7d,$47,$ec,$71,$53,$7e,$c6,$24,$47,$ec,$61,$53,$8e,$b7,$14,$48,$eb,$c3,$ae,$ab,$42,$19,$e7,$c3,$41,$9e,$6b,$4e,$1e,$6a,$5e,$2e,$4b,$5a,$c,$e5,$c4,$be,$8c,$5a,$e8,$c5,$ac
frame557: .byte $47,$1f,$ff,$e3,$1f,$e2,$8f,$8b,$f6,$bf,$5d,$f5,$d3,$2e,$e4,$d2,$7e,$de,$11,$8e,$ce,$11,$8e,$cd,$19,$ec,$e9,$ee,$2e,$8e,$e1,$ea,$ec,$ec,$e9,$ee,$1e,$7e,$e2,$e7,$ee,$1e,$7e,$9e,$ce,$ae,$ce,$ae,$de,$8e,$e2,$e8,$ee,$18,$1c,$ee,$1e,$9e,$de,$9e,$ce,$ae,$ce,$ae,$be,$41,$6e,$bc,$1c,$ea,$c2,$bd
frame558: .byte $49,$1f,$ff,$e3,$1f,$e2,$8f,$8b,$f6,$bf,$5d,$f5,$d3,$2e,$e4,$d2,$7e,$de,$11,$8e,$ce,$11,$9e,$bd,$19,$ec,$c2,$8e,$de,$ae,$e1,$e8,$ee,$1e,$ae,$ce,$ce,$9e,$e1,$e7,$ee,$2e,$6e,$a2,$3e,$6e,$ae,$ce,$ae,$de,$9e,$e1,$e7,$ee,$28,$1b,$ee,$2e,$8e,$e1,$e9,$ec,$ea,$ec,$ea,$eb,$eb,$eb,$eb,$eb,$c1,$41,$6e,$11
frame559: .byte $46,$1f,$ff,$ff,$17,$f9,$bf,$6b,$f5,$df,$5d,$32,$ee,$4d,$27,$ed,$e1,$19,$eb,$e1,$19,$eb,$d1,$9e,$bd,$28,$ed,$ea,$ee,$1e,$8e,$e1,$e9,$ed,$eb,$ea,$ee,$1e,$7e,$e2,$e6,$e9,$51,$e6,$ea,$ec,$ea,$ed,$e8,$ee,$2e,$7e,$e2,$81,$be,$e2,$e8,$ee,$1e,$9e,$de,$9e,$ce,$ae,$be,$be,$be,$be,$bc,$1b,$e1
frame560: .byte $4b,$17,$df,$4e,$2f,$2e,$2f,$1e,$4e,$e5,$e5,$ee,$4e,$53,$7e,$8e,$52,$ae,$5e,$51,$ce,$4f,$1e,$3f,$1e,$3e,$e5,$e3,$ee,$5e,$5e,$e4,$e7,$ee,$2e,$8e,$e2,$e7,$ee,$3e,$5f,$2e,$1f,$4c,$f6,$bf,$6a,$f7,$9e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$3e,$7e,$e2,$e8,$ee,$1e,$8e,$e2,$e7,$ee,$2e,$7e,$e3,$e6,$ee,$3e,$5e,$e4,$b1
frame561: .byte $1c,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$6f,$7a,$ff,$f2,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$91
frame562: .byte $1b,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$af,$e4,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f7
frame563: .byte $1e,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$a8,$f1,$85,$8e,$a5,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e2
frame564: .byte $31,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e8,$3,$3f,$65,$55,$ee,$46,$87,$ec,$89,$9e,$6a,$ac,$ce,$1a,$e1,$cc,$ab,$e4,$b9,$ae,$79,$89,$eb,$94,$ae,$de,$8e,$e3,$e4,$f2,$df,$78,$ff,$ff,$ff,$ff,$ff,$fe,$11
frame565: .byte $30,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$48,$f6,$e1,$f1,$e5,$ee,$38,$49,$ec,$88,$ae,$7a,$9b,$e3,$ba,$da,$e2,$ae,$3a,$ca,$be,$5a,$8a,$e9,$97,$9e,$c8,$49,$ee,$3e,$4f,$3c,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e2
frame566: .byte $2a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$45,$26,$f1,$66,$7e,$d8,$8a,$e6,$b9,$ca,$e4,$9e,$3a,$d9,$be,$69,$89,$ed,$66,$7f,$24,$26,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$51
frame567: .byte $2e,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3,$e3,$ee,$39,$49,$ea,$a7,$ce,$2e,$18,$e2,$6e,$5a,$e5,$1e,$6a,$e6,$3e,$3a,$e1,$cd,$8c,$e6,$a7,$9e,$d7,$47,$fa,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f5
frame568: .byte $2e,$1f,$ff,$ff,$ff,$ff,$ff,$9e,$7e,$be,$e2,$e3,$f5,$9f,$c2,$ea,$2f,$c8,$f8,$af,$7b,$f5,$cf,$5c,$f5,$cf,$6b,$f6,$ae,$42,$e7,$8e,$2a,$e5,$2e,$2e,$5e,$de,$e3,$df,$ff,$ff,$ff,$ff,$ff,$fe,$e3
frame569: .byte $3a,$1e,$8e,$ae,$8e,$e4,$e1,$f3,$bf,$68,$f9,$6f,$b3,$fe,$11,$ff,$fe,$c7,$f8,$af,$6c,$f4,$e1,$f3,$e1,$f2,$e2,$f3,$e1,$f3,$e2,$f2,$e1,$f4,$cf,$6b,$f7,$9e,$31,$ec,$2e,$53,$fc,$5f,$98,$f7,$af,$3e,$1e,$e5,$e4,$ed,$e9,$e7,$ee,$25,$ff,$ff,$e2
frame570: .byte $4a,$18,$f3,$cf,$5a,$f7,$9f,$87,$fa,$6f,$c4,$fd,$4f,$d4,$fd,$4e,$73,$e8,$4e,$59,$e4,$4e,$3d,$e2,$4e,$3e,$1e,$14,$e3,$e2,$d4,$e2,$e3,$d4,$e2,$e4,$c4,$e2,$e4,$b5,$e1,$e5,$b5,$be,$8b,$5a,$e9,$a6,$ae,$8a,$79,$a1,$9c,$79,$93,$7c,$8a,$7e,$99,$c4,$e9,$af,$6b,$f5,$cf,$4d,$f3,$e1,$f1,$e3,$ee,$5e,$4e,$e4,$e5
frame571: .byte $38,$e6,$ee,$3e,$7e,$e2,$e7,$ee,$2e,$8e,$de,$ae,$be,$ce,$ae,$de,$8e,$e3,$e5,$ee,$5e,$2f,$77,$ff,$ff,$ff,$f7,$2f,$d5,$f8,$af,$6c,$f4,$e2,$f2,$e2,$f2,$e3,$f3,$e1,$f4,$cf,$4a,$f7,$5f,$b6,$fa,$6f,$a6,$fa,$7f,$98,$f8,$9f,$89,$ee,$21
frame572: .byte $33,$e5,$e2,$f2,$e1,$f3,$e1,$f4,$df,$4c,$f6,$af,$89,$f8,$8f,$a5,$fd,$3f,$e1,$2f,$ff,$ff,$f5,$1f,$e2,$3f,$e1,$4f,$c8,$f7,$cf,$4d,$f4,$af,$a3,$fe,$14,$fd,$4f,$d4,$fc,$5f,$c4,$fd,$4f,$d4,$fc,$6f,$b6,$fa,$8e,$81
frame573: .byte $33,$e7,$7f,$a7,$f9,$8f,$99,$f8,$8f,$a7,$fa,$7f,$b6,$fb,$5f,$d3,$fe,$21,$ff,$ff,$ff,$61,$fe,$24,$fd,$7f,$9a,$f5,$bf,$5a,$f8,$12,$3f,$e1,$3f,$e1,$3f,$e1,$4f,$d4,$fd,$4f,$d4,$fc,$5f,$c5,$fc,$6f,$a8,$f9,$7e,$71
frame574: .byte $31,$e8,$6f,$a7,$fa,$7f,$a7,$fa,$7f,$a7,$fb,$6f,$b5,$fd,$3f,$e2,$1f,$ff,$ff,$f5,$1f,$e2,$4f,$d7,$f9,$af,$5b,$f5,$af,$81,$23,$fe,$14,$fd,$3f,$e1,$4f,$d5,$fc,$5f,$b6,$fb,$5f,$b6,$fb,$7f,$a7,$fb,$6f,$f7
frame575: .byte $30,$e8,$6f,$a7,$fa,$7f,$a7,$fa,$7f,$b6,$fc,$4f,$d3,$fe,$21,$ff,$ff,$ff,$42,$fe,$24,$fc,$8f,$8a,$f6,$af,$69,$fb,$4f,$e1,$3f,$e1,$3f,$d4,$fd,$3f,$e1,$4f,$d4,$fc,$5f,$b6,$fb,$7f,$98,$fb,$6f,$ff,$ec
frame576: .byte $30,$e7,$7f,$a8,$f9,$8f,$97,$fb,$6f,$c4,$fe,$12,$ff,$ff,$ff,$41,$fe,$23,$fe,$15,$fb,$9f,$6b,$f5,$af,$77,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$c5,$fc,$6f,$a7,$fb,$6f,$d2,$fe,$31,$ff,$fe,$e1
frame577: .byte $2e,$e7,$7f,$a8,$f9,$7f,$b6,$fc,$4f,$e1,$2f,$e2,$1f,$ff,$fe,$61,$fe,$24,$fd,$6f,$a9,$f7,$af,$69,$f8,$7f,$c4,$fd,$4f,$d5,$fc,$5f,$b6,$fc,$5f,$c5,$fc,$5f,$b6,$fa,$8f,$a6,$ff,$ff,$ff,$ff,$e1
frame578: .byte $2f,$e8,$6f,$b6,$fb,$6f,$c4,$fe,$12,$fe,$22,$ff,$ff,$ff,$52,$fe,$14,$fd,$8f,$7b,$f5,$bf,$59,$fa,$5f,$d4,$fe,$14,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$5f,$b6,$fb,$7f,$a7,$fa,$6f,$e1,$1f,$ff,$ff,$fe,$e2
frame579: .byte $2e,$e9,$4f,$d4,$fd,$4f,$e1,$2f,$e2,$2f,$ff,$ff,$ff,$e9,$2f,$e1,$4f,$d8,$f8,$af,$5b,$f6,$af,$81,$7,$fe,$14,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$d4,$fc,$6f,$b7,$fa,$7f,$b4,$ff,$ff,$ff,$ff,$d1
frame580: .byte $2c,$ea,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$ff,$ff,$ff,$ff,$82,$fe,$14,$fd,$8f,$8a,$f5,$cf,$59,$fb,$3f,$e1,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$c6,$fb,$7f,$a7,$fb,$4f,$ff,$ff,$ff,$fd
frame581: .byte $2a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e8,$2f,$e1,$4f,$d8,$f8,$af,$5a,$f7,$8f,$a1,$14,$fd,$4f,$e1,$3f,$e1,$3f,$d5,$fc,$5f,$b6,$fb,$5f,$c5,$fb,$7f,$a7,$fc,$4f,$ff,$ff,$ff,$fe,$11
frame582: .byte $2d,$ff,$ff,$ff,$ff,$ff,$fe,$51,$fe,$32,$fe,$14,$fd,$8f,$7c,$f4,$df,$3d,$f4,$af,$a5,$fd,$4f,$d4,$fc,$5f,$c5,$fc,$4f,$d4,$fd,$4f,$c6,$fa,$7f,$98,$f9,$9f,$89,$fa,$6f,$e3,$1f,$e1,$1f,$fa
frame583: .byte $3c,$ff,$e4,$1f,$e3,$1f,$c5,$fb,$8f,$98,$f8,$9f,$2e,$3e,$e4,$e5,$ee,$2e,$8e,$e3,$e8,$ee,$1e,$9e,$e4,$e6,$ee,$5e,$5e,$e3,$e6,$ee,$37,$49,$ee,$27,$62,$f2,$7f,$98,$fa,$7f,$a8,$fa,$7f,$98,$f9,$9f,$79,$f8,$af,$7a,$f6,$bf,$6a,$f7,$af,$6b,$f6,$be,$51
frame584: .byte $4c,$f8,$1f,$e2,$2f,$a6,$f9,$8e,$e2,$65,$ae,$ce,$be,$de,$9e,$de,$9e,$e4,$e5,$ee,$5e,$3e,$e5,$e4,$ee,$4e,$6e,$e5,$e5,$ee,$5e,$5e,$e3,$83,$9e,$e1,$11,$74,$9e,$e2,$76,$7e,$c1,$27,$77,$ea,$8,$78,$6e,$90,$c8,$90,$82,$e8,$21,$9e,$11,$e9,$bd,$1e,$bb,$f7,$af,$7a,$f5,$cf,$42,$1b,$f6,$bf,$6b,$f6,$bf,$6b,$f6,$ae,$21
frame585: .byte $52,$e5,$e1,$2d,$e6,$ee,$3e,$51,$2e,$e2,$e9,$ed,$ea,$ec,$ea,$ec,$ea,$ec,$eb,$eb,$ea,$eb,$e9,$ed,$ea,$ed,$ea,$ec,$eb,$eb,$eb,$a2,$ce,$ba,$3b,$eb,$11,$84,$ae,$13,$71,$19,$49,$c9,$3b,$58,$da,$1b,$94,$e1,$e8,$a3,$e2,$e7,$71,$41,$e3,$e6,$a3,$e3,$e6,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$6e,$e4,$e5,$ee,$3e,$7f,$2e,$2f,$1e,$3b
frame586: .byte $50,$e3,$ee,$5e,$51,$2e,$e2,$e7,$ee,$2e,$9e,$de,$9e,$de,$ae,$be,$be,$be,$be,$be,$ae,$de,$9e,$de,$7e,$e2,$e7,$ee,$2e,$8c,$2d,$ea,$a3,$ce,$ab,$3b,$e3,$e5,$4a,$e1,$e7,$77,$e1,$e7,$95,$e2,$e6,$a4,$e3,$e6,$a3,$e4,$e5,$c1,$e6,$e3,$f2,$e2,$f2,$e3,$ee,$5e,$4f,$1e,$3f,$1e,$3e,$e5,$21,$e2,$ee,$30,$ce,$2f,$2e,$2f,$2e,$3e,$e5,$e4,$a1
frame587: .byte $55,$e4,$11,$ee,$3e,$7e,$e2,$e9,$ed,$ea,$ec,$ea,$ec,$eb,$eb,$ea,$ec,$ea,$ec,$e7,$11,$ed,$e2,$f2,$df,$4c,$f5,$be,$92,$da,$a2,$b3,$cb,$84,$b3,$bd,$56,$a4,$ae,$23,$6a,$77,$e3,$26,$a9,$5e,$24,$5a,$b3,$e3,$35,$ac,$2e,$42,$4c,$c1,$e4,$32,$de,$e5,$c,$de,$e5,$e4,$ee,$5e,$5e,$e5,$e4,$ee,$5e,$4e,$e4,$c,$e2,$ee,$30,$8e,$2f,$2e,$3f,$1e,$3e,$e5,$e4,$a1
frame588: .byte $57,$e3,$11,$ee,$4e,$31,$2e,$e3,$e8,$ee,$1e,$9e,$de,$9e,$de,$ce,$9e,$de,$ae,$ae,$ce,$72,$1e,$ce,$6e,$e3,$e5,$12,$ee,$1e,$40,$8d,$1d,$e3,$15,$c3,$be,$22,$6b,$3b,$e1,$37,$b4,$9d,$47,$b7,$6d,$38,$b9,$4d,$36,$da,$3e,$14,$4d,$b2,$e2,$52,$de,$e3,$e7,$ee,$3e,$6f,$4d,$f3,$e1,$f3,$e1,$f2,$e3,$ee,$52,$1e,$1e,$e4,$23,$de,$e3,$23,$e2,$f2,$e2,$f2,$e3,$f1,$e3,$91
frame589: .byte $52,$f1,$e3,$f1,$e3,$f2,$e2,$f4,$df,$2e,$2f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$35,$3e,$be,$35,$4e,$ae,$34,$6e,$be,$13,$8e,$bd,$39,$eb,$c3,$9e,$ad,$2b,$e9,$d2,$ce,$32,$3d,$2f,$e2,$2f,$e2,$2e,$4a,$e6,$2e,$3e,$3e,$12,$ce,$8d,$2b,$e8,$e1,$39,$e8,$e2,$38,$e9,$e2,$46,$e9,$e3,$45,$e9,$e4,$53,$e9,$32,$d6,$2e,$83,$3d,$ee,$32,$4d,$f3,$e1,$f3,$e1
frame590: .byte $3a,$ff,$fe,$61,$fe,$23,$fd,$5f,$b7,$fa,$8f,$8a,$f7,$af,$6c,$f5,$df,$4e,$1f,$3e,$2f,$1e,$4e,$71,$ae,$52,$e5,$af,$7a,$f7,$af,$7a,$ec,$ea,$ea,$ec,$e4,$1,$ee,$1e,$3f,$2e,$1f,$3e,$1f,$3d,$f5,$bf,$6a,$f8,$8f,$a7,$fa,$6f,$c4,$fe,$12,$ee,$31
frame591: .byte $43,$e7,$5f,$c6,$fa,$8f,$8a,$f7,$bf,$5d,$f4,$e1,$f3,$e2,$f2,$e3,$ee,$5e,$5e,$e4,$e6,$ee,$3e,$7e,$e2,$e8,$47,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$f1,$e3,$ee,$5e,$4e,$e3,$e6,$e8,$33,$e8,$e7,$ee,$3e,$6e,$e3,$e5,$ee,$4e,$4f,$1e,$2f,$2e,$2f,$2e,$1f,$4c,$f5,$bf,$7a,$f8,$8e,$61
frame592: .byte $32,$ee,$49,$f9,$af,$99,$fa,$8f,$a9,$fa,$8f,$b8,$fa,$7e,$73,$e7,$5e,$73,$e9,$3e,$82,$ea,$2e,$73,$fe,$14,$fd,$3f,$d4,$fd,$4f,$d5,$fc,$5f,$c6,$fb,$6f,$b5,$fc,$4f,$e3,$1f,$e3,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$61
frame593: .byte $2c,$fc,$5f,$e1,$3f,$e2,$2f,$ff,$ff,$ff,$fd,$2f,$e2,$3f,$e1,$2f,$e2,$3f,$e1,$4f,$d3,$fd,$4f,$d4,$fd,$5f,$c5,$fc,$6f,$a7,$fa,$6f,$c0,$bf,$e3,$1f,$c0,$81,$ff,$ff,$ff,$ff,$ff,$ff,$f5
frame594: .byte $27,$ff,$ff,$ff,$ff,$ff,$ff,$f2,$3f,$e1,$3f,$e2,$2f,$e1,$4f,$d4,$fd,$4f,$c4,$fd,$4f,$d5,$fc,$5f,$c6,$fb,$7f,$98,$fa,$5f,$c0,$9f,$d1,$ff,$ff,$ff,$ff,$ff,$ff,$f8
frame595: .byte $32,$ff,$ff,$ff,$ff,$ff,$fe,$33,$fe,$14,$fc,$5f,$c4,$fd,$4f,$c6,$fb,$6f,$b5,$11,$fa,$5f,$b7,$fa,$7f,$b6,$fb,$6f,$a8,$f9,$8f,$98,$f8,$af,$7a,$f6,$cf,$5c,$f6,$8f,$a4,$12,$fa,$24,$1f,$a1,$51,$f9,$25,$1e,$a1
frame596: .byte $31,$ff,$ff,$ff,$ff,$ff,$fe,$34,$fd,$5f,$b5,$fc,$4f,$c5,$fb,$7f,$99,$f8,$9f,$78,$11,$f7,$9,$15,$fa,$6f,$b6,$fb,$6f,$b7,$fa,$7f,$a8,$f8,$9f,$7a,$f7,$af,$6c,$f5,$cf,$5c,$f5,$af,$84,$1,$fa,$24,$2e,$91
frame597: .byte $2f,$ff,$ff,$ff,$ff,$ff,$fe,$54,$fd,$4f,$c5,$fc,$4f,$c5,$fc,$6f,$b7,$f9,$8f,$96,$12,$f8,$8f,$97,$fb,$6f,$b6,$fb,$7f,$98,$f9,$8f,$99,$f7,$af,$7a,$f6,$cf,$5c,$f5,$cf,$69,$f9,$51,$1f,$a1,$51,$e8
frame598: .byte $30,$ff,$ff,$ff,$ff,$ff,$fe,$83,$fd,$5f,$c5,$fb,$4f,$d4,$fc,$6f,$a8,$f9,$9f,$86,$21,$f8,$21,$5f,$98,$fa,$6f,$b7,$fa,$7f,$a8,$f9,$8f,$89,$f8,$9f,$7b,$f5,$cf,$5d,$f4,$df,$59,$f9,$52,$1f,$92,$51,$e5
frame599: .byte $2f,$ff,$ff,$ff,$ff,$ff,$fe,$93,$fd,$5f,$b6,$fb,$4f,$d4,$fc,$6f,$a7,$fa,$7f,$a8,$f9,$21,$5f,$97,$fa,$7f,$a2,$15,$f9,$11,$6f,$b6,$fb,$6f,$a8,$f8,$9f,$7a,$f7,$af,$6c,$f6,$bf,$6b,$f7,$7f,$d3,$e6
frame600: .byte $35,$ff,$ff,$ff,$ff,$ff,$43,$fc,$5f,$c5,$fd,$4f,$61,$65,$f5,$43,$6f,$8a,$f9,$9f,$89,$f8,$53,$3f,$65,$62,$f4,$7f,$97,$fa,$7f,$a8,$f8,$af,$7c,$f5,$e2,$f1,$e3,$f1,$e2,$f1,$e3,$ee,$5e,$1f,$4d,$f8,$5f,$d1,$11,$fe,$13,$e7
frame601: .byte $37,$ff,$ff,$ff,$ff,$d4,$fc,$5f,$c5,$fc,$6f,$ba,$f3,$41,$ae,$e3,$12,$e6,$f2,$9f,$b4,$fd,$4f,$e1,$3f,$b6,$fb,$7f,$a7,$f4,$e2,$ee,$5e,$4f,$1e,$6e,$e4,$e6,$ee,$5e,$1f,$69,$fb,$4f,$d3,$fd,$d,$fd,$d,$fd,$9,$fd,$4f,$d0,$be,$a1
frame602: .byte $38,$ff,$ff,$ff,$ff,$fe,$e1,$6f,$b6,$fc,$4f,$d5,$fc,$42,$1f,$95,$42,$f5,$8f,$7b,$f5,$90,$3f,$94,$46,$f2,$5f,$b8,$f9,$8f,$99,$f7,$bf,$5c,$f4,$e1,$f1,$e5,$ee,$1e,$be,$be,$be,$ae,$ce,$ce,$9e,$e5,$e3,$f3,$af,$72,$41,$fa,$24,$2e,$a1
frame603: .byte $32,$ff,$ff,$ff,$ff,$fe,$e4,$1f,$d5,$fb,$6f,$c5,$fc,$5f,$b1,$14,$fb,$7f,$a8,$f8,$af,$7a,$f5,$df,$40,$e9,$f4,$21,$9f,$40,$c8,$f5,$12,$8f,$97,$f9,$9f,$89,$f7,$af,$6b,$f5,$cf,$5d,$f4,$df,$5d,$f5,$cf,$6b,$e9
frame604: .byte $2f,$ff,$ff,$ff,$ff,$e2,$1f,$d4,$fb,$8f,$97,$fa,$7f,$a8,$fa,$7f,$b6,$fb,$6f,$a8,$f9,$8f,$98,$f9,$8f,$99,$f8,$8f,$98,$f8,$af,$7a,$f6,$bf,$5a,$f6,$bf,$7b,$f5,$cf,$5d,$f3,$e1,$f3,$e1,$f3,$e1,$e7
frame605: .byte $41,$ff,$ff,$fe,$41,$fe,$22,$f6,$12,$7f,$7b,$f6,$df,$3c,$f5,$bf,$8a,$f7,$af,$89,$f8,$9f,$89,$f8,$11,$8f,$7a,$f6,$cf,$4e,$1f,$2e,$2f,$2e,$3f,$1e,$3f,$1e,$4e,$e5,$e4,$ee,$50,$ce,$1e,$e3,$32,$de,$e4,$32,$de,$e4,$e5,$ee,$3e,$6e,$e3,$21,$e2,$ee,$32,$3d,$ee,$40,$cd,$e4
frame606: .byte $38,$ff,$ff,$ff,$ec,$1c,$1f,$30,$c9,$f4,$df,$4e,$3e,$e5,$e3,$f1,$df,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f5,$df,$3e,$2f,$2e,$2f,$2e,$3f,$1e,$2f,$2e,$2f,$2e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$4f,$1e,$3e,$e5,$e4,$d1
frame607: .byte $3e,$ff,$ff,$ff,$ed,$1f,$e3,$21,$71,$2f,$3e,$1f,$4e,$2f,$1e,$3e,$e5,$e1,$f7,$af,$6b,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f6,$bf,$4d,$f3,$e2,$f2,$e3,$ee,$5e,$4f,$1e,$3e,$e5,$e4,$ee,$54,$1c,$ee,$54,$1c,$ee,$5e,$4e,$e4,$e5,$ee,$45,$1d,$f4,$de,$e5,$e4,$d1
frame608: .byte $3d,$ff,$ff,$fa,$1f,$e3,$2f,$dc,$21,$f3,$e1,$f3,$e2,$ee,$5e,$5f,$2e,$1f,$4a,$f7,$af,$7a,$f6,$af,$7a,$f7,$af,$7a,$f7,$af,$6c,$f3,$e2,$f1,$e3,$ee,$5e,$4e,$e5,$e5,$ee,$3e,$6e,$e3,$e5,$ee,$3e,$6e,$e2,$e7,$ee,$26,$2b,$f6,$cf,$5e,$1f,$2e,$1f,$1e,$2e,$21
frame609: .byte $47,$ff,$ff,$ff,$ec,$2f,$dc,$f5,$e1,$f2,$e1,$f2,$e3,$f2,$e3,$f1,$de,$c4,$5d,$ec,$54,$e,$ae,$c3,$63,$29,$ec,$37,$de,$b3,$9d,$ea,$3a,$ce,$a3,$ac,$ea,$38,$e1,$ea,$44,$e5,$e9,$42,$e7,$e9,$ee,$1e,$8c,$1e,$1e,$98,$4e,$1e,$93,$9e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$4e,$1f,$3e,$1f,$1e,$3e,$e4,$e6,$e2
frame610: .byte $46,$ff,$ff,$ff,$f3,$1f,$98,$f5,$bf,$7d,$f3,$df,$2e,$2f,$3c,$f7,$be,$62,$e3,$be,$61,$e5,$ae,$63,$e4,$ae,$54,$e3,$ae,$55,$e2,$ae,$64,$e2,$ae,$74,$ae,$2e,$73,$7e,$5e,$74,$5e,$6e,$84,$3e,$8e,$74,$27,$2d,$e8,$95,$e1,$e8,$67,$e1,$e9,$39,$e1,$f3,$e1,$f3,$df,$5c,$f5,$df,$4d,$ee,$4e,$5e,$21
frame611: .byte $44,$ff,$ff,$ff,$f3,$1f,$98,$f5,$cf,$6d,$f4,$cf,$3d,$f4,$df,$6b,$f6,$be,$61,$e5,$af,$7a,$f7,$ae,$63,$e3,$11,$9e,$53,$e2,$21,$9e,$53,$e1,$de,$63,$9e,$4e,$74,$7e,$5e,$65,$4e,$8e,$65,$2e,$9e,$7b,$3e,$1e,$87,$6e,$1e,$95,$7e,$1f,$3e,$1f,$3e,$1f,$3e,$2f,$3e,$1f,$3e,$1e,$e4,$e5,$e2
frame612: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame613: .byte $3f,$ff,$ff,$ff,$ed,$7f,$99,$f7,$bf,$6b,$f6,$cf,$4d,$f4,$df,$3e,$2f,$3d,$f6,$af,$7b,$f6,$bf,$6b,$f5,$cf,$4d,$f3,$e1,$f2,$e3,$ee,$4e,$6e,$e3,$e6,$ee,$34,$1e,$1e,$e2,$42,$e1,$ee,$23,$3e,$1e,$e3,$23,$e1,$ee,$40,$cd,$ee,$50,$cd,$f1,$12,$df,$1e,$3f,$2e,$2e,$41
frame614: .byte $40,$ff,$ff,$ff,$ee,$16,$fa,$8f,$8a,$f6,$cf,$5d,$f4,$cf,$5c,$f4,$e1,$f3,$df,$6b,$f6,$bf,$6b,$f6,$bf,$6b,$f5,$cf,$3e,$2f,$2e,$2e,$e4,$e6,$ee,$3e,$6e,$e3,$51,$de,$e3,$42,$de,$e3,$32,$e1,$ee,$33,$2e,$1e,$e4,$c,$e1,$ee,$40,$cd,$f1,$21,$df,$12,$1e,$1f,$1e,$3e,$31
frame615: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame616: .byte $42,$ff,$ff,$ff,$ff,$fe,$e1,$26,$7f,$2e,$3f,$1e,$5e,$e4,$e4,$ee,$4e,$5e,$e4,$e2,$f5,$cf,$5c,$f6,$bf,$6b,$f6,$bf,$6b,$f6,$bf,$6b,$f3,$e1,$f1,$e4,$ee,$5e,$5e,$e3,$e7,$ee,$2e,$7e,$e1,$e8,$ed,$43,$e2,$ed,$43,$e2,$ee,$13,$2e,$2e,$e2,$41,$e2,$ee,$30,$ee,$3e,$e3,$21,$e3,$d1
frame617: .byte $44,$ff,$ff,$ff,$ff,$71,$c1,$f3,$24,$52,$1f,$2e,$3f,$2e,$4e,$e5,$e3,$ee,$5e,$4e,$e5,$e1,$f6,$bf,$6b,$f6,$bf,$7a,$f7,$af,$7a,$f7,$af,$6b,$f5,$cf,$2e,$3f,$1e,$4e,$e4,$e6,$ee,$2e,$7e,$e2,$e7,$ee,$13,$4e,$1e,$e1,$33,$e1,$ee,$23,$3e,$1e,$e3,$32,$e1,$ee,$33,$2e,$2e,$e3,$c,$e2,$e4
frame618: .byte $43,$ff,$ff,$ff,$ff,$61,$c1,$f3,$21,$bf,$1e,$4f,$1e,$5e,$e4,$e4,$ee,$4e,$5e,$e5,$e1,$f6,$bf,$6b,$f6,$bf,$6b,$f7,$af,$7a,$f7,$af,$6b,$f5,$cf,$2e,$3e,$e5,$e5,$ee,$4e,$6e,$e2,$e7,$ee,$2e,$7e,$e1,$42,$e2,$ed,$34,$e2,$ee,$13,$3e,$1e,$e2,$33,$e1,$ee,$32,$3e,$1e,$e3,$32,$e2,$e5
frame619: .byte $38,$ff,$f3,$1f,$e3,$1f,$e3,$3f,$e1,$df,$4e,$2f,$2e,$3f,$1e,$3f,$1e,$2f,$2e,$3f,$1e,$1f,$3e,$1f,$3e,$1f,$3d,$f4,$df,$4c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5d,$f4,$e1,$f3,$e1,$f3,$e1,$f3,$e2,$f2,$e1,$f3,$e1,$f3,$df,$4d,$f4,$df,$41
frame620: .byte $4e,$18,$ee,$3e,$7e,$a0,$ee,$8e,$90,$91,$ea,$e6,$8,$ee,$1e,$30,$8e,$e2,$e7,$ee,$3e,$12,$1f,$49,$c,$ee,$5e,$3e,$e5,$e3,$f1,$e3,$f1,$e8,$ee,$1e,$9e,$ce,$ae,$ae,$e1,$e8,$ee,$3e,$6e,$e3,$e6,$ee,$2e,$6e,$e4,$e4,$ee,$5e,$3f,$3a,$7,$f3,$af,$b6,$f9,$9f,$6c,$f3,$e2,$ee,$5e,$6e,$e5,$e5,$ee,$4e,$6e,$e2,$e8,$ed,$ea,$eb,$b1
frame621: .byte $49,$18,$ee,$3e,$7e,$a0,$ce,$9e,$80,$91,$eb,$e5,$8,$ed,$e4,$8,$ee,$3e,$5f,$3a,$12,$f2,$b1,$2e,$e5,$e3,$f1,$e2,$f2,$e5,$ee,$4e,$8e,$de,$ae,$9e,$de,$9e,$e3,$e6,$ee,$4e,$6e,$e3,$e6,$ee,$2e,$6e,$e3,$e4,$f1,$e3,$f2,$e2,$f3,$8f,$a7,$fb,$7f,$8a,$f5,$df,$4e,$1f,$2e,$4f,$1e,$4e,$e4,$e6,$ee,$3e,$7e,$db
frame622: .byte $47,$17,$ed,$ea,$eb,$ec,$e9,$ee,$1e,$8e,$e2,$e6,$ee,$5e,$4f,$1e,$3f,$1e,$3e,$e5,$e4,$ee,$5e,$4e,$e4,$e7,$ee,$2e,$8e,$de,$ae,$be,$ce,$ae,$de,$9e,$de,$ae,$de,$9e,$ce,$9e,$de,$9e,$ce,$9e,$e1,$e7,$ee,$2e,$6e,$e4,$e3,$f2,$e2,$f2,$e2,$f2,$e4,$ee,$4e,$6e,$e3,$e7,$ee,$1e,$9e,$de,$ae,$be,$ce,$9d
frame623: .byte $48,$18,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e2,$e7,$ee,$3e,$6e,$e3,$e7,$ee,$2e,$8e,$e1,$e8,$ee,$1e,$9e,$de,$9e,$de,$ae,$ce,$ae,$ce,$ae,$de,$9e,$de,$9e,$ce,$9e,$de,$9e,$ce,$ae,$ce,$be,$ce,$ae,$ce,$ae,$de,$ae,$de,$9e,$e1,$e7,$ee,$2e,$7e,$e3,$e5,$ee,$4e,$5e,$e5,$e4,$e1
frame624: .byte $4d,$1b,$e3,$ee,$5e,$5e,$e4,$e5,$ee,$3e,$6e,$e3,$e7,$ee,$2e,$7e,$e1,$e9,$ec,$eb,$eb,$eb,$ec,$eb,$eb,$eb,$eb,$21,$e9,$ed,$e9,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$7e,$e2,$e7,$ee,$2e,$7e,$e3,$e6,$ee,$3e,$6e,$e4,$e5,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$51,$1e,$2f,$1e,$3f,$1e,$3f,$1e,$3f,$2e,$2f,$1e,$3f,$1e,$3e,$21
frame625: .byte $53,$33,$3,$e2,$ea,$83,$e2,$e9,$83,$e3,$e8,$39,$e3,$e7,$1a,$e6,$e5,$28,$e8,$e4,$28,$e9,$e3,$37,$ea,$e2,$36,$eb,$e2,$36,$eb,$eb,$eb,$eb,$ec,$ea,$ec,$e9,$ed,$e8,$ee,$1e,$9e,$de,$91,$2e,$be,$be,$be,$be,$be,$ce,$11,$8e,$cd,$19,$ec,$d1,$9e,$bd,$39,$ec,$b4,$8e,$bb,$76,$eb,$b7,$6e,$bb,$95,$ea,$ab,$4e,$aa,$b0,$2e,$91,$18,$f8,$9f,$88,$ee,$21
frame626: .byte $50,$1c,$f5,$df,$4d,$f5,$cf,$6b,$f6,$bf,$7a,$12,$ee,$5e,$10,$8e,$e5,$e5,$ee,$3e,$9e,$de,$e4,$e5,$ee,$5e,$4f,$1e,$3f,$2e,$2f,$3e,$1f,$4d,$b2,$ea,$c8,$11,$4e,$ab,$70,$c4,$ea,$a7,$12,$5e,$b9,$96,$ec,$89,$6e,$d7,$88,$ed,$69,$7e,$32,$95,$a7,$e2,$63,$7b,$7e,$2e,$2a,$7e,$3e,$28,$ae,$2e,$29,$bd,$e2,$9c,$ce,$29,$db,$e2,$9d,$ce,$11
frame627: .byte $4e,$1f,$ec,$1f,$e1,$5f,$c6,$fa,$9f,$7a,$f7,$bf,$5d,$f4,$df,$5d,$f5,$cf,$6b,$12,$f3,$e3,$f2,$ee,$1d,$73,$61,$e6,$c5,$3e,$e3,$b5,$2f,$19,$51,$f3,$8f,$a7,$fb,$62,$1f,$95,$1,$d2,$ed,$3e,$21,$14,$ec,$3d,$21,$4e,$b5,$c1,$24,$e5,$21,$9b,$12,$5e,$5c,$c6,$e5,$db,$6e,$6b,$d7,$e4,$be,$26,$e4,$ae,$25,$e5,$ae,$16,$1,$e2,$51
frame628: .byte $4a,$1f,$ff,$e3,$4f,$c7,$fa,$8f,$8a,$f6,$cf,$5c,$f4,$e1,$f4,$df,$4e,$1f,$5c,$f5,$c1,$2f,$3e,$2e,$60,$6b,$e4,$e3,$d3,$61,$e5,$7a,$5e,$e1,$79,$4e,$e3,$6a,$2e,$e5,$69,$1f,$25,$fd,$5f,$c6,$fc,$6e,$62,$e9,$7e,$11,$7,$e9,$7d,$12,$3e,$98,$c1,$24,$e8,$9b,$12,$4e,$8a,$c5,$e8,$ac,$6e,$7a,$d6,$e6,$ae,$25,$e5
frame629: .byte $4f,$1f,$f7,$1f,$e1,$5f,$c7,$fa,$8f,$8a,$f6,$cf,$4d,$f4,$df,$4e,$1f,$4d,$f5,$df,$5c,$21,$f2,$c0,$8f,$39,$15,$e5,$40,$c8,$71,$7e,$5b,$36,$2a,$e3,$94,$ea,$d8,$3e,$e1,$a8,$2e,$e3,$99,$1e,$e3,$a8,$1e,$e3,$af,$7c,$e6,$2e,$2e,$1e,$33,$e2,$e2,$e2,$3e,$2e,$2e,$14,$e2,$e3,$d4,$e2,$e5,$b5,$e1,$e5,$b5,$e1,$e4,$d5,$de,$4e,$15,$c1
frame630: .byte $4d,$1f,$fb,$3f,$d5,$fc,$7f,$a8,$f7,$bf,$6c,$f4,$df,$4e,$1f,$3e,$1f,$4e,$1f,$5c,$21,$f2,$c0,$8f,$2a,$24,$e7,$2b,$82,$6e,$54,$b6,$29,$e4,$1,$72,$e6,$e3,$93,$e9,$e2,$73,$ea,$e2,$82,$ea,$e2,$82,$ea,$e3,$f1,$e3,$e9,$19,$e5,$e5,$39,$e7,$e1,$59,$e8,$d5,$9e,$9d,$58,$ea,$c5,$8e,$bb,$58,$ea,$c6,$7e,$ad,$66,$ea,$e1,$56
frame631: .byte $4d,$1f,$fb,$3f,$d5,$fc,$8f,$99,$f7,$bf,$5c,$f5,$df,$4d,$f4,$df,$5d,$f5,$c0,$ef,$1c,$23,$f1,$a2,$5e,$62,$c8,$17,$e5,$3c,$61,$9e,$44,$20,$72,$1e,$7e,$39,$2e,$9e,$37,$3e,$9e,$37,$3e,$9e,$38,$1e,$ae,$38,$1e,$ae,$4e,$81,$9e,$6e,$43,$9e,$8e,$15,$8e,$9d,$58,$ea,$c5,$8e,$bb,$67,$ec,$a6,$7e,$bc,$66,$eb,$d6,$5e,$bd,$65
frame632: .byte $4e,$1f,$fb,$2f,$e1,$4f,$c8,$f9,$9f,$8a,$f6,$cf,$5c,$f4,$e1,$f3,$e1,$f4,$e1,$f4,$d0,$ef,$1c,$23,$f1,$a2,$5f,$18,$27,$e5,$3c,$52,$9e,$43,$e,$6e,$7e,$30,$1e,$e3,$e2,$83,$e9,$e2,$83,$e9,$e3,$81,$ea,$e3,$81,$ea,$e3,$e9,$19,$e5,$e5,$39,$e7,$e2,$58,$e8,$e1,$58,$e9,$d5,$8e,$ac,$58,$eb,$b6,$7e,$bc,$66,$eb,$d6,$5e,$bd,$65
frame633: .byte $4d,$1f,$fb,$2f,$d5,$fc,$8f,$99,$f8,$af,$6c,$f5,$cf,$4e,$1f,$4d,$f4,$e1,$f4,$d0,$ef,$1c,$23,$f1,$a2,$5f,$18,$27,$e5,$2d,$52,$9e,$43,$ae,$7e,$24,$8,$d,$e9,$e2,$91,$ea,$e2,$83,$e9,$e2,$82,$ea,$e3,$81,$ea,$e3,$e9,$19,$e4,$e6,$39,$e6,$e3,$58,$e8,$e1,$58,$e9,$d5,$8e,$ac,$58,$eb,$b6,$7e,$bc,$66,$eb,$d6,$5e,$bd,$65
frame634: .byte $4c,$1f,$fc,$4f,$c6,$fb,$8f,$8a,$f7,$bf,$5d,$f4,$df,$4d,$f4,$df,$5c,$f6,$c2,$1f,$2c,$8,$f2,$a2,$4f,$28,$26,$e5,$1e,$16,$28,$e3,$3b,$e7,$e2,$30,$e5,$e9,$e1,$f3,$e2,$83,$e9,$e2,$82,$ea,$e2,$91,$ea,$e2,$eb,$18,$e3,$e8,$38,$e5,$e4,$58,$e7,$e2,$58,$e8,$e1,$67,$ea,$c6,$7e,$bb,$67,$eb,$c6,$6e,$bd,$65,$eb,$d6,$51
frame635: .byte $4e,$1f,$fe,$25,$fc,$5f,$a8,$f8,$af,$6c,$f5,$cf,$5d,$f4,$df,$4c,$f6,$bf,$6b,$21,$f3,$c1,$2f,$3e,$2f,$4e,$1f,$2e,$3e,$23,$42,$6e,$7d,$41,$91,$e8,$d4,$15,$3e,$9e,$13,$24,$3e,$9e,$14,$23,$2e,$ae,$24,$20,$1e,$ae,$2e,$b1,$8e,$2e,$93,$8e,$4e,$55,$8e,$7e,$25,$8e,$8e,$16,$7e,$9d,$67,$eb,$b6,$7e,$bc,$66,$eb,$d6,$5e,$bd,$65
frame636: .byte $4e,$1f,$fe,$53,$fd,$5f,$98,$f8,$af,$6b,$f6,$cf,$4d,$f5,$cf,$5c,$f5,$cf,$5c,$11,$f3,$e2,$f5,$df,$4e,$1e,$b1,$8e,$3e,$21,$55,$4e,$7c,$43,$ee,$4c,$34,$43,$e9,$d3,$43,$2e,$ae,$13,$33,$2e,$ae,$15,$14,$1e,$ae,$16,$1e,$e1,$e2,$e9,$29,$e3,$e6,$58,$e6,$e3,$58,$e8,$e1,$58,$e9,$d5,$8e,$bb,$67,$eb,$c6,$6e,$bd,$65,$eb,$d6,$51
frame637: .byte $4d,$1f,$fe,$43,$fd,$5f,$98,$f8,$af,$6c,$f5,$cf,$5d,$f4,$df,$5c,$f4,$df,$5c,$11,$f3,$e2,$f4,$df,$4e,$2e,$a3,$6e,$4e,$85,$4e,$7e,$67,$1e,$9b,$26,$42,$ea,$a4,$63,$2e,$ab,$45,$32,$ea,$c4,$4e,$e2,$d5,$3e,$41,$9e,$16,$1e,$23,$9e,$1e,$84,$9e,$2e,$74,$9e,$7e,$25,$8e,$8e,$15,$8e,$ac,$58,$eb,$b6,$7e,$bc,$66,$eb,$d5,$61
frame638: .byte $52,$1f,$21,$fe,$15,$fb,$6f,$89,$f7,$bf,$5d,$f4,$df,$4e,$1f,$4d,$f4,$cf,$5c,$f5,$c2,$1f,$2c,$8,$e9,$57,$e1,$ea,$57,$e1,$e9,$74,$e4,$e8,$45,$e6,$e8,$34,$e8,$e7,$32,$ea,$e7,$32,$ea,$e7,$1,$eb,$a3,$7e,$e2,$a4,$6e,$e2,$a5,$5e,$52,$8c,$44,$e3,$39,$d5,$23,$2b,$48,$d7,$5b,$48,$e1,$a1,$b4,$8e,$2e,$85,$7e,$5e,$55,$7e,$8e,$26,$6e,$bd,$65
frame639: .byte $57,$1f,$36,$f9,$8f,$7b,$f5,$df,$3e,$2f,$1e,$3f,$1e,$3f,$1e,$4f,$1e,$3f,$2e,$1e,$71,$ce,$3e,$75,$7e,$3e,$85,$7e,$21,$2e,$57,$5e,$5e,$65,$12,$6e,$2e,$74,$9e,$2e,$74,$8e,$3e,$74,$7e,$4e,$74,$5e,$6e,$74,$3e,$8e,$64,$2e,$ae,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$66,$1e,$9e,$81,$5e,$40,$8a,$2e,$2c,$63,$a3,$e1,$c6,$39,$6c,$c7,$29,$7b,$d6,$2a,$7a,$d6,$21
frame640: .byte $53,$1f,$79,$f6,$bf,$5c,$f4,$df,$3e,$1f,$2e,$2f,$2e,$2f,$2e,$2e,$a1,$9e,$2e,$a1,$9e,$2e,$a2,$8e,$2e,$b2,$7e,$2e,$b2,$8e,$1e,$96,$8c,$e8,$77,$de,$96,$8c,$e8,$79,$be,$87,$aa,$e8,$89,$ae,$85,$21,$a2,$16,$e8,$50,$cb,$7e,$75,$41,$a8,$e7,$6c,$ae,$85,$8e,$1e,$85,$6e,$3e,$85,$6e,$3e,$86,$2e,$6e,$86,$1e,$7e,$8e,$e1,$e8,$ee,$1e,$8e,$e1,$e9,$ed
frame641: .byte $50,$1f,$ff,$11,$fe,$22,$fe,$13,$fe,$13,$e2,$2e,$e3,$2e,$32,$ee,$22,$e4,$3e,$d2,$e4,$4e,$b3,$e5,$4e,$94,$e6,$4e,$75,$e7,$4e,$56,$e8,$42,$1e,$16,$e9,$41,$2c,$7e,$b2,$8,$b7,$ec,$5b,$7e,$a7,$b7,$e8,$aa,$7e,$8b,$a6,$e8,$ba,$6e,$8b,$b5,$e8,$bc,$4e,$89,$e3,$2e,$88,$f9,$8e,$51,$e8,$7e,$61,$e8,$7f,$b6,$fb,$7f,$a7,$fb,$7f,$a7,$c6
frame642: .byte $23,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3,$2f,$e3,$2f,$e3,$3f,$e2,$3f,$e2,$35,$1f,$94,$23,$f7,$a8
frame643: .byte $2b,$1f,$ff,$81,$fe,$33,$fe,$23,$fe,$23,$fe,$33,$fe,$23,$fe,$33,$fe,$23,$fe,$23,$fe,$33,$fe,$23,$fe,$23,$fe,$33,$fe,$31,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame644: .byte $35,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f8,$2f,$e2,$2f,$e2,$2f,$e2,$3f,$e2,$2f,$e2,$2f,$e2,$3f,$e1,$3f,$e2,$2f,$e2,$3f,$e1,$3f,$e2,$2f,$e2,$2f,$e2,$3f,$e2,$2f,$e2,$2f,$e2,$3f,$e2,$2f,$e2,$2f,$e2,$2f,$e3,$2f,$e2,$2e,$21
frame645: .byte $2d,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$d2,$fe,$13,$fe,$12,$fe,$13,$fd,$3f,$e1,$3f,$d3,$fe,$13,$fd,$3f,$d4,$fd,$3f,$d4,$fd,$3f,$d4,$fc,$4f,$d4,$fc,$4f,$c5,$fc,$4f,$c5,$fc,$4f,$c5,$d1
frame646: .byte $2a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e2,$2f,$e2,$5f,$e1,$7f,$c6,$fd,$5f,$d6,$fc,$6f,$c7,$fb,$7f,$b9,$fa,$8f,$a8,$fa,$9f,$a9,$f9,$cf,$6d,$f6,$cf,$6b,$f8,$9f,$98,$fa,$71
frame647: .byte $35,$1f,$ff,$ff,$ff,$ff,$e6,$4f,$e1,$af,$a8,$fb,$6f,$c6,$fd,$5f,$d5,$fc,$6f,$ba,$f8,$af,$89,$f9,$9f,$9a,$f8,$c0,$ef,$2e,$8e,$e2,$e7,$ee,$3e,$6e,$e4,$e5,$ee,$5e,$4f,$1e,$3f,$2e,$2f,$2e,$2f,$3e,$1f,$3e,$1f,$4d,$f4,$d1
frame648: .byte $4f,$1f,$ff,$fe,$33,$95,$ee,$53,$b4,$ee,$34,$c3,$ee,$16,$d3,$ed,$6e,$15,$ec,$4e,$16,$ed,$2e,$27,$e9,$4e,$3e,$10,$c2,$ce,$5e,$e4,$e6,$ee,$3e,$8e,$de,$ae,$be,$be,$be,$ce,$9e,$de,$8e,$e2,$e7,$ee,$2e,$6e,$e3,$e7,$ee,$3e,$6e,$e3,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$55
frame649: .byte $42,$1f,$33,$fb,$5f,$a6,$fb,$6e,$e1,$1e,$15,$ee,$22,$d5,$ee,$32,$b5,$ee,$44,$68,$ee,$5e,$5e,$e5,$e4,$f2,$e2,$f2,$e2,$f1,$e2,$f2,$df,$5c,$f5,$cf,$5b,$f6,$bf,$6b,$f6,$af,$6c,$f5,$df,$4d,$f4,$df,$4e,$1f,$3e,$1f,$3e,$1e,$e3,$e6,$ee,$2e,$7e,$e1,$e9,$ed,$e9,$ed,$e5,$13,$e1
frame650: .byte $44,$1e,$92,$fe,$14,$fd,$3f,$e1,$3f,$e2,$2f,$a0,$35,$f8,$3,$7f,$6b,$f7,$bf,$5c,$f5,$cf,$4c,$f5,$df,$5c,$f6,$bf,$7a,$f8,$9f,$89,$f8,$ae,$e5,$4,$2b,$ee,$36,$2b,$ee,$27,$1c,$ee,$2e,$7e,$e2,$e7,$ed,$e9,$ec,$ea,$eb,$ec,$ea,$ec,$e9,$d1,$de,$99,$2e,$1e,$a9,$2e,$1e,$b7,$2e,$1e,$41
frame651: .byte $49,$1e,$42,$fe,$13,$fe,$13,$fe,$13,$fe,$23,$fb,$12,$5f,$92,$16,$f8,$af,$7b,$f6,$bf,$5c,$f5,$cf,$5c,$f5,$df,$5c,$f6,$bf,$2e,$3e,$e5,$e4,$ee,$5e,$4e,$e2,$e8,$ec,$ea,$eb,$ec,$ea,$ec,$ea,$ee,$1e,$8e,$e2,$e7,$ee,$2e,$88,$9,$e3,$e8,$60,$c2,$e2,$ea,$25,$21,$e3,$ee,$32,$1e,$3e,$e4,$e6,$ee,$3d,$43,$b1
frame652: .byte $4d,$1e,$b5,$fc,$4f,$d4,$fd,$4f,$d3,$fa,$21,$4f,$a8,$f8,$af,$6b,$f5,$df,$3d,$f5,$ce,$a6,$15,$1c,$e9,$ec,$e9,$ec,$ea,$ec,$ea,$ec,$ea,$eb,$eb,$e1,$19,$ec,$b3,$9e,$cc,$29,$ee,$14,$15,$1b,$f1,$e4,$ee,$5e,$5e,$e4,$e6,$ee,$3e,$7e,$e2,$e2,$14,$ee,$2e,$22,$4e,$d3,$2b,$24,$ec,$41,$c1,$4e,$e2,$21,$e4,$ee,$20,$3e,$3e,$31
frame653: .byte $57,$1f,$fe,$92,$fe,$12,$fe,$12,$fd,$4f,$c6,$fa,$6e,$66,$d6,$e9,$88,$ae,$8e,$12,$de,$6e,$21,$e1,$e5,$ee,$4e,$5e,$e3,$e6,$ee,$3e,$6e,$e2,$e8,$e1,$1a,$ec,$a3,$ae,$e2,$45,$ae,$e2,$55,$ae,$e4,$34,$be,$e4,$e4,$ee,$5e,$4f,$1e,$4e,$e5,$32,$de,$e4,$14,$e1,$ee,$32,$3e,$2e,$e1,$24,$e2,$ee,$12,$4a,$24,$ed,$25,$82,$5e,$d1,$68,$24,$ed,$25,$91,$4e,$d2,$5e,$2e,$21
frame654: .byte $5c,$1f,$fe,$b1,$fe,$22,$fd,$3f,$d3,$e7,$5e,$64,$e6,$8e,$26,$e5,$aa,$12,$4e,$8a,$6a,$e8,$e2,$1d,$e6,$ee,$4e,$5e,$e4,$e6,$ee,$2e,$8e,$e1,$e9,$ec,$ed,$82,$be,$d5,$6a,$ee,$15,$5b,$ee,$24,$5b,$ee,$33,$3d,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$7e,$e3,$7,$e2,$ee,$30,$7e,$2e,$e3,$3,$91,$6e,$e2,$14,$73,$5e,$e2,$23,$74,$5e,$e1,$23,$74,$5e,$e1,$23,$74,$5e,$e1,$3,$91,$7e,$e1,$3,$e4,$c1
frame655: .byte $5c,$1f,$fe,$c1,$fe,$12,$fe,$12,$fe,$13,$e6,$6e,$64,$e5,$8e,$36,$e4,$ab,$11,$6e,$6a,$7a,$e8,$e1,$2c,$e7,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$7e,$e1,$ea,$ec,$ec,$91,$ce,$c5,$6a,$ee,$15,$5b,$ee,$24,$5b,$ee,$33,$3d,$ee,$3e,$6e,$e3,$e5,$ee,$4e,$5e,$e5,$7,$e1,$ee,$40,$7e,$2e,$e3,$3,$e3,$ee,$20,$7e,$3e,$e2,$14,$71,$8e,$e1,$23,$71,$8e,$e1,$14,$71,$7e,$e2,$7,$e2,$ee,$30,$7e,$2e,$11
frame656: .byte $5c,$1f,$ff,$fc,$1f,$e2,$2e,$52,$eb,$3e,$47,$e7,$3e,$49,$e4,$5e,$49,$e2,$7e,$3d,$55,$14,$11,$e5,$e1,$2b,$e8,$e2,$1d,$e6,$ee,$4e,$6e,$e3,$e7,$ee,$1e,$ce,$ae,$b8,$2d,$eb,$56,$ce,$c5,$6a,$ee,$33,$5b,$ee,$33,$4c,$ee,$3e,$6e,$e3,$e5,$ee,$5e,$4e,$e5,$7,$e1,$ee,$40,$7e,$2e,$e3,$7,$e3,$ee,$20,$7e,$4e,$e1,$7,$e4,$ee,$10,$78,$18,$ee,$11,$47,$18,$ee,$10,$7e,$3e,$e2,$7,$e2,$e1
frame657: .byte $5d,$1f,$ff,$ff,$ee,$22,$e5,$4e,$93,$e4,$8e,$63,$e5,$9e,$35,$e4,$ae,$26,$e4,$c5,$1,$11,$6e,$6e,$12,$ae,$9e,$e2,$e7,$ee,$3e,$7e,$e2,$e9,$ec,$ec,$ea,$eb,$82,$de,$b5,$6c,$ee,$13,$6b,$ee,$23,$6a,$ee,$33,$4c,$ee,$3e,$6e,$e3,$e6,$ee,$4e,$5e,$e4,$3,$e1,$ee,$40,$3e,$2e,$e3,$3,$e3,$ee,$20,$78,$18,$ee,$10,$38,$27,$ee,$10,$38,$27,$ee,$10,$38,$27,$ee,$10,$38,$26,$ee,$20,$3e,$2e,$11
frame658: .byte $5b,$1f,$ff,$ff,$ee,$31,$e5,$5e,$92,$e4,$8e,$72,$e5,$9e,$44,$e4,$ae,$27,$e3,$c9,$21,$6e,$5e,$12,$be,$8e,$de,$9e,$e3,$e8,$ee,$1e,$ae,$ce,$be,$ae,$b8,$2e,$1e,$a5,$6d,$ed,$36,$be,$e2,$36,$be,$e2,$35,$be,$e3,$e6,$ee,$3e,$6e,$e4,$e5,$ee,$40,$3e,$1e,$e4,$3,$e1,$ee,$40,$3e,$2e,$e3,$3,$81,$7e,$e2,$3,$81,$8e,$e1,$3,$82,$7e,$e1,$3,$82,$7e,$e1,$3,$82,$6e,$e2,$3,$e2,$e1
frame659: .byte $5e,$1f,$ff,$ff,$ee,$41,$e5,$3e,$c2,$e3,$7e,$83,$e3,$9e,$63,$e4,$9e,$45,$e3,$bb,$12,$7e,$3e,$13,$b1,$1e,$5e,$21,$be,$9e,$e2,$e8,$ee,$2e,$8e,$e1,$ea,$eb,$ea,$91,$e2,$ea,$47,$de,$c3,$7c,$ed,$45,$be,$e2,$45,$be,$e2,$41,$e1,$ee,$4e,$5e,$e4,$e5,$ee,$40,$1e,$1e,$e4,$7,$e1,$ee,$40,$3e,$2e,$e3,$7,$e3,$ee,$20,$78,$18,$ee,$10,$78,$18,$ee,$10,$78,$27,$ee,$10,$78,$27,$ee,$10,$78,$16,$e1
frame660: .byte $5a,$1f,$ff,$ff,$fe,$46,$eb,$2e,$28,$e8,$3e,$39,$e5,$4e,$3a,$e4,$4e,$4b,$e1,$7e,$3d,$3e,$1e,$5e,$11,$ce,$9e,$b1,$2e,$9e,$e1,$eb,$eb,$e9,$ed,$e9,$91,$e2,$ea,$47,$de,$c4,$6c,$ed,$45,$be,$e2,$45,$be,$e2,$e7,$ee,$3e,$5e,$e4,$e5,$ee,$40,$3e,$1e,$e4,$7,$e1,$ee,$40,$3e,$1e,$e4,$3,$e2,$ee,$30,$38,$17,$ee,$20,$38,$27,$ee,$10,$38,$27,$ee,$10,$38,$27,$ee,$10,$38,$17,$d1
frame661: .byte $59,$1f,$ff,$ff,$fe,$55,$ec,$1e,$37,$e9,$3e,$29,$e7,$2e,$3a,$e5,$4e,$3b,$e2,$6e,$3d,$43,$2a,$e3,$e1,$2b,$e9,$ec,$eb,$ee,$1e,$be,$be,$9e,$de,$9e,$de,$94,$7e,$1e,$b4,$6d,$ec,$46,$ce,$e1,$35,$be,$e3,$1,$e2,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$5e,$e4,$7,$e1,$ee,$40,$3e,$1e,$e4,$7,$e2,$ee,$30,$78,$17,$ee,$20,$38,$27,$ee,$10,$37,$37,$ee,$10,$77,$37,$ee,$10,$78,$17,$d1
frame662: .byte $59,$1f,$ff,$ff,$fe,$55,$fb,$7e,$b2,$e1,$9e,$83,$e1,$ae,$64,$e2,$be,$35,$e3,$da,$11,$8e,$2e,$12,$e2,$e5,$e1,$1b,$ea,$eb,$12,$eb,$ec,$e8,$ee,$1e,$8e,$de,$95,$6e,$2e,$a4,$7d,$eb,$46,$de,$d3,$6b,$ee,$23,$2e,$1e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$41,$2e,$2e,$e3,$3,$e1,$ee,$40,$3e,$2e,$e4,$11,$92,$5e,$e3,$3,$82,$6e,$e2,$3,$73,$7e,$e1,$3,$73,$7e,$e1,$3,$82,$7c
frame663: .byte $5b,$1f,$ff,$ff,$23,$fc,$7f,$99,$eb,$1d,$ae,$93,$da,$e7,$3e,$2b,$e4,$5e,$2e,$19,$12,$7e,$2e,$12,$e4,$e3,$e1,$1c,$ea,$ea,$ed,$ed,$e8,$ee,$1e,$89,$1e,$4e,$75,$7e,$2e,$a4,$6e,$1e,$b4,$6d,$ed,$35,$ce,$e2,$1,$e2,$ee,$3e,$6e,$e3,$e6,$ee,$30,$3e,$2e,$e3,$3,$e2,$ee,$30,$3e,$1e,$e4,$3,$e1,$ee,$40,$38,$16,$ee,$30,$38,$26,$ee,$20,$37,$36,$ee,$20,$37,$37,$ee,$10,$38,$36,$c1
frame664: .byte $5e,$1f,$ee,$35,$fa,$8f,$8a,$f7,$af,$7a,$f7,$ce,$b1,$bd,$e7,$3d,$de,$44,$e2,$ca,$14,$5e,$4b,$4e,$3e,$3c,$3e,$4e,$3c,$3c,$e8,$43,$25,$e1,$e8,$48,$e3,$e7,$48,$e3,$e8,$47,$e3,$e8,$47,$e2,$e9,$83,$e1,$ea,$11,$e9,$eb,$12,$e6,$ed,$16,$e1,$ee,$12,$6d,$ee,$12,$5e,$1e,$e1,$24,$e1,$ee,$22,$4e,$1e,$e2,$24,$e1,$ee,$31,$4e,$1e,$e3,$23,$81,$5e,$e3,$23,$81,$6e,$e2,$23,$72,$6e,$e2,$23,$82,$5d
frame665: .byte $59,$1c,$af,$7a,$f7,$af,$7a,$f8,$bf,$6c,$f6,$bf,$5c,$b1,$ea,$da,$3e,$a4,$16,$a3,$eb,$42,$53,$93,$5e,$53,$9e,$4e,$64,$7e,$5e,$64,$6e,$1e,$b4,$6e,$2e,$a5,$4e,$3e,$92,$15,$2e,$4e,$80,$36,$1e,$2e,$92,$3e,$8e,$91,$6e,$5e,$92,$8e,$2e,$a2,$8c,$ed,$27,$de,$d1,$7e,$1e,$c2,$7d,$ed,$26,$e2,$ec,$26,$e2,$ec,$26,$e2,$ec,$17,$e2,$ec,$26,$81,$6e,$c2,$77,$16,$ec,$27,$81,$5d
frame666: .byte $5b,$1d,$bf,$6b,$f6,$bf,$7a,$f8,$af,$8a,$f5,$cf,$4d,$b2,$e9,$ca,$4e,$a3,$26,$84,$ec,$43,$41,$51,$4e,$d4,$7a,$ee,$23,$6b,$ee,$23,$5e,$4e,$94,$5e,$4e,$95,$3e,$10,$ee,$a6,$1e,$1e,$d2,$1e,$6e,$e1,$12,$e5,$ee,$11,$4e,$3e,$e1,$15,$e1,$ee,$21,$4e,$1e,$e3,$7,$e1,$ee,$42,$1e,$1e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e4,$e5,$ee,$36,$1d,$ee,$10,$10,$3d,$ed,$42,$12,$de,$11
frame667: .byte $59,$1e,$1a,$f7,$af,$7a,$f7,$af,$89,$f9,$9f,$7b,$f5,$cb,$2e,$9d,$94,$ea,$41,$68,$4e,$c4,$25,$14,$24,$ed,$45,$ce,$e1,$46,$be,$e2,$35,$e3,$ea,$44,$e5,$e9,$44,$e2,$ec,$62,$e1,$ed,$81,$de,$d0,$3e,$5e,$d2,$3e,$4e,$d2,$5e,$1e,$e1,$25,$de,$e2,$24,$de,$e3,$24,$ce,$e4,$23,$ce,$e5,$23,$ce,$e5,$3,$de,$e5,$3,$de,$e5,$21,$e1,$ee,$52,$1e,$1e,$e5,$21,$e1,$ee,$55,$1b,$e3
frame668: .byte $5d,$1e,$2a,$f6,$bf,$7a,$f7,$af,$89,$f7,$bf,$5c,$f4,$db,$2e,$ac,$a3,$ea,$41,$69,$4e,$b4,$25,$14,$25,$ed,$35,$de,$e1,$36,$be,$e2,$35,$e4,$e9,$45,$e4,$e9,$53,$e2,$21,$e9,$71,$e1,$ed,$21,$e6,$ed,$3,$e6,$ec,$24,$e3,$ed,$25,$e2,$ed,$25,$e1,$ee,$12,$4d,$ee,$32,$3d,$ee,$42,$3d,$ee,$40,$3e,$1e,$e4,$21,$e2,$ee,$42,$1e,$2e,$e4,$21,$e2,$ee,$41,$2e,$2e,$e4,$12,$e2,$ee,$40,$71,$1c,$e2
frame669: .byte $5d,$1e,$3b,$f6,$bf,$6b,$f7,$9f,$6b,$f4,$df,$4e,$1f,$4d,$f4,$1,$9c,$1e,$9c,$b3,$e9,$42,$51,$53,$5e,$a4,$42,$1d,$eb,$44,$12,$ce,$c4,$6c,$17,$e5,$45,$e8,$e5,$62,$e8,$e6,$71,$e3,$41,$e6,$21,$e8,$eb,$3,$e8,$ea,$14,$e7,$e9,$25,$e5,$ea,$26,$e3,$eb,$26,$e2,$ec,$25,$e2,$ed,$25,$de,$e2,$24,$e1,$ee,$22,$3e,$1e,$e3,$23,$e1,$ee,$23,$2e,$3e,$e2,$7,$e3,$ee,$20,$7e,$3e,$e1,$32,$e3,$e1
frame670: .byte $5c,$1e,$2d,$f5,$bf,$30,$3a,$f2,$e2,$f1,$e3,$f2,$e3,$f1,$e3,$f1,$e3,$f1,$51,$9f,$25,$18,$f4,$43,$53,$5e,$e2,$45,$23,$83,$4e,$65,$40,$3e,$3e,$65,$8e,$12,$5d,$66,$ea,$e1,$64,$eb,$e1,$72,$e9,$12,$d9,$1e,$5e,$70,$1e,$de,$52,$3e,$de,$42,$4e,$ce,$42,$5e,$ce,$32,$6e,$ae,$42,$7e,$8e,$52,$6e,$8e,$62,$6e,$6e,$73,$5e,$5e,$93,$4e,$3e,$c2,$5e,$3e,$c2,$4e,$4e,$c3,$2e,$5e,$c3,$2e,$5d
frame671: .byte $60,$18,$e7,$ee,$2e,$8e,$e2,$e7,$ee,$2e,$8e,$e2,$e7,$ee,$25,$1e,$1e,$e2,$52,$ce,$e3,$61,$ce,$e3,$53,$ae,$e4,$64,$66,$1e,$c6,$63,$57,$e8,$66,$34,$ae,$66,$cc,$e4,$8b,$d2,$1d,$88,$e9,$a8,$7e,$aa,$95,$eb,$a0,$17,$2e,$ca,$32,$71,$ec,$a3,$3e,$e4,$c3,$4e,$e5,$a2,$6e,$e4,$a2,$7e,$e3,$93,$8e,$e2,$93,$9e,$e1,$93,$ae,$d9,$3a,$ed,$93,$9e,$e1,$93,$8e,$e2,$93,$7e,$e3,$91,$11,$6e,$e3,$a3,$6e,$81,$53
frame672: .byte $67,$15,$ee,$2e,$77,$2e,$6e,$77,$3e,$5e,$78,$2e,$4e,$79,$3e,$2e,$98,$4e,$1e,$98,$5b,$eb,$86,$9e,$c8,$94,$96,$c9,$93,$8a,$99,$93,$6e,$16,$a9,$17,$e3,$52,$17,$e4,$e3,$52,$17,$d2,$1e,$45,$ad,$e7,$5b,$ae,$95,$1,$89,$e9,$53,$28,$6e,$b5,$33,$84,$ec,$44,$39,$2e,$d4,$2,$49,$2e,$c4,$2,$59,$1e,$c4,$46,$91,$eb,$44,$7f,$24,$39,$f1,$43,$ae,$e5,$43,$ae,$e5,$34,$be,$e4,$30,$2c,$ee,$33,$2,$de,$e2,$34,$e1,$ee,$13,$4d,$ee,$21
frame673: .byte $53,$77,$e8,$d7,$8e,$6e,$17,$9e,$4d,$9b,$de,$2a,$d8,$e4,$ae,$26,$e2,$ce,$25,$de,$2e,$25,$ce,$4e,$15,$be,$5e,$22,$ce,$6e,$21,$ce,$7e,$e1,$e8,$e9,$23,$e8,$e9,$42,$e7,$e8,$ee,$1e,$7e,$e3,$e4,$f2,$e2,$f3,$df,$59,$ec,$1e,$18,$ec,$2e,$16,$ed,$3e,$14,$ee,$14,$e1,$2e,$e2,$4e,$22,$ee,$15,$e2,$1e,$e1,$6e,$21,$ed,$7f,$a8,$f9,$9f,$8a,$f7,$bf,$61
frame674: .byte $40,$1e,$7b,$f6,$bf,$7a,$f7,$af,$79,$f9,$6f,$f3,$2f,$d4,$fd,$4f,$c5,$fc,$5e,$a3,$e4,$5e,$a3,$e3,$6e,$b1,$e4,$6f,$b6,$fa,$7f,$98,$f6,$bf,$3e,$1f,$2e,$2f,$1e,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$4e,$5e,$e4,$e6,$ee,$2e,$8e,$de,$be,$8e,$e2,$e2,$f3,$df,$5c,$ee,$31
frame675: .byte $1f,$1e,$89,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fd,$3f,$d5,$fb,$6f,$b6,$fc,$5f,$d3,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f9
frame676: .byte $20,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$32,$fe,$15,$fb,$7f,$98,$f9,$8f,$a6,$fc,$4f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f6
frame677: .byte $20,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$44,$fc,$7f,$98,$f9,$8f,$a7,$fb,$5f,$e1,$1f,$ff,$ff,$ff,$ff,$ff,$e5
frame678: .byte $20,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f5,$1f,$e2,$4f,$b7,$fa,$7f,$a7,$fa,$6f,$d2,$ff,$ff,$ff,$ff,$ff,$11
frame679: .byte $21,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$52,$fe,$14,$fd,$4f,$d6,$fa,$7f,$a6,$fb,$6f,$c5,$ff,$ff,$ff,$ff,$fe,$e4
frame680: .byte $22,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$12,$fe,$14,$fd,$5f,$c5,$fc,$4f,$c5,$fc,$7f,$a6,$fb,$6f,$c5,$ff,$ff,$ff,$ff,$d1
frame681: .byte $25,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e2,$2f,$e1,$3f,$e1,$3f,$e1,$5f,$d4,$fc,$5f,$b5,$fc,$5f,$c6,$fb,$7f,$b5,$fd,$3f,$ff,$ff,$fe,$e2
frame682: .byte $26,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$33,$fd,$4f,$d3,$fe,$14,$fd,$5f,$c5,$fc,$5f,$b5,$fc,$5f,$b7,$fb,$6f,$b6,$fc,$7f,$a6,$fd,$1f,$ff,$ed
frame683: .byte $29,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$a2,$fe,$14,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$c6,$fb,$6f,$a7,$fa,$8f,$89,$f8,$9f,$98,$fa,$6f,$c4,$fd,$7f,$99,$e4
frame684: .byte $30,$1f,$ff,$ff,$ff,$ff,$ff,$e6,$4f,$c6,$fb,$6f,$b6,$fc,$6f,$c4,$f9,$12,$5f,$80,$35,$f8,$21,$6f,$89,$f8,$9f,$88,$f9,$8f,$99,$f7,$bf,$7a,$fa,$7f,$99,$f8,$9f,$8a,$f6,$bf,$6c,$f5,$cf,$4d,$f4,$de,$11
frame685: .byte $3b,$1f,$ff,$ff,$e2,$3f,$c6,$fa,$8f,$98,$f9,$9f,$98,$fa,$7f,$b6,$fb,$5f,$53,$36,$f5,$33,$6f,$53,$27,$f5,$32,$6f,$6b,$f6,$bf,$64,$16,$f6,$42,$5f,$64,$26,$f4,$61,$6f,$4e,$1f,$50,$19,$f5,$12,$9f,$8a,$f7,$af,$6b,$f6,$cf,$5d,$f3,$e1,$f3,$e2,$a1
frame686: .byte $3a,$1f,$ff,$ff,$e1,$4f,$c6,$fa,$8f,$98,$f9,$9f,$98,$fa,$7f,$b6,$fb,$5f,$52,$46,$f5,$33,$6f,$43,$37,$f4,$33,$6f,$5c,$f5,$cf,$5c,$f6,$41,$6f,$55,$26,$f4,$52,$6f,$45,$18,$f3,$51,$8f,$50,$79,$f8,$9f,$8a,$f6,$bf,$6c,$f5,$cf,$4e,$1f,$3e,$2a
frame687: .byte $3b,$1f,$ff,$ff,$e1,$4f,$b7,$fa,$8f,$99,$f8,$9f,$89,$f9,$8f,$a7,$fc,$4f,$51,$56,$f4,$34,$6f,$43,$38,$f3,$33,$7f,$34,$36,$f4,$df,$4d,$f4,$df,$54,$26,$f5,$52,$6f,$36,$17,$f3,$61,$8f,$26,$19,$f3,$23,$9f,$7b,$f6,$bf,$6c,$f5,$cf,$4e,$1f,$3e,$1b
frame688: .byte $3f,$1f,$ff,$ff,$d6,$fa,$8f,$99,$f7,$af,$7a,$f8,$af,$89,$f9,$8f,$b5,$fb,$5f,$33,$56,$f3,$34,$8f,$14,$48,$f1,$44,$7f,$24,$46,$f3,$71,$6f,$3e,$1f,$3e,$1f,$36,$17,$f4,$52,$7f,$35,$27,$f2,$62,$8f,$16,$29,$ee,$56,$1a,$f2,$23,$bf,$20,$7b,$f6,$cf,$5c,$f4,$e1,$b1
frame689: .byte $44,$1f,$ff,$ee,$25,$fb,$8f,$89,$f8,$af,$6b,$f7,$af,$89,$f8,$af,$89,$f9,$7f,$b6,$f9,$7f,$13,$58,$ee,$54,$58,$ee,$54,$59,$ee,$44,$48,$f1,$44,$8f,$17,$27,$ee,$5e,$3f,$2e,$2f,$26,$19,$f1,$62,$8f,$25,$37,$f1,$72,$8e,$e5,$72,$9e,$e4,$71,$ae,$e4,$71,$be,$e5,$33,$bf,$11,$4c,$f4,$dc
frame690: .byte $48,$1f,$fe,$15,$fa,$8f,$8a,$f7,$bf,$6b,$f6,$bf,$6b,$f6,$bf,$6b,$f7,$af,$89,$f8,$9f,$79,$f7,$8e,$e4,$36,$9e,$e3,$55,$9e,$e3,$45,$be,$e2,$45,$9e,$e4,$45,$9e,$e3,$73,$8e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$47,$1a,$ee,$56,$39,$ee,$47,$38,$ee,$47,$39,$ee,$37,$2a,$ee,$37,$2b,$ee,$19,$1c,$ed,$82,$cc
frame691: .byte $48,$1e,$e3,$6f,$99,$f7,$bf,$6c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5b,$f7,$bf,$7a,$f6,$bf,$5c,$f4,$91,$1f,$5a,$ee,$33,$6a,$ee,$24,$6b,$ed,$55,$be,$e1,$55,$ae,$e2,$46,$ae,$e2,$55,$9e,$e2,$75,$8e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e3,$72,$be,$e2,$74,$9e,$e2,$74,$ae,$e1,$73,$ce,$c9,$2c,$c1
frame692: .byte $40,$1e,$e1,$cf,$5d,$f4,$df,$4d,$f4,$df,$4d,$f4,$df,$4d,$f4,$cf,$6b,$f7,$bf,$6b,$f4,$df,$3e,$1f,$2b,$f6,$bf,$6b,$f5,$ce,$d4,$6b,$ed,$56,$ae,$e1,$56,$ae,$e1,$47,$ae,$d5,$79,$ee,$15,$88,$ee,$15,$79,$ed,$e9,$ed,$ea,$ec,$ea,$ec,$eb,$eb,$eb,$ec,$75,$ce,$c7,$4d,$a1
frame693: .byte $41,$1e,$e2,$df,$4e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3d,$f4,$df,$4c,$f7,$bf,$6b,$f6,$bf,$4d,$f3,$e1,$f2,$bf,$6c,$f5,$cf,$4d,$f4,$bf,$6a,$ee,$31,$8a,$ee,$14,$7a,$ed,$58,$9e,$d5,$89,$ed,$49,$9e,$c5,$8a,$ec,$65,$ce,$ce,$be,$ae,$ce,$ae,$de,$9e,$de,$9d,$1d,$e9,$85,$e1,$81
frame694: .byte $45,$1e,$e4,$e1,$f3,$e1,$f3,$e1,$f3,$df,$4d,$f4,$cf,$7b,$f6,$bf,$5c,$f4,$df,$3d,$f3,$cf,$5c,$f5,$cf,$4d,$f4,$bf,$6b,$f6,$af,$7a,$ee,$21,$a9,$ec,$4a,$9e,$c5,$99,$ec,$58,$ae,$b5,$8c,$ea,$56,$e1,$ea,$64,$e2,$ea,$ed,$e8,$ee,$2e,$7e,$e3,$e6,$e1,$1e,$1e,$60,$18,$3e,$2e,$50,$16,$5e,$25
frame695: .byte $49,$1f,$1e,$1f,$3d,$f5,$cf,$7b,$f5,$cf,$4d,$f3,$e1,$f2,$df,$3d,$f4,$df,$4d,$f4,$bf,$5c,$f5,$bf,$7a,$f7,$ae,$c2,$ba,$eb,$4a,$ae,$a5,$aa,$ea,$58,$de,$94,$8e,$1e,$95,$6e,$2e,$87,$4e,$4e,$7e,$e3,$e6,$ee,$3e,$6e,$21,$e1,$e5,$e1,$2e,$2e,$4c,$4e,$2e,$4b,$4e,$4e,$41,$28,$3e,$4e,$78,$3e,$5e,$69,$1e,$61
frame696: .byte $48,$1f,$6a,$f5,$cf,$5c,$f4,$df,$4d,$f4,$bf,$6b,$f6,$bf,$6b,$f6,$bf,$6b,$f6,$be,$93,$cb,$e8,$4a,$de,$85,$8e,$2e,$65,$8e,$3e,$66,$6e,$5e,$57,$3e,$7e,$5e,$e4,$e5,$e3,$2c,$e5,$e2,$2d,$e5,$e1,$3d,$e5,$d4,$de,$5d,$3e,$1e,$5e,$12,$e1,$e6,$3,$a1,$e1,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec
frame697: .byte $4c,$1f,$a6,$fb,$6f,$b6,$fa,$7f,$98,$f8,$9f,$7a,$f6,$bf,$3e,$1e,$73,$9e,$3e,$74,$7a,$16,$e6,$56,$a2,$6e,$65,$5b,$17,$e6,$64,$a2,$7e,$67,$38,$38,$e6,$a3,$44,$8e,$79,$b8,$e8,$8a,$9e,$8c,$69,$e9,$e1,$2a,$e9,$ed,$ea,$ec,$eb,$eb,$ed,$e9,$ed,$e9,$ee,$1e,$8e,$e1,$e8,$ee,$2e,$7e,$e2,$e7,$ee,$3e,$6f,$1e,$3f,$1e,$31
frame698: .byte $3d,$1f,$ff,$ff,$a2,$fe,$14,$fc,$5f,$c5,$e9,$1e,$78,$12,$e3,$1e,$7c,$e1,$2e,$8b,$e1,$2e,$99,$e1,$3e,$ae,$53,$4e,$ce,$42,$4e,$de,$31,$5e,$de,$31,$5e,$e1,$e1,$16,$ee,$2d,$25,$ee,$4a,$26,$ee,$59,$26,$f1,$82,$6f,$35,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fa
frame699: .byte $2c,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$52,$fd,$4f,$d5,$42,$f6,$53,$3f,$6b,$f6,$bf,$7a,$54,$ee,$4e,$6e,$e5,$e4,$f1,$e3,$f2,$e2,$f3,$e1,$f4,$df,$7a,$fa,$7f,$c1,$ff,$ff,$ff,$ff,$ff,$f7
frame700: .byte $29,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fc,$2f,$e2,$30,$ef,$94,$c,$f9,$96,$1f,$19,$35,$f1,$e4,$f1,$e3,$f3,$e1,$f5,$cf,$6b,$f9,$8f,$d2,$ff,$fe,$61
frame701: .byte $2e,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$92,$fe,$14,$23,$f8,$9f,$96,$fc,$67,$1f,$4e,$2f,$2e,$1f,$4c,$f7,$a3,$3f,$3e,$1f,$45,$25,$f5,$52,$4f,$65,$14,$f8,$8f,$d3,$fe,$21,$e3
frame702: .byte $2d,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$75,$fc,$5f,$c7,$fa,$bf,$79,$f9,$6f,$b8,$f9,$e1,$f4,$e1,$f5,$df,$5b,$f7,$a0,$8f,$3d,$f4,$df,$46,$15,$f5,$33,$4f,$c4,$fd,$3f,$e1,$1e,$51
frame703: .byte $31,$1f,$ff,$ff,$ff,$ff,$ff,$c2,$fe,$15,$fc,$5f,$b6,$fb,$7f,$b7,$fb,$6f,$b7,$fa,$8f,$99,$f9,$9f,$bc,$f5,$cf,$5c,$f5,$bf,$6a,$f6,$af,$7b,$f6,$80,$80,$cf,$35,$38,$f4,$3,$7f,$87,$f9,$6f,$a2,$12,$ff,$31
frame704: .byte $2f,$1f,$ff,$ff,$ff,$ff,$ee,$13,$fe,$15,$fb,$6f,$b6,$fb,$7f,$c8,$f9,$8f,$97,$fa,$7f,$a6,$fb,$6f,$b7,$fb,$7f,$a9,$f8,$af,$7b,$f5,$df,$4c,$f5,$9f,$83,$24,$fe,$13,$fe,$28,$f8,$9f,$68,$f9,$5f,$f5
frame705: .byte $2f,$1f,$ff,$ff,$fe,$c3,$fd,$5f,$b7,$fa,$7f,$b6,$fc,$5f,$b7,$fa,$7f,$b7,$fa,$7f,$a6,$fb,$6f,$b6,$fb,$7f,$a9,$f8,$af,$6c,$f4,$df,$4d,$f4,$cf,$6a,$fa,$2,$fd,$2f,$e2,$bf,$4c,$f6,$8f,$93,$ff,$a1
frame706: .byte $36,$1f,$ff,$eb,$2f,$e1,$5f,$c6,$fb,$6f,$b6,$fc,$4f,$a8,$f8,$af,$7a,$fb,$6f,$b7,$fb,$6f,$a7,$fa,$7f,$97,$f9,$9f,$7c,$f5,$df,$3e,$1f,$27,$26,$f2,$72,$4f,$47,$32,$f9,$33,$2f,$93,$32,$f8,$34,$2f,$ba,$f4,$df,$4b,$fb,$5f,$f4
frame707: .byte $37,$1f,$ff,$ff,$b1,$fe,$15,$fb,$7f,$a8,$fa,$7f,$a7,$fb,$6f,$a8,$f8,$af,$7a,$f7,$bf,$3e,$1f,$25,$27,$f4,$14,$7f,$a7,$fa,$7f,$99,$f7,$af,$7b,$f4,$e2,$f1,$e3,$f1,$e4,$ee,$4e,$5e,$e4,$e4,$ee,$5e,$2f,$5a,$fa,$3f,$cc,$f3,$e3,$e1
frame708: .byte $3a,$1f,$f8,$1f,$e1,$5f,$b8,$f9,$af,$7b,$f6,$bf,$77,$fa,$8f,$a8,$f5,$3,$9f,$3e,$1f,$4e,$1f,$6b,$f7,$bf,$6b,$f6,$bf,$6a,$f7,$8f,$89,$f8,$af,$7b,$f6,$cf,$4e,$2f,$1e,$4e,$e3,$e7,$ee,$1e,$8e,$e1,$e9,$ed,$e9,$ec,$ea,$ed,$e9,$ee,$1e,$42,$2a
frame709: .byte $3c,$1f,$ff,$ff,$fe,$e2,$6f,$a8,$f9,$8f,$8a,$f7,$bf,$7a,$f8,$af,$8a,$f8,$af,$8a,$f6,$ce,$e3,$15,$e1,$ee,$14,$2e,$3e,$d5,$1e,$4e,$e2,$e7,$ee,$34,$1e,$1e,$e4,$32,$df,$4c,$f5,$bf,$6b,$f6,$bf,$5c,$f5,$cf,$4d,$f3,$e1,$f2,$e3,$ee,$4e,$7e,$e1,$e9,$61
frame710: .byte $40,$1f,$ff,$ff,$ff,$fe,$23,$fc,$7f,$a8,$f7,$bf,$6c,$f6,$df,$4e,$1f,$4d,$ee,$22,$5b,$ee,$44,$4c,$ee,$25,$4c,$ee,$34,$4c,$ee,$33,$2e,$1e,$e3,$e7,$ee,$2e,$8e,$e2,$e8,$ee,$13,$2e,$4e,$e5,$e5,$ee,$4e,$5e,$e5,$e4,$f1,$e3,$f1,$e2,$f2,$e1,$f3,$bf,$6b,$f6,$bf,$5d,$a1
frame711: .byte $3d,$1f,$ff,$ff,$fe,$e5,$5f,$b8,$f8,$9f,$7b,$f6,$cf,$5d,$f5,$de,$81,$e1,$be,$84,$cb,$e9,$4c,$be,$a4,$cb,$e9,$64,$e4,$e9,$ee,$1e,$ae,$e1,$ea,$62,$e5,$e9,$ed,$ea,$ec,$ec,$ea,$ee,$20,$1e,$3f,$2e,$1f,$3c,$f5,$8f,$9a,$f7,$bf,$5c,$f5,$df,$3e,$2f,$2e,$26
frame712: .byte $38,$1f,$ff,$ff,$ff,$b4,$fb,$9f,$7b,$f5,$cf,$4d,$f4,$df,$4d,$f4,$df,$5d,$e5,$5d,$ce,$56,$cd,$e4,$9a,$de,$4a,$ab,$e8,$83,$e3,$ea,$ec,$ec,$ea,$ed,$e9,$f5,$cf,$5c,$f5,$cf,$5c,$f6,$bf,$6b,$f7,$af,$7a,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$41
frame713: .byte $39,$1f,$2e,$1f,$3e,$1f,$4d,$f4,$df,$4d,$f5,$cf,$6b,$f6,$bf,$7a,$f7,$ad,$4e,$99,$c6,$eb,$6c,$8e,$87,$dc,$9e,$1e,$4e,$e5,$e6,$ee,$3e,$8e,$e1,$ed,$e9,$f9,$8f,$a7,$fa,$7f,$a7,$fb,$6f,$b6,$fc,$5f,$d4,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$d4
frame714: .byte $33,$1d,$5e,$e1,$2e,$16,$ee,$11,$e1,$7f,$b8,$fa,$8f,$ac,$f8,$cf,$6e,$1f,$5e,$be,$be,$ce,$ce,$ae,$e3,$e6,$f1,$e3,$f4,$df,$5c,$f5,$cf,$4d,$f4,$df,$4d,$f5,$cf,$b6,$fb,$6f,$e1,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$31
frame715: .byte $34,$1f,$d3,$fe,$22,$fe,$31,$ff,$ff,$eb,$5f,$d6,$fb,$9f,$8b,$f7,$cf,$5e,$5f,$1e,$7e,$16,$83,$3e,$58,$8e,$2f,$2e,$4e,$e5,$e5,$ee,$4e,$6e,$e3,$ea,$ec,$ee,$2e,$7f,$1b,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$72,$fc,$af,$7b,$61
frame716: .byte $2e,$1f,$ff,$ff,$ff,$ff,$ff,$fe,$b5,$fd,$9f,$b9,$f5,$e2,$f1,$ea,$ee,$2e,$be,$ae,$e5,$e4,$f2,$e5,$32,$ec,$e5,$1a,$e6,$ee,$3e,$6f,$1e,$3f,$7a,$fb,$6f,$e1,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$31
frame717: .byte $1a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e3
frame718: .byte $34,$1e,$de,$8e,$de,$9e,$de,$9e,$ce,$ae,$ce,$ae,$de,$9e,$e1,$e8,$ed,$e9,$ed,$e9,$ee,$3e,$6f,$2e,$2f,$28,$43,$f1,$86,$2e,$e5,$8f,$88,$f7,$9f,$78,$f7,$9f,$78,$f7,$8f,$79,$f7,$5f,$c3,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$eb
frame719: .byte $38,$1e,$3e,$8e,$e1,$e6,$ee,$3e,$3f,$1e,$2f,$2e,$1f,$3e,$1f,$3e,$1f,$3d,$f2,$e1,$f3,$df,$3c,$f5,$bf,$6b,$f6,$bf,$7a,$f7,$af,$a0,$33,$fd,$3f,$e1,$3f,$e1,$3f,$d3,$fe,$13,$fe,$12,$fe,$13,$fd,$3f,$e1,$3f,$e1,$2f,$ff,$ff,$ff,$fe,$71
frame720: .byte $2d,$1e,$59,$f8,$bf,$6b,$f6,$bf,$7a,$f7,$9f,$88,$f9,$7f,$a6,$f8,$8f,$88,$f9,$8f,$a7,$fa,$7f,$a6,$fc,$5f,$b5,$fc,$6f,$c5,$fe,$22,$fe,$22,$fe,$22,$fe,$22,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ea
frame721: .byte $2c,$1e,$73,$fe,$13,$fb,$8f,$8a,$f7,$9f,$98,$fa,$7f,$a6,$fb,$5f,$a7,$fa,$6f,$b6,$fb,$6f,$b6,$fc,$4f,$d5,$fc,$5f,$c4,$fe,$13,$fe,$21,$fe,$32,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e1
frame722: .byte $2b,$1e,$48,$f8,$9f,$89,$f9,$8f,$a6,$fb,$6f,$b5,$fb,$6f,$a6,$fb,$6f,$b6,$fc,$5f,$c4,$fe,$13,$fe,$14,$fd,$4f,$d3,$fe,$21,$fe,$31,$fe,$32,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fd
frame723: .byte $31,$1f,$ff,$ff,$ff,$ff,$ee,$32,$fe,$13,$fe,$12,$fe,$22,$fe,$32,$fe,$24,$fa,$8f,$99,$f8,$8f,$98,$fa,$6f,$b6,$fb,$5f,$c5,$fa,$6f,$b6,$fb,$6f,$b6,$fc,$5f,$d5,$fd,$4f,$d5,$fc,$4e,$bf,$f7,$1f,$e3,$1e,$d1
frame724: .byte $37,$1e,$64,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$5f,$c5,$f7,$7,$61,$1f,$30,$41,$94,$1e,$e3,$e6,$ee,$3e,$5e,$e3,$e8,$eb,$ed,$df,$ff,$ff,$ff,$ff,$ff,$ff,$22,$fe,$21,$fe,$22,$fe,$31,$fe,$32,$fe,$13,$fd,$6f,$b8,$f9,$8e,$81
frame725: .byte $2c,$1b,$6,$1c,$ee,$51,$2e,$10,$b1,$ed,$e3,$9,$1e,$de,$41,$4e,$de,$8e,$9e,$d2,$4a,$f9,$7f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fa,$2f,$e2,$1e,$d1
frame726: .byte $1f,$1a,$e9,$55,$66,$4e,$b2,$a1,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e1
frame727: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame728: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame729: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame730: .byte $1c,$ff,$ff,$ff,$ff,$ff,$22,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ea,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$71
frame731: .byte $1e,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$22,$fd,$3e,$51,$ff,$fe,$21,$ff,$ff,$ff,$ff,$ff,$fc,$1f,$ff,$fb
frame732: .byte $1d,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$41,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$b1,$f1,$1f,$e8
frame733: .byte $31,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f1,$4f,$d4,$fd,$4f,$d4,$fd,$3f,$e1,$3f,$e1,$2f,$e2,$1e,$e1,$1e,$64,$fd,$2f,$e2,$1f,$e3,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$e2,$2f,$e3,$8,$1f,$ff,$fe,$11
frame734: .byte $33,$ff,$ff,$ff,$ff,$ff,$f2,$5f,$a9,$f6,$cf,$4e,$1f,$2e,$2f,$2e,$1f,$3e,$1f,$2e,$2f,$2e,$1f,$4c,$f3,$11,$cf,$6b,$f7,$8f,$c5,$fc,$5f,$c5,$fb,$6f,$98,$f7,$af,$6b,$f6,$bf,$6b,$fb,$6f,$e1,$11,$1f,$e1,$11,$1f,$61
frame735: .byte $37,$ff,$ff,$ff,$ff,$28,$f7,$cf,$3e,$2f,$2e,$2f,$1e,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$3f,$1e,$2f,$2e,$1f,$4c,$f6,$bf,$97,$fb,$4f,$d5,$fc,$5f,$b6,$fa,$8f,$89,$f6,$bf,$4d,$f3,$e1,$f3,$e1,$f4,$df,$5c,$f7,$c,$51,$1e,$e5
frame736: .byte $3d,$ff,$fe,$64,$fa,$af,$5e,$1f,$2e,$3e,$e5,$e4,$ee,$4e,$6e,$e2,$e6,$ee,$3e,$6e,$e3,$e5,$ee,$3e,$5e,$e5,$e3,$f1,$e1,$f4,$cf,$78,$11,$f9,$61,$1f,$98,$f8,$5f,$d5,$fc,$5f,$b6,$fa,$8f,$89,$f7,$af,$6b,$f4,$df,$3e,$1f,$2e,$2f,$2e,$2f,$2e,$2f,$3e,$1e,$e4
frame737: .byte $40,$ff,$51,$fb,$af,$5e,$1f,$2e,$3e,$e5,$e4,$ee,$4e,$5e,$e3,$e6,$ee,$3e,$5e,$e3,$e5,$ee,$4e,$4e,$e5,$e2,$f2,$e1,$f3,$df,$5a,$fa,$82,$1f,$86,$3,$f6,$af,$78,$fa,$5f,$c5,$fb,$6f,$21,$77,$f9,$8f,$7a,$f5,$cf,$3e,$1f,$2e,$2f,$1e,$4e,$e5,$e4,$f2,$11,$df,$7a,$ee,$31
frame738: .byte $3a,$ff,$23,$fa,$af,$5c,$f3,$e1,$f3,$cf,$4d,$f3,$df,$3e,$2f,$2e,$1f,$3d,$f3,$df,$48,$23,$f4,$74,$3f,$34,$74,$f3,$36,$6f,$b6,$fb,$8f,$97,$fa,$6f,$b6,$fb,$6f,$a7,$f9,$8f,$7a,$f6,$bf,$3e,$1f,$2e,$2f,$1e,$3f,$1e,$4e,$e5,$8,$df,$7a,$ee,$11
frame739: .byte $3b,$ff,$fe,$38,$f7,$9f,$6a,$f6,$af,$6b,$f5,$e1,$f3,$e1,$f2,$e2,$f2,$e1,$f3,$72,$4f,$36,$53,$f3,$57,$3f,$23,$94,$f2,$28,$6f,$11,$97,$fa,$8f,$97,$fa,$6f,$c4,$fc,$6f,$a7,$f9,$8f,$6b,$f3,$e1,$f2,$e2,$f1,$e3,$ee,$5e,$4f,$1e,$3f,$4d,$f7,$ae,$e1
frame740: .byte $3b,$ff,$fe,$57,$f8,$8f,$7a,$f6,$af,$6a,$f6,$df,$4d,$f3,$e1,$f3,$df,$3d,$f4,$82,$3f,$46,$53,$f3,$65,$4f,$24,$75,$f2,$27,$61,$1f,$96,$12,$f8,$8f,$a5,$fc,$5f,$b6,$fa,$7f,$98,$f8,$9f,$20,$8b,$f2,$e2,$f1,$e3,$f1,$e4,$ee,$5e,$4f,$4d,$f6,$be,$c1
frame741: .byte $3b,$ff,$fe,$66,$f9,$8f,$7a,$f6,$af,$6a,$f6,$cf,$5d,$f3,$e1,$f3,$df,$3d,$f4,$82,$3f,$47,$43,$f3,$65,$5f,$14,$66,$f1,$46,$52,$1e,$e5,$18,$61,$2f,$88,$fa,$5f,$c5,$fb,$6f,$a7,$f9,$8f,$89,$f7,$af,$5c,$f2,$e2,$f2,$e2,$f1,$e3,$f2,$e2,$f5,$ce,$c1
frame742: .byte $3a,$ff,$fe,$77,$f8,$9f,$79,$f6,$bf,$5b,$f6,$cf,$4d,$f4,$df,$3d,$f4,$cf,$57,$23,$f5,$64,$3f,$45,$55,$f2,$37,$5f,$22,$85,$11,$f9,$61,$2f,$88,$fa,$5f,$c5,$fb,$6f,$a7,$f8,$9f,$6b,$f3,$e1,$f1,$e3,$f1,$e3,$ee,$5e,$4f,$3e,$1f,$5d,$f5,$ce,$a1
frame743: .byte $3a,$ff,$97,$f7,$df,$2e,$4e,$e4,$e6,$ee,$2e,$8e,$e1,$e8,$ed,$e8,$ee,$4a,$12,$f4,$6f,$b5,$fc,$4f,$e1,$3f,$e1,$4f,$d5,$fd,$5f,$c6,$fb,$7f,$a7,$fb,$4f,$c4,$fc,$5f,$a8,$f8,$9f,$5c,$f1,$e3,$ee,$5e,$4e,$e5,$e4,$f1,$e3,$f3,$e1,$f4,$df,$5c,$ea
frame744: .byte $3a,$ff,$ff,$ff,$ff,$e3,$9f,$6d,$f2,$e4,$ee,$5e,$5e,$e3,$e7,$ee,$1e,$8e,$e1,$e9,$ee,$2e,$7e,$e1,$e8,$ee,$2e,$7e,$e2,$e6,$ee,$35,$3a,$ee,$45,$fc,$5f,$d6,$fb,$5f,$b6,$fa,$6f,$a8,$f8,$9f,$6b,$f4,$df,$3e,$1f,$2e,$2f,$2e,$3f,$3e,$1f,$4d,$e8
frame745: .byte $3a,$ff,$ff,$ff,$ff,$ff,$fe,$43,$fd,$5f,$b6,$fa,$6f,$b5,$fd,$44,$6f,$35,$29,$f2,$e3,$f1,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$55,$1b,$f1,$41,$bf,$15,$29,$ee,$56,$28,$ee,$57,$44,$f1,$8f,$7a,$f5,$cf,$4d,$f3,$e1,$f2,$e2,$f3,$e2,$f2,$e2,$f4,$de,$71
frame746: .byte $34,$ff,$ff,$ff,$ff,$ff,$fe,$54,$fd,$5f,$b6,$fa,$6f,$b5,$fd,$4f,$d5,$fc,$5f,$c6,$fb,$6f,$b6,$fc,$41,$1f,$b4,$14,$f7,$e1,$f2,$71,$ae,$e3,$73,$be,$d9,$f7,$af,$5c,$f3,$e1,$f2,$e2,$f2,$e2,$f2,$e3,$f2,$e2,$f3,$e1,$e6
frame747: .byte $33,$ff,$ff,$ff,$ff,$ff,$fe,$64,$fd,$5f,$b6,$fa,$6f,$b5,$fd,$4f,$d5,$fc,$5f,$c5,$fc,$5f,$c5,$fd,$4f,$d5,$fb,$9f,$76,$24,$f4,$76,$3e,$e5,$88,$4e,$e1,$9b,$2e,$cb,$f4,$df,$3e,$1f,$3e,$1f,$2e,$2f,$3e,$1f,$4d,$e6
frame748: .byte $39,$ff,$ff,$ff,$ff,$ff,$fe,$82,$fe,$14,$fb,$7f,$97,$fb,$4f,$e1,$3f,$e1,$4f,$d7,$fa,$51,$2f,$95,$1,$f7,$54,$2f,$83,$52,$f6,$54,$1f,$76,$41,$f5,$74,$1f,$46,$61,$f3,$85,$1f,$1a,$f5,$cf,$4d,$f2,$e2,$f2,$e2,$f2,$e2,$f3,$e1,$f5,$ce,$61
frame749: .byte $30,$ff,$ff,$ff,$ff,$ff,$51,$fe,$15,$fc,$9f,$7a,$f7,$7f,$a5,$fd,$3f,$e2,$3f,$e1,$4f,$d4,$fc,$5f,$c4,$fd,$4f,$d5,$fc,$5f,$b6,$fa,$7f,$89,$f6,$bf,$4d,$f3,$e1,$f2,$e2,$f3,$e1,$f4,$df,$5d,$f6,$be,$41
frame750: .byte $3b,$ee,$13,$fe,$13,$fe,$21,$fe,$21,$fe,$31,$fe,$22,$fe,$13,$fd,$5f,$c5,$fc,$5f,$c4,$fd,$4f,$e1,$3f,$e1,$4f,$d5,$fb,$7f,$91,$24,$fa,$12,$4f,$a0,$83,$fe,$13,$fd,$5f,$b6,$fa,$7f,$a7,$f9,$8f,$7b,$f5,$cf,$3e,$1f,$2e,$2f,$2e,$3f,$2e,$2f,$5c,$e2
frame751: .byte $38,$ff,$ff,$ff,$ff,$e3,$2f,$e1,$5f,$b6,$fb,$6f,$b6,$fb,$6f,$b5,$f6,$be,$e5,$e6,$f3,$e2,$f6,$14,$6f,$b6,$fa,$7f,$a7,$fb,$12,$3f,$b1,$14,$fb,$7f,$a7,$f9,$8f,$7a,$f5,$df,$1e,$3e,$e5,$e4,$ee,$4e,$5e,$e3,$e6,$ee,$4e,$6e,$e5,$e4,$e2
frame752: .byte $3d,$ff,$ff,$fb,$5f,$b7,$f9,$9f,$89,$f8,$9f,$89,$f9,$8f,$a5,$11,$fb,$41,$1e,$e1,$e7,$ed,$ea,$e7,$ee,$4e,$4b,$d8,$e3,$cc,$8e,$35,$e7,$7e,$61,$91,$b7,$ee,$31,$b7,$ee,$21,$c7,$ee,$11,$d7,$fa,$8f,$b6,$fb,$6f,$a7,$f9,$9f,$89,$f7,$af,$6b,$f5,$df,$3e,$1d
frame753: .byte $3a,$ff,$ff,$ff,$ff,$ec,$1f,$d6,$fa,$8f,$98,$f8,$af,$89,$f9,$8f,$a6,$fc,$5f,$c5,$ea,$ed,$a2,$5f,$19,$e2,$e2,$a8,$24,$3e,$9a,$f8,$9f,$89,$e7,$1e,$68,$f9,$9f,$8a,$f6,$81,$4f,$66,$33,$f5,$73,$3f,$47,$43,$f2,$95,$1f,$1b,$41,$f1,$bf,$5d,$41
frame754: .byte $35,$ff,$ff,$ff,$ff,$ff,$e6,$2f,$d6,$fa,$8f,$99,$f7,$af,$89,$fa,$7f,$a7,$fb,$6e,$bc,$65,$84,$ae,$e1,$1e,$ba,$e1,$59,$14,$21,$e5,$8f,$98,$fa,$7e,$92,$e4,$7f,$b6,$fb,$6f,$b6,$fb,$6f,$c5,$fc,$5f,$b6,$fa,$7f,$a7,$f9,$81
frame755: .byte $23,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$31,$fd,$8f,$6b,$7e,$47,$ff,$fe,$4a,$ee,$15,$1f,$92,$ff,$ff,$ff,$d4,$ff,$ff,$ff,$ff,$ff,$ee,$31
frame756: .byte $20,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ed,$e9,$82,$8f,$ff,$fc,$9f,$8e,$5e,$6a,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ee,$31
frame757: .byte $3f,$eb,$a8,$20,$7e,$ba,$c2,$ec,$8e,$11,$eb,$9e,$11,$eb,$8e,$21,$ea,$5e,$52,$e9,$6e,$52,$e8,$e,$2e,$62,$e8,$e,$2e,$43,$e9,$c,$1e,$44,$e8,$3e,$64,$e9,$4f,$d3,$fe,$13,$fe,$21,$ff,$ff,$ff,$fe,$8e,$8e,$6f,$52,$ff,$f1,$af,$7e,$6e,$af,$ff,$ff,$ff,$ff,$ff,$11
frame758: .byte $56,$e6,$bc,$6e,$7a,$c6,$e7,$ab,$7e,$88,$b8,$e9,$7b,$8e,$88,$a9,$e7,$8a,$ae,$78,$aa,$e6,$99,$ae,$78,$9a,$e7,$89,$be,$78,$8b,$e7,$88,$ce,$68,$ab,$e5,$9a,$ae,$68,$ab,$e5,$99,$be,$59,$9b,$e5,$a8,$be,$79,$81,$28,$e7,$97,$8,$8e,$69,$80,$88,$be,$d3,$87,$f9,$8f,$b6,$fe,$2b,$21,$7b,$e5,$91,$27,$c4,$2b,$b0,$d0,$5c,$2a,$5b,$9,$11,$ee,$32,$b0,$9f,$fe,$61
frame759: .byte $4d,$e8,$b5,$9e,$b9,$78,$ed,$76,$9e,$d7,$69,$ed,$76,$9e,$d7,$59,$ed,$76,$9e,$d7,$68,$ed,$85,$9e,$c9,$58,$ec,$95,$9e,$c8,$68,$ec,$86,$9e,$b8,$79,$ea,$87,$9e,$a9,$6a,$e8,$a7,$ae,$7a,$7b,$e7,$a7,$ae,$98,$99,$e8,$98,$ae,$7a,$89,$e7,$a8,$9e,$4e,$71,$aa,$f7,$af,$98,$fd,$43,$81,$11,$e2,$e6,$f6,$bf,$a7,$fe,$13,$fe,$41
frame760: .byte $60,$e7,$ee,$2e,$7e,$e2,$e6,$d2,$e1,$e7,$51,$53,$e1,$e8,$23,$53,$63,$5e,$d4,$45,$54,$ed,$45,$46,$3e,$d4,$55,$53,$ed,$45,$55,$3e,$d4,$45,$72,$ec,$54,$57,$2e,$c4,$55,$72,$eb,$55,$57,$2e,$b4,$64,$91,$ea,$55,$59,$1e,$a4,$65,$91,$e9,$56,$59,$1e,$86,$56,$91,$e8,$66,$59,$1e,$85,$65,$92,$e7,$75,$59,$29,$ee,$37,$33,$f6,$5e,$1e,$8b,$28,$f3,$af,$a6,$fd,$4f,$e1,$3f,$e1,$3f,$e1,$3f,$e1,$3f,$e1,$31
frame761: .byte $4b,$ee,$1e,$1f,$5d,$f4,$df,$2e,$2f,$1e,$4e,$e5,$e4,$f2,$e2,$f3,$e1,$f3,$41,$af,$30,$ca,$f3,$24,$9f,$22,$59,$f1,$25,$ae,$e4,$35,$be,$e3,$35,$be,$e2,$36,$be,$e2,$35,$ce,$e1,$35,$de,$e1,$35,$de,$3e,$15,$da,$f7,$75,$e8,$e2,$44,$ee,$2c,$33,$ee,$4c,$3,$f1,$e2,$f2,$e1,$f3,$df,$4d,$f4,$df,$4e,$1f,$3e,$1f,$3c
frame762: .byte $51,$f3,$df,$3e,$2f,$2a,$f7,$af,$7b,$f6,$bf,$5b,$f6,$cf,$4e,$1f,$3e,$1f,$3d,$f4,$e1,$f2,$e3,$f2,$e2,$f2,$e2,$e1,$5e,$1a,$23,$ae,$28,$93,$32,$9c,$64,$21,$64,$e,$7e,$5e,$23,$41,$4e,$be,$61,$4e,$de,$23,$4e,$dd,$54,$ed,$c6,$4e,$e1,$c5,$4e,$e1,$c5,$4e,$e1,$c5,$4e,$de,$14,$4e,$de,$23,$5e,$ce,$32,$5e,$be,$51,$5e,$be,$61,$4e,$be,$61
frame763: .byte $58,$ff,$ff,$ff,$fc,$3f,$d9,$f7,$a3,$2f,$1a,$44,$ee,$4a,$57,$ec,$b6,$e6,$ca,$6b,$75,$99,$77,$e2,$46,$97,$6e,$54,$3c,$56,$e7,$41,$c4,$7e,$9e,$15,$6e,$cb,$66,$eb,$d5,$6e,$be,$14,$6e,$be,$14,$6e,$ab,$14,$35,$eb,$b2,$42,$5e,$ae,$52,$5e,$ae,$52,$5e,$e1,$61,$45,$5e,$d7,$41,$55,$ec,$84,$24,$5e,$ba,$42,$44,$eb,$a5,$14,$4e,$ab,$52,$34,$ea,$c4,$24,$3e,$9d,$51,$21
frame764: .byte $53,$ff,$ff,$ff,$ff,$ff,$fe,$e1,$5f,$ba,$a1,$ed,$aa,$2c,$59,$9c,$e1,$27,$3a,$d9,$ce,$1d,$6e,$59,$e2,$5e,$78,$e2,$5e,$88,$e1,$5e,$88,$d6,$e8,$9c,$6e,$8b,$a6,$e8,$80,$3a,$5e,$88,$23,$95,$e8,$e1,$85,$e8,$c1,$27,$5e,$86,$23,$32,$65,$e8,$64,$14,$25,$5e,$85,$b1,$55,$e8,$5b,$25,$4e,$85,$c1,$54,$e7,$7b,$15,$4e,$68,$e5,$4e,$58,$e5,$4e,$49,$c1
frame765: .byte $56,$ff,$ff,$ff,$f4,$2f,$d5,$12,$f8,$8f,$98,$f9,$8f,$89,$e4,$2a,$e5,$e5,$c8,$ae,$69,$b9,$e6,$6e,$28,$e6,$6e,$49,$e3,$5e,$55,$14,$e2,$5e,$5c,$d5,$e5,$92,$3b,$5e,$59,$24,$a5,$e5,$82,$69,$5e,$5d,$3,$94,$e5,$c4,$19,$4e,$58,$91,$84,$e5,$5c,$27,$4e,$55,$d1,$75,$e3,$6e,$11,$74,$e2,$7e,$12,$64,$e2,$7e,$21,$64,$e1,$9e,$11,$74,$d9,$e9,$4d,$9e,$a3,$d9,$e2
frame766: .byte $57,$ff,$ff,$fd,$3f,$c8,$f9,$7f,$a8,$f8,$9f,$88,$f9,$8f,$1e,$3e,$71,$83,$78,$e8,$ab,$7e,$86,$e2,$9e,$55,$e3,$61,$4e,$35,$e4,$be,$25,$e4,$92,$3c,$5e,$48,$34,$b5,$e4,$82,$5b,$5e,$4d,$3,$95,$e4,$92,$14,$1a,$4e,$45,$c1,$94,$e4,$5d,$18,$4e,$36,$d2,$75,$e1,$7e,$11,$75,$e1,$7e,$21,$74,$d8,$e2,$35,$4d,$8e,$32,$54,$ca,$e3,$16,$4b,$ae,$a4,$ba,$eb,$49,$be,$51
frame767: .byte $55,$ff,$ff,$ff,$ee,$23,$fc,$8f,$97,$fa,$8f,$88,$f9,$8f,$a7,$f2,$e1,$e9,$18,$36,$8e,$99,$b7,$e9,$6e,$28,$e6,$5e,$35,$14,$e4,$5e,$3c,$e2,$5e,$39,$23,$d5,$e3,$93,$3c,$5e,$47,$17,$b5,$e4,$c0,$1a,$5e,$47,$91,$95,$e4,$4d,$18,$5e,$35,$d2,$75,$e3,$5e,$11,$75,$e2,$7e,$11,$74,$e1,$8e,$12,$64,$e1,$8e,$23,$45,$c9,$e3,$25,$4c,$9e,$a4,$c9,$eb,$3b,$ae,$71
frame768: .byte $55,$ff,$ff,$ff,$ee,$23,$fc,$8f,$97,$fa,$8f,$89,$f8,$8f,$98,$f9,$8e,$e5,$e3,$ee,$24,$97,$e9,$8d,$7e,$75,$e3,$ae,$45,$e4,$ae,$35,$e4,$91,$2e,$15,$e4,$92,$3c,$5e,$48,$34,$b5,$e4,$d2,$1a,$5e,$4d,$1,$95,$e5,$4c,$18,$5e,$45,$d1,$75,$e4,$5d,$26,$5e,$36,$e1,$16,$5e,$28,$e1,$15,$5e,$28,$e1,$25,$4e,$19,$e2,$33,$5d,$9e,$32,$35,$d9,$e4,$14,$4d,$9e,$71
frame769: .byte $57,$ff,$ff,$ff,$ee,$14,$fc,$8f,$88,$f9,$9f,$89,$f7,$9f,$98,$f8,$9e,$e4,$e4,$ee,$24,$6a,$e9,$7d,$6e,$94,$e4,$8e,$63,$e5,$ae,$43,$e5,$ce,$23,$e6,$91,$2e,$13,$e6,$93,$3b,$3e,$69,$33,$b3,$e6,$e3,$a3,$e6,$d3,$28,$3e,$65,$62,$42,$73,$e6,$5d,$17,$3e,$65,$e1,$16,$3e,$56,$e1,$25,$3e,$48,$e1,$24,$3e,$39,$e2,$14,$3e,$39,$e2,$23,$3e,$39,$e3,$e,$3e,$2a,$e4,$21
frame770: .byte $47,$ff,$ff,$fb,$2f,$c7,$12,$f6,$af,$79,$f8,$af,$7a,$f6,$af,$89,$f7,$af,$79,$ee,$1e,$8e,$b4,$9a,$ea,$4e,$26,$ea,$1e,$68,$f9,$bf,$6c,$f6,$df,$4a,$23,$f2,$a3,$4e,$e5,$a3,$5e,$e4,$e6,$ee,$3e,$23,$2e,$e2,$66,$34,$2e,$e1,$6e,$12,$ed,$6e,$21,$ec,$7e,$22,$ea,$8e,$32,$e9,$9e,$31,$e8,$ae,$41,$21
frame771: .byte $43,$ff,$fe,$b2,$fc,$60,$1f,$6b,$f5,$bf,$6b,$f6,$cf,$5b,$f5,$bf,$5d,$f6,$af,$6b,$ed,$91,$ce,$9e,$ce,$a2,$d9,$fb,$7f,$b8,$f8,$df,$5d,$f4,$e2,$f2,$e3,$f1,$c3,$4e,$e4,$c3,$4e,$e3,$b4,$5e,$e2,$e8,$ee,$1e,$43,$2e,$d7,$37,$42,$ec,$78,$16,$2e,$b7,$e3,$2e,$98,$e3,$2e,$98,$e4,$22
frame772: .byte $43,$ff,$fe,$75,$41,$f5,$cf,$4c,$f5,$bf,$6c,$f5,$df,$4c,$f3,$df,$4e,$1f,$5c,$f4,$ce,$aa,$2d,$ea,$eb,$f3,$e1,$f6,$af,$9a,$f9,$af,$7e,$1f,$3e,$3f,$1e,$4e,$e5,$e5,$ee,$4e,$12,$4e,$e3,$d4,$5e,$de,$14,$4e,$e1,$d2,$7e,$de,$ae,$ce,$62,$3e,$b8,$46,$52,$ea,$79,$26,$2e,$97,$e4,$32
frame773: .byte $44,$ff,$42,$fc,$72,$3f,$4c,$f4,$cf,$4d,$f5,$df,$4d,$f4,$cf,$4d,$f3,$e1,$f5,$cf,$5c,$ea,$eb,$eb,$15,$e5,$f5,$bf,$7a,$f8,$bf,$8d,$f4,$e2,$f2,$e4,$f1,$e4,$ee,$5e,$5e,$e4,$e1,$24,$ee,$2e,$14,$4e,$e1,$e1,$44,$ed,$d3,$7e,$ce,$be,$be,$72,$3e,$b8,$28,$43,$ea,$79,$25,$3e,$97,$e4,$32
frame774: .byte $46,$ff,$33,$fc,$70,$7f,$4c,$f4,$cf,$5d,$f4,$e1,$f3,$e1,$f3,$df,$3e,$1f,$2e,$2f,$5c,$ea,$a2,$ce,$be,$bf,$4c,$f6,$bf,$6c,$f7,$cf,$7d,$f4,$e2,$f2,$a1,$6f,$19,$17,$ee,$5e,$5e,$e4,$e1,$24,$ee,$2e,$23,$4e,$e1,$d4,$5e,$dd,$28,$ec,$eb,$eb,$e7,$23,$eb,$83,$74,$3e,$a7,$92,$52,$ea,$7e,$42,$31
frame775: .byte $45,$ff,$42,$fd,$62,$3f,$4c,$f4,$cf,$5c,$f5,$df,$4d,$f4,$cf,$4d,$f3,$e2,$f4,$ce,$ab,$2c,$ea,$14,$e6,$f4,$df,$5b,$f6,$cf,$7c,$f7,$df,$4e,$2f,$2a,$16,$f1,$91,$7e,$e5,$e5,$ee,$4e,$12,$4e,$e2,$e2,$34,$ee,$1e,$14,$4e,$dd,$46,$ec,$ea,$ec,$e7,$3,$ec,$e5,$42,$eb,$87,$35,$2e,$a7,$e3,$33
frame776: .byte $43,$ff,$fe,$85,$fa,$cf,$4c,$f4,$cf,$5d,$f4,$e1,$f3,$df,$3d,$f3,$e1,$ea,$58,$de,$8c,$2c,$ee,$3e,$6f,$3d,$f5,$bf,$7a,$f8,$bf,$8b,$f6,$e1,$f3,$e3,$f2,$91,$6f,$1e,$4e,$e5,$e5,$ee,$4e,$12,$4e,$e2,$e1,$35,$ee,$1d,$45,$ed,$d2,$7e,$de,$ae,$ce,$62,$3e,$b9,$45,$43,$ea,$88,$25,$24
frame777: .byte $44,$ff,$fe,$a7,$f8,$af,$7e,$2f,$2d,$f3,$df,$4d,$f2,$e3,$f1,$e2,$f3,$de,$79,$5e,$1e,$6e,$e3,$ee,$3e,$5f,$3e,$1f,$5b,$f7,$af,$98,$f9,$af,$7d,$f4,$e1,$f3,$91,$6f,$1e,$4e,$e5,$e5,$ee,$4e,$20,$7e,$e3,$e2,$24,$ee,$2e,$13,$5e,$dd,$45,$ed,$ea,$ec,$e7,$7,$eb,$e6,$32,$eb,$96,$44,$23
frame778: .byte $4b,$ed,$4f,$a9,$f7,$af,$7e,$2f,$1e,$2f,$2d,$f2,$e2,$f1,$e4,$f2,$e1,$f2,$e1,$e6,$95,$e1,$e3,$f1,$e3,$49,$e5,$e4,$1e,$3e,$1f,$6b,$f8,$8f,$98,$f9,$af,$7c,$f5,$e2,$f2,$a1,$5f,$1a,$16,$ee,$5a,$17,$ee,$4e,$6e,$e3,$e2,$24,$ee,$1e,$32,$5e,$ce,$33,$5e,$be,$32,$6e,$be,$ce,$ae,$90,$7e,$aa,$37,$32,$e9,$a7,$34,$21
frame779: .byte $4b,$ed,$bf,$5e,$4e,$e5,$e3,$f1,$e1,$f1,$e2,$f1,$e4,$f1,$e3,$f1,$e2,$e8,$38,$e1,$c2,$3e,$e5,$cb,$1e,$bc,$6d,$e3,$f5,$cf,$6b,$f8,$8f,$9a,$f7,$cf,$4e,$2f,$3e,$3f,$1a,$26,$ee,$4a,$27,$ee,$3a,$27,$ee,$3b,$19,$ee,$1e,$41,$4e,$de,$50,$7e,$de,$50,$3e,$de,$43,$2e,$de,$9e,$de,$9e,$dc,$19,$ed,$b6,$4e,$e1,$a9,$21
frame780: .byte $5b,$ee,$4e,$2e,$e5,$e4,$ee,$4e,$6e,$e4,$e5,$21,$ee,$2e,$33,$83,$e2,$2e,$25,$fc,$5d,$ae,$75,$ae,$4e,$44,$5e,$ae,$25,$4e,$ce,$15,$4e,$e2,$a6,$4e,$e2,$b5,$4e,$e1,$e1,$33,$ee,$2e,$22,$3e,$e2,$e7,$ee,$2c,$26,$ee,$3b,$26,$ee,$3b,$34,$ee,$3c,$25,$ee,$3d,$15,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$d0,$1e,$e5,$c4,$1e,$e4,$c5,$1e,$e3,$b7
frame781: .byte $46,$1e,$49,$ee,$51,$4e,$3e,$de,$be,$be,$be,$ae,$ce,$ae,$de,$9e,$de,$9e,$e1,$e7,$ee,$5e,$4e,$e5,$e4,$ee,$4e,$5e,$e4,$e4,$ee,$5e,$4f,$1e,$3f,$1e,$3f,$1e,$2f,$2e,$2f,$2e,$2f,$2e,$2f,$2e,$2f,$2e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$2e,$2f,$1e,$2f,$2e,$3e,$e5,$d1
frame782: .byte $34,$1a,$ee,$4e,$5e,$e4,$e4,$f1,$e3,$f2,$e2,$f4,$cf,$5c,$f4,$df,$4c,$f5,$cf,$6b,$f7,$af,$79,$f8,$9f,$89,$f8,$9f,$89,$f8,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$89,$f7,$af,$7a,$f6,$bf,$5c,$f4,$df,$47
frame783: .byte $31,$1a,$f6,$af,$7a,$f7,$af,$79,$f8,$9f,$89,$f8,$9f,$89,$f8,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$fa,$7f,$a7,$fa,$7f,$b6,$fb,$7f,$b6,$fb,$6f,$c5,$fc,$6f,$61
frame784: .byte $32,$1a,$f7,$af,$7a,$f7,$af,$7a,$f8,$9f,$89,$f8,$9f,$89,$f8,$9f,$98,$f9,$8f,$98,$fa,$7f,$a7,$fa,$7f,$b7,$fa,$7f,$b6,$fb,$6f,$c5,$fc,$5f,$d5,$fc,$5f,$d4,$fe,$14,$fe,$13,$fe,$22,$fe,$32,$fe,$31,$ff,$ff,$51
frame785: .byte $2d,$79,$f8,$9f,$89,$f9,$8f,$98,$f9,$8f,$a7,$fa,$7f,$a7,$fb,$7f,$a7,$fb,$6f,$b6,$fc,$5f,$c5,$fd,$5f,$c5,$fd,$4f,$e1,$4f,$e1,$3f,$e2,$2f,$e3,$2f,$e3,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$d1
frame786: .byte $27,$c8,$fa,$7f,$a7,$fb,$6f,$b6,$fc,$5f,$d5,$fc,$5f,$d4,$fe,$14,$fe,$13,$fe,$22,$fe,$32,$fe,$31,$fe,$41,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f3
frame787: .byte $21,$e4,$4f,$d5,$fd,$4f,$e1,$3f,$e2,$3f,$e2,$2f,$e4,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e2
frame788: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame789: .byte $1b,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$91,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$c1
frame790: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fb,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f5
frame791: .byte $1c,$ff,$ff,$ff,$ff,$ff,$fe,$62,$fe,$21,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$b1
frame792: .byte $1c,$ff,$ff,$ff,$ff,$e1,$3f,$e1,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e1
frame793: .byte $1d,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ec,$4f,$d5,$fc,$5f,$d3,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e4
frame794: .byte $22,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e2,$41,$1f,$9a,$f7,$af,$88,$f9,$8f,$8a,$f7,$af,$7b,$f7,$8f,$ff,$ff,$ff,$ff,$ff,$ff,$11
frame795: .byte $40,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e4,$1f,$51,$50,$94,$1f,$10,$8a,$1,$ee,$41,$1e,$3e,$e5,$e3,$f1,$e2,$f1,$82,$8e,$e2,$c,$d2,$3e,$c2,$3e,$13,$2e,$a3,$3e,$13,$3e,$93,$3e,$13,$3e,$93,$4b,$53,$e9,$47,$47,$3e,$c4,$e1,$4e,$e2,$58,$5f,$2c,$ff,$fe,$81
frame796: .byte $41,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f8,$18,$1e,$e3,$8,$1e,$41,$fe,$61,$e6,$1e,$e3,$1e,$32,$ee,$31,$e4,$1e,$e2,$1e,$61,$ea,$1e,$d2,$e5,$2f,$22,$52,$f7,$af,$45,$65,$ee,$44,$c4,$ee,$13,$e2,$4e,$c4,$e3,$3e,$c4,$e3,$4e,$c4,$e1,$4e,$d5,$c4,$ee,$38,$28,$f2,$cf,$f4
frame797: .byte $34,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fd,$15,$15,$1e,$e4,$1e,$81,$e7,$1f,$c1,$f3,$1c,$1f,$fe,$91,$82,$f6,$1f,$ed,$2f,$42,$92,$f4,$1e,$c8,$ee,$42,$88,$82,$e7,$29,$6a,$1e,$e2,$28,$2f,$52,$82,$ff,$41
frame798: .byte $2b,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e2,$1f,$ca,$f3,$42,$53,$3e,$e3,$45,$45,$3e,$d4,$64,$64,$eb,$37,$37,$4e,$b4,$e3,$4e,$b5,$e1,$5c
frame799: .byte $25,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e4,$4f,$d5,$fc,$5f,$c4,$fe,$13,$fe,$14,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$c6,$fa,$8f,$98,$e7
frame800: .byte $2b,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e4,$5f,$c5,$fc,$5f,$d4,$fd,$4f,$d4,$fd,$4f,$c6,$fb,$6f,$b6,$f7,$e1,$ee,$54,$36,$34,$ee,$13,$56,$53,$ec,$36,$65,$4c
frame801: .byte $25,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f2,$2f,$e1,$4f,$d4,$fd,$5f,$c5,$fc,$5f,$c5,$fb,$6f,$b6,$fb,$7f,$a7,$fa,$7f,$a6,$fa,$8f,$98,$e7
frame802: .byte $27,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$e4,$2f,$e1,$5f,$c4,$fd,$4f,$d4,$fd,$5f,$c5,$fb,$6f,$b6,$fb,$7f,$98,$fa,$7f,$a6,$fa,$8f,$98,$f9,$8f,$8a,$e6
frame803: .byte $27,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$b6,$fc,$4f,$d4,$fd,$4f,$d4,$fd,$5f,$b6,$fb,$6f,$b7,$f9,$8f,$98,$fa,$7f,$98,$f9,$8f,$98,$f8,$af,$7a,$f7,$ae,$61
frame804: .byte $28,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fa,$2f,$d6,$fc,$4f,$d4,$fd,$4f,$d4,$fd,$5f,$b6,$fb,$6f,$b7,$f9,$8f,$98,$fa,$7f,$98,$f9,$8f,$98,$f8,$af,$7a,$f7,$af,$7a,$e6
frame805: .byte $28,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f8,$6f,$c5,$fc,$4f,$d4,$fd,$4f,$d4,$fd,$5f,$b6,$fb,$6f,$b7,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f8,$af,$7a,$f7,$af,$7a,$e6
frame806: .byte $29,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$b4,$fb,$6f,$c4,$fd,$4f,$d4,$fd,$4f,$c6,$fb,$6f,$b6,$fb,$6f,$a8,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f8,$af,$7a,$f7,$af,$7a,$e6
frame807: .byte $29,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$87,$fb,$6f,$b5,$fd,$4f,$d4,$fc,$5f,$c6,$fb,$6f,$b6,$fa,$7f,$a8,$f9,$8f,$89,$f8,$af,$88,$f9,$8f,$98,$f8,$af,$7a,$f7,$af,$6b,$e6
frame808: .byte $2a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$48,$f9,$7f,$b6,$fb,$5f,$c5,$fc,$5f,$c5,$fc,$6f,$b6,$fa,$7f,$a7,$fa,$8f,$89,$f8,$af,$6c,$f5,$af,$98,$f8,$9f,$8a,$f7,$af,$6b,$f6,$be,$61
frame809: .byte $2b,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e7,$6f,$88,$fa,$7f,$b5,$fc,$5f,$c5,$fb,$6f,$b6,$fb,$7f,$a7,$fa,$7f,$a7,$f9,$9f,$8a,$f6,$cf,$4e,$1f,$2c,$f7,$af,$89,$f8,$9f,$8a,$f6,$bf,$6b,$e6
frame810: .byte $31,$ff,$ff,$ff,$ff,$ff,$ff,$f5,$3f,$89,$f8,$8f,$a7,$fb,$6f,$b5,$fb,$6f,$b6,$fa,$8f,$99,$f9,$8f,$98,$f8,$9f,$8b,$f5,$df,$3e,$2f,$1e,$11,$2e,$e4,$51,$9f,$24,$29,$f4,$12,$9f,$89,$f7,$bf,$6b,$f6,$be,$61
frame811: .byte $38,$ff,$ff,$ff,$ff,$ff,$ff,$f4,$2f,$8a,$f8,$8f,$98,$fa,$7f,$a6,$fb,$6f,$b7,$fa,$8f,$8a,$f6,$bf,$6c,$f5,$41,$7f,$54,$18,$f3,$42,$9f,$15,$2a,$ee,$45,$29,$11,$ee,$35,$39,$ee,$45,$39,$ee,$53,$59,$ee,$51,$79,$f7,$af,$7b,$f6,$be,$61
frame812: .byte $3b,$ff,$ff,$ff,$ff,$ff,$ff,$ed,$41,$6f,$7a,$f7,$af,$89,$f9,$8f,$97,$fa,$7f,$a7,$fa,$9f,$8a,$f6,$bf,$5c,$f4,$e1,$f3,$e1,$f4,$41,$9f,$24,$39,$ee,$55,$3a,$ee,$35,$49,$ee,$35,$48,$ee,$46,$39,$ee,$44,$59,$ee,$43,$69,$ee,$33,$6a,$ee,$32,$7b,$e6
frame813: .byte $38,$ff,$ff,$ff,$ff,$ff,$fe,$24,$f7,$e,$7f,$6b,$f6,$cf,$6a,$f8,$9f,$88,$f9,$8f,$98,$fa,$9f,$8a,$f7,$af,$7b,$f5,$cf,$5c,$f4,$df,$4e,$1f,$2e,$3e,$e5,$e5,$ee,$4e,$4e,$e4,$e4,$11,$ee,$28,$19,$ee,$37,$39,$ee,$27,$3a,$ee,$17,$4a,$e6
frame814: .byte $34,$ff,$ff,$ff,$ff,$ff,$f9,$15,$6f,$5d,$f5,$cf,$5c,$f6,$bf,$7a,$f7,$9f,$88,$f9,$9f,$99,$f8,$bf,$6b,$f6,$cf,$5c,$f5,$cf,$4d,$f4,$e1,$f3,$e2,$f1,$e3,$ee,$5e,$4e,$e5,$e3,$ee,$5e,$5e,$e3,$e6,$ee,$2e,$7e,$e2,$e7,$e3
frame815: .byte $39,$ea,$2f,$ff,$ff,$ff,$ff,$93,$f7,$23,$7f,$5c,$f6,$bf,$6b,$f7,$af,$7a,$f7,$9f,$89,$f7,$af,$8b,$f6,$cf,$5d,$f4,$e1,$f3,$e1,$f3,$e2,$f1,$e2,$f1,$e4,$ee,$5e,$5e,$e3,$e6,$ee,$2e,$7e,$e2,$e7,$ee,$3e,$6e,$e3,$e6,$ee,$2e,$7e,$e2,$e7,$c1
frame816: .byte $51,$ea,$2f,$ff,$ff,$fb,$1f,$e3,$23,$6e,$e2,$14,$8,$ce,$e1,$14,$14,$be,$e1,$c,$24,$be,$e1,$c,$25,$bf,$6b,$f5,$cf,$5a,$f6,$be,$e2,$18,$be,$e2,$c,$24,$ce,$d6,$4d,$ec,$64,$e1,$eb,$63,$e3,$ea,$63,$e4,$e9,$62,$e5,$e9,$62,$e6,$e8,$61,$e6,$e9,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$1e,$8e,$e1,$e8,$ee,$11
frame817: .byte $6f,$e6,$c,$c,$2f,$72,$62,$e5,$1e,$61,$81,$e5,$1e,$61,$81,$e5,$1e,$61,$81,$e5,$1e,$62,$62,$e5,$1e,$63,$43,$e5,$1e,$63,$43,$e5,$1e,$64,$24,$e5,$1e,$64,$24,$e5,$1e,$63,$43,$e5,$1f,$e2,$2e,$62,$62,$e5,$1e,$61,$81,$e5,$1e,$62,$62,$e4,$2e,$64,$24,$e4,$2e,$6a,$e3,$3e,$6a,$e2,$4e,$6a,$e1,$5e,$6a,$d6,$e6,$ac,$7e,$6a,$b8,$e6,$aa,$8e,$7a,$98,$e8,$a8,$8e,$9a,$78,$1,$e6,$a7,$80,$1e,$6a,$77,$32,$e6,$a7,$64,$2e,$6a,$75,$43,$e6,$a6,$55,$3e,$6a,$64,$62,$11
frame818: .byte $5c,$e2,$66,$6e,$e4,$59,$4e,$e4,$59,$4e,$e4,$59,$4e,$e4,$67,$5e,$e4,$66,$6e,$e4,$74,$7e,$e4,$74,$7e,$e4,$83,$7e,$e4,$83,$7e,$e4,$75,$6e,$e4,$2e,$12,$ee,$42,$7,$60,$e2,$ee,$45,$85,$ee,$47,$56,$ee,$48,$28,$ee,$48,$28,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$4e,$5e,$21
frame819: .byte $53,$a9,$c7,$e7,$aa,$8e,$7a,$99,$e7,$b7,$ae,$7b,$6b,$e7,$c5,$be,$7c,$4c,$e7,$d4,$be,$7c,$6a,$e7,$c6,$ae,$76,$e4,$5e,$75,$e6,$4e,$75,$17,$46,$14,$e7,$a9,$9e,$7b,$89,$e7,$c4,$ce,$7d,$3c,$e7,$d2,$de,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2e,$7e,$e2,$e7,$ee,$2a
frame820: .byte $4b,$5e,$38,$e1,$ae,$38,$e1,$ae,$46,$e2,$ae,$46,$e2,$ae,$47,$12,$ba,$e4,$ba,$ae,$4b,$aa,$e4,$ab,$ad,$7,$ab,$ac,$e2,$ba,$be,$3b,$ac,$15,$7d,$ae,$66,$da,$e4,$ba,$ae,$1d,$ba,$e1,$bd,$ae,$1a,$e1,$ae,$56,$e1,$ae,$65,$e1,$ae,$73,$e2,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$51
frame821: .byte $32,$1e,$78,$f9,$7f,$a7,$fa,$e1,$f3,$e1,$f4,$df,$4d,$f4,$cf,$4c,$f5,$bf,$6a,$f6,$bf,$4e,$2f,$24,$29,$f1,$42,$9f,$23,$29,$ee,$56,$19,$ee,$56,$1d,$f3,$df,$52,$37,$fb,$5f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e5
frame822: .byte $43,$1e,$6e,$2f,$2e,$2f,$3e,$1f,$3e,$1f,$3d,$f4,$df,$4c,$f5,$bf,$6b,$8,$f3,$e1,$f1,$e2,$f1,$e3,$ee,$55,$38,$ee,$55,$38,$ee,$55,$39,$32,$ec,$46,$90,$8e,$c4,$5e,$1e,$c3,$5e,$2e,$b4,$4e,$2e,$c4,$4e,$2e,$b4,$56,$17,$ec,$45,$2f,$44,$fd,$3f,$e2,$1f,$ff,$ff,$ff,$ff,$ff,$ee,$41
frame823: .byte $6a,$1e,$6e,$2c,$1e,$8e,$1c,$1e,$8d,$d1,$e8,$dd,$1e,$8c,$e1,$1e,$8c,$12,$b1,$e9,$a1,$4a,$1e,$9e,$1b,$1e,$9e,$1b,$1e,$8e,$2b,$1e,$7e,$3b,$1e,$65,$38,$52,$51,$e5,$53,$94,$26,$1e,$55,$2b,$23,$61,$e4,$54,$e2,$61,$e3,$55,$e2,$61,$e3,$45,$e3,$61,$e3,$44,$e4,$61,$e3,$35,$e4,$61,$e2,$45,$e3,$71,$e2,$44,$73,$4a,$1e,$24,$44,$e7,$1e,$14,$62,$e8,$1e,$13,$ee,$41,$c5,$ee,$41,$c4,$ee,$51,$e1,$1f,$11,$fe,$31,$fe,$31,$fe,$31,$fe,$31,$fe,$31
frame824: .byte $64,$1e,$4e,$2b,$4e,$5e,$2b,$4e,$5e,$1c,$4e,$5e,$1c,$4e,$6c,$d4,$e6,$dc,$4e,$6e,$1b,$4e,$6e,$1b,$4e,$6e,$1b,$4e,$6d,$c4,$e5,$e1,$32,$74,$e4,$51,$92,$37,$4e,$44,$1a,$c,$84,$e3,$51,$e1,$84,$e3,$41,$e3,$74,$e2,$41,$e4,$74,$e2,$32,$e3,$84,$e2,$32,$e3,$84,$e1,$42,$e1,$a4,$e1,$42,$5e,$64,$e1,$43,$3e,$74,$e1,$3e,$e1,$4e,$13,$ee,$14,$e1,$3e,$e1,$4d,$4e,$e1,$4e,$13,$ee,$14,$fd,$4f,$d4,$fd,$4f,$d4,$fd,$4f,$d4
frame825: .byte $50,$1a,$ce,$48,$bc,$e4,$8c,$be,$48,$cb,$e4,$8c,$ae,$58,$ca,$e5,$8c,$be,$48,$cc,$e3,$8c,$ce,$38,$db,$e3,$8c,$c1,$1e,$18,$cb,$12,$e1,$8b,$e2,$e1,$8b,$e2,$e1,$8a,$e3,$e1,$8a,$e3,$e1,$8a,$e1,$e3,$89,$32,$4e,$98,$93,$e,$eb,$89,$3e,$e2,$89,$3e,$e2,$89,$3e,$e2,$8a,$2e,$e2,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98
frame826: .byte $51,$15,$7e,$8e,$16,$7e,$8e,$16,$7e,$8e,$17,$7e,$7e,$17,$7e,$7e,$17,$8e,$6e,$13,$21,$9e,$6e,$13,$ce,$6e,$13,$be,$7e,$13,$32,$6e,$7e,$14,$3,$8e,$5e,$15,$be,$5e,$14,$be,$6e,$14,$9e,$8e,$15,$ae,$6e,$19,$5e,$7e,$1a,$3e,$8e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3e,$1f,$3a,$11,$f5,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$79,$f8,$86
frame827: .byte $5a,$13,$8e,$4e,$65,$6e,$5e,$65,$5e,$6e,$65,$5e,$6e,$65,$5e,$6e,$62,$81,$2e,$3e,$62,$be,$3e,$63,$ae,$3e,$65,$7e,$4e,$66,$6e,$4e,$66,$5e,$5e,$62,$9e,$5e,$63,$8e,$5e,$64,$5e,$7e,$65,$5e,$6e,$66,$3e,$7e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e1,$32,$ee,$3e,$14,$1e,$e3,$d4,$2e,$e3,$d4,$2e,$e3,$c5,$2e,$e3,$af,$7a,$f7,$9f,$89,$91,$ee,$3b,$f6,$bf,$6b,$21,$51
frame828: .byte $5d,$12,$8e,$1e,$a4,$7e,$1e,$a4,$6e,$2e,$a4,$5e,$3e,$a4,$4e,$4e,$a4,$41,$1e,$2e,$a3,$8e,$1e,$a2,$9e,$1e,$a3,$7e,$2e,$a4,$6e,$2e,$a4,$5e,$3e,$a1,$8e,$3e,$a2,$7e,$3e,$a4,$3e,$5e,$a4,$4e,$4e,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$ae,$ce,$52,$3e,$ce,$43,$3e,$ce,$34,$3e,$ce,$33,$4e,$ce,$25,$3e,$ce,$16,$3e,$ce,$1f,$3e,$18,$1e,$ce,$25,$3e,$ce,$43,$3e,$ce,$43,$3e,$ce,$35,$2e,$ce,$35,$21
frame829: .byte $5c,$12,$8d,$eb,$38,$de,$b3,$7e,$1e,$b4,$5e,$2e,$b4,$4e,$3e,$b4,$3e,$4e,$b4,$6e,$1e,$b2,$8e,$1e,$b2,$8e,$1e,$b4,$5e,$2e,$b4,$5e,$2e,$b3,$6e,$2e,$b2,$5e,$4e,$b4,$4e,$3e,$b6,$1e,$4e,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$52,$4e,$be,$44,$3e,$be,$42,$5e,$be,$34,$4e,$be,$26,$3e,$be,$27,$2e,$be,$28,$1e,$be,$27,$2e,$be,$53,$3e,$be,$44,$3e,$be,$44,$3e,$be,$44,$3e,$be,$45,$21
frame830: .byte $5c,$12,$7e,$1e,$b3,$8d,$eb,$37,$e1,$eb,$36,$e2,$eb,$44,$e3,$eb,$43,$e4,$eb,$45,$e2,$eb,$36,$e2,$eb,$27,$e2,$eb,$26,$e3,$eb,$45,$e2,$eb,$45,$e2,$eb,$26,$e3,$eb,$53,$e3,$eb,$61,$e4,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$e5,$24,$eb,$e4,$34,$eb,$e4,$25,$eb,$e2,$54,$eb,$e2,$54,$eb,$e1,$82,$eb,$e2,$72,$eb,$e3,$53,$eb,$e5,$24,$eb,$e4,$34,$eb,$e4,$43,$eb,$e4,$43,$eb,$e4,$43
frame831: .byte $5c,$12,$7e,$1e,$b3,$8d,$eb,$37,$e1,$eb,$36,$e2,$eb,$44,$e3,$eb,$43,$e4,$eb,$45,$e2,$eb,$36,$e2,$eb,$36,$e2,$eb,$26,$e3,$eb,$45,$e2,$eb,$45,$e2,$eb,$26,$e3,$eb,$53,$e3,$eb,$61,$e4,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$e4,$34,$eb,$e4,$34,$eb,$e3,$35,$eb,$e2,$54,$eb,$e1,$64,$eb,$e1,$82,$eb,$e3,$62,$eb,$e3,$53,$eb,$e5,$24,$eb,$e5,$24,$eb,$e5,$33,$eb,$e4,$43,$eb,$e4,$43
frame832: .byte $5d,$12,$7e,$1e,$b3,$8d,$eb,$37,$e1,$eb,$36,$e2,$eb,$35,$e3,$eb,$34,$e4,$eb,$44,$e3,$eb,$45,$e2,$eb,$36,$e2,$eb,$44,$e3,$eb,$45,$e2,$eb,$36,$e2,$eb,$26,$e3,$eb,$53,$e3,$eb,$61,$e4,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$e4,$34,$eb,$e4,$34,$eb,$e3,$35,$eb,$e3,$44,$eb,$e2,$63,$eb,$e2,$72,$eb,$e2,$72,$eb,$e3,$b,$4e,$be,$52,$4e,$be,$52,$4e,$be,$53,$3e,$be,$44,$3e,$be,$44,$31
frame833: .byte $5d,$11,$7e,$2e,$b2,$9d,$eb,$29,$de,$b3,$7e,$1e,$b3,$5e,$3e,$b3,$5e,$3e,$b3,$5e,$3e,$b4,$4e,$3e,$b4,$5e,$2e,$b4,$6e,$1e,$b4,$32,$1e,$1e,$b3,$6e,$2e,$b2,$7e,$2e,$b4,$4e,$3e,$b5,$2e,$4e,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$43,$4e,$be,$43,$4e,$be,$42,$5e,$be,$25,$4e,$be,$18,$2e,$be,$18,$2e,$be,$35,$3e,$be,$30,$b4,$eb,$e5,$24,$eb,$e5,$24,$eb,$e5,$33,$eb,$e5,$33,$eb,$e4,$43
frame834: .byte $5e,$11,$8e,$1e,$b2,$9d,$eb,$29,$de,$b2,$8e,$1e,$b3,$6e,$2e,$b3,$5e,$3e,$b3,$5e,$3e,$b3,$5e,$3e,$b4,$4e,$3e,$b4,$6e,$1e,$b4,$40,$8c,$eb,$27,$e2,$eb,$28,$e1,$eb,$44,$e3,$eb,$52,$e4,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$e6,$14,$eb,$e4,$34,$eb,$e4,$34,$eb,$e4,$34,$eb,$e2,$72,$eb,$e1,$82,$eb,$e1,$82,$eb,$e3,$53,$eb,$e3,$10,$73,$eb,$e5,$33,$eb,$e5,$33,$eb,$e5,$33,$eb,$e5,$33,$eb,$e5,$33
frame835: .byte $5d,$1a,$de,$b1,$ad,$eb,$19,$e1,$eb,$26,$e3,$eb,$25,$e4,$eb,$16,$e4,$eb,$16,$e4,$eb,$25,$e4,$eb,$34,$e4,$eb,$37,$e1,$eb,$34,$23,$ce,$b1,$8e,$2e,$b1,$8e,$2e,$b2,$7e,$2e,$b3,$3e,$5e,$be,$be,$be,$be,$be,$be,$be,$be,$70,$8e,$be,$44,$3e,$be,$53,$3e,$be,$44,$3e,$be,$26,$3e,$be,$27,$2e,$be,$18,$2e,$be,$45,$2e,$be,$45,$2e,$be,$63,$2e,$be,$54,$2e,$be,$54,$2e,$be,$54,$2e,$be,$55,$11
frame836: .byte $53,$8e,$3e,$e5,$e4,$ee,$4e,$5e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$5e,$4f,$3e,$1e,$e3,$34,$ce,$e5,$33,$bf,$1e,$3f,$2e,$2f,$1e,$3e,$e2,$e7,$eb,$eb,$eb,$eb,$eb,$eb,$e8,$12,$eb,$e6,$32,$eb,$e6,$32,$eb,$e6,$32,$eb,$e4,$52,$eb,$e3,$62,$eb,$e2,$81,$eb,$e3,$71,$eb,$e2,$21,$ee,$4e,$7e,$e2,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$56
frame837: .byte $4e,$2e,$9e,$de,$9e,$de,$9e,$ce,$ae,$ce,$ae,$ce,$ae,$de,$9e,$e3,$e6,$f1,$e3,$ec,$27,$e1,$ee,$14,$5c,$ee,$34,$4b,$ee,$45,$3a,$ee,$56,$1a,$ee,$5e,$4e,$e4,$e5,$ed,$e9,$eb,$eb,$eb,$eb,$e9,$ed,$e7,$ee,$2e,$8e,$e1,$e8,$ee,$1e,$31,$5e,$de,$23,$2e,$e2,$e1,$f3,$df,$4d,$f4,$e1,$32,$ee,$3e,$7e,$e2,$e8,$ee,$1e,$8e,$e1,$e8,$31
frame838: .byte $49,$1e,$ce,$9e,$de,$ae,$ce,$ce,$ae,$e1,$e8,$ee,$4e,$5f,$2e,$2e,$91,$cc,$ea,$3c,$ae,$a5,$71,$2a,$ea,$ec,$ea,$ec,$ea,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$e9,$e6,$43,$e9,$e6,$61,$e9,$e7,$ee,$2e,$6e,$e3,$e4,$ee,$5e,$2f,$2e,$3f,$1e,$5e,$e3,$e7,$ee,$2e,$e1
frame839: .byte $4f,$e4,$e4,$f3,$e1,$f5,$cf,$6a,$ee,$42,$79,$ee,$33,$79,$ed,$67,$8e,$cc,$37,$e6,$ee,$3e,$5e,$e3,$e5,$ee,$3e,$6e,$e2,$e7,$ee,$1e,$8e,$de,$9e,$ce,$ae,$be,$be,$ae,$ce,$9e,$de,$8e,$e1,$e7,$ee,$2e,$6e,$e3,$e5,$ee,$4e,$4e,$32,$a1,$1e,$5e,$34,$5e,$9e,$44,$3e,$ae,$6e,$e3,$e8,$ee,$1e,$c2,$1e,$6e,$e3,$e6,$ee,$2e,$7e,$de,$9e,$c9
frame840: .byte $50,$ee,$2e,$1f,$5c,$f7,$bf,$7a,$f8,$95,$1f,$37,$63,$f1,$76,$4f,$16,$66,$ee,$55,$67,$e1,$79,$47,$a6,$d8,$47,$ee,$48,$28,$ee,$47,$38,$ee,$38,$29,$ee,$2e,$7e,$73,$5e,$7e,$8e,$e1,$a1,$be,$d9,$2a,$ee,$18,$38,$ee,$37,$37,$ee,$57,$36,$f1,$64,$7e,$28,$86,$48,$8e,$36,$55,$93,$e9,$45,$6f,$51,$57,$fa,$8f,$99,$f8,$9f,$8a,$f7,$ce,$e5
frame841: .byte $67,$19,$e9,$c4,$ae,$ac,$3b,$eb,$a3,$be,$c9,$3c,$ec,$83,$ce,$d7,$3d,$ed,$63,$de,$d6,$3e,$1e,$c6,$3e,$2e,$b6,$3e,$3b,$2a,$63,$cd,$59,$63,$96,$65,$49,$54,$84,$a5,$39,$54,$73,$d5,$1a,$45,$64,$de,$25,$55,$4e,$2e,$14,$64,$5e,$2e,$13,$74,$5e,$2d,$38,$36,$e2,$c2,$a3,$66,$37,$a1,$c3,$66,$48,$e8,$27,$66,$7e,$72,$67,$5a,$e5,$26,$81,$e3,$e2,$26,$ee,$1d,$26,$ee,$2c,$27,$ee,$2b,$27,$ee,$3a,$36,$ee,$49,$37,$ee,$48,$39,$ee,$46
frame842: .byte $6c,$1c,$e8,$d1,$ce,$ac,$1c,$ec,$a1,$be,$e1,$91,$be,$e2,$81,$be,$e3,$71,$be,$e3,$71,$b2,$7e,$86,$1e,$9e,$66,$19,$1d,$e6,$51,$82,$e1,$e5,$51,$72,$e2,$e5,$51,$62,$e3,$e5,$42,$52,$81,$9e,$44,$24,$37,$47,$e4,$42,$42,$76,$56,$2a,$33,$33,$85,$55,$49,$33,$24,$84,$65,$49,$24,$24,$e4,$73,$82,$51,$5e,$4e,$51,$61,$5e,$5e,$41,$61,$5e,$5e,$31,$71,$6e,$4e,$e5,$e5,$ee,$4e,$6e,$e4,$e6,$ee,$3e,$7e,$e2,$eb,$14,$e7,$ee,$2e,$8e,$e1,$e9,$ee,$1e,$ae,$ca
frame843: .byte $5f,$1a,$18,$e4,$f2,$e4,$f2,$e3,$e1,$2e,$4e,$3c,$2e,$6e,$3a,$2e,$7e,$48,$2a,$38,$e4,$73,$95,$8e,$45,$39,$68,$e4,$53,$96,$8e,$53,$3b,$58,$e5,$33,$c3,$9e,$53,$3e,$ae,$72,$3e,$ae,$70,$ce,$ae,$80,$ce,$9e,$90,$ce,$8e,$a0,$ce,$7e,$b2,$3e,$6e,$b2,$3e,$5e,$c2,$3e,$5e,$b3,$3e,$4a,$3c,$25,$e3,$95,$b2,$5e,$39,$5a,$27,$e2,$a3,$b1,$8e,$3e,$91,$ae,$2f,$3e,$1f,$4e,$1f,$4e,$1f,$4e,$1f,$4e,$2e,$91
frame844: .byte $5b,$ae,$e1,$29,$9e,$e3,$28,$7e,$e5,$37,$6f,$23,$66,$e7,$49,$45,$5e,$85,$85,$44,$e8,$77,$54,$4e,$87,$76,$33,$ea,$58,$63,$3e,$b3,$97,$c,$f6,$70,$cf,$58,$c,$f4,$a1,$2f,$3b,$12,$f2,$c1,$2d,$99,$e1,$12,$bf,$31,$29,$f5,$12,$8f,$61,$27,$f7,$12,$7f,$60,$c6,$f7,$23,$5f,$72,$35,$a3,$eb,$34,$49,$5e,$a3,$44,$95,$e9,$45,$3a,$3e,$a4,$62,$f4,$57,$1f,$36,$81,$f1,$7f,$98,$f8,$91
frame845: .byte $4e,$9e,$e4,$e4,$f2,$df,$5c,$45,$ee,$2a,$2b,$ec,$91,$e2,$eb,$ec,$eb,$ec,$ea,$ed,$ea,$ec,$ea,$ed,$e9,$ed,$ea,$c3,$ae,$ac,$4a,$e9,$b5,$ae,$9c,$49,$95,$9e,$c8,$69,$ec,$87,$81,$1e,$a8,$69,$11,$ea,$95,$be,$b9,$3c,$eb,$ec,$eb,$eb,$eb,$e6,$14,$ec,$e4,$25,$ec,$e2,$27,$ed,$b4,$7e,$e4,$46,$9f,$7b,$f5,$61,$6f,$37,$17,$f1,$81
frame846: .byte $52,$16,$f1,$27,$6f,$23,$65,$f4,$35,$4f,$54,$43,$ea,$3b,$44,$3e,$95,$a5,$32,$ea,$5a,$62,$1e,$c3,$b6,$21,$f8,$71,$1f,$87,$f9,$8f,$99,$f7,$af,$6b,$f5,$cf,$3e,$1e,$48,$6e,$4e,$1f,$3d,$f4,$cf,$5b,$f6,$af,$61,$19,$f6,$11,$89,$5e,$b1,$18,$87,$e9,$3,$78,$7e,$90,$37,$87,$e8,$33,$68,$7e,$74,$45,$a4,$e8,$45,$4f,$35,$64,$f1,$67,$3e,$e5,$71
frame847: .byte $4b,$15,$f5,$bf,$79,$48,$ee,$27,$3c,$ee,$15,$2e,$3e,$d4,$1e,$5e,$c0,$ee,$7e,$ce,$be,$be,$be,$cb,$3a,$eb,$a6,$8e,$b9,$78,$eb,$97,$8e,$b9,$78,$eb,$a5,$9e,$bb,$3a,$eb,$ea,$ec,$ea,$b2,$ce,$aa,$5a,$ea,$a5,$ae,$aa,$5a,$ea,$b2,$ce,$ae,$de,$ae,$ce,$ae,$ce,$be,$ce,$ae,$de,$ae,$ce,$be,$ce,$cd,$29,$ed,$93,$bf,$56
frame848: .byte $51,$5f,$62,$44,$f8,$23,$3f,$92,$32,$fb,$3,$2e,$e1,$4b,$1,$1e,$e1,$6a,$1,$1e,$e1,$79,$4e,$e2,$79,$4e,$e2,$79,$4e,$e3,$69,$4e,$e4,$3a,$5f,$c5,$fb,$6d,$6e,$97,$ac,$e5,$88,$e3,$e2,$97,$e6,$bb,$6e,$a5,$e1,$5f,$c4,$fd,$4f,$d3,$fe,$13,$d2,$ee,$43,$b5,$ee,$33,$b5,$ee,$42,$b5,$ee,$42,$c3,$ee,$30,$9f,$d0,$9f,$c2,$fe,$13,$fd,$4f,$c5
frame849: .byte $50,$ed,$e5,$ee,$5e,$5e,$e4,$e6,$ee,$4e,$6e,$e3,$e6,$ee,$3e,$7d,$4b,$e7,$c6,$ae,$7c,$6a,$e7,$d4,$be,$7e,$e2,$e7,$ee,$2e,$7e,$e1,$e8,$ee,$1e,$8e,$de,$9e,$ce,$ae,$be,$be,$ae,$ce,$9e,$de,$9e,$de,$8b,$2e,$1e,$89,$6c,$e8,$88,$be,$88,$8b,$e8,$88,$be,$88,$7c,$e8,$95,$de,$8e,$d1,$1e,$8e,$b0,$3e,$7e,$b1,$4e,$7e,$91,$6e,$7e,$71,$31
frame850: .byte $3d,$11,$fe,$21,$fe,$31,$ff,$ff,$ff,$ff,$ff,$f3,$6e,$73,$e3,$ce,$35,$de,$2e,$16,$be,$6c,$6a,$e8,$c4,$ae,$ae,$ce,$ae,$ce,$be,$b9,$5a,$eb,$87,$ae,$a8,$8a,$e9,$88,$be,$79,$8c,$e4,$c6,$e2,$e1,$e1,$4e,$68,$ff,$ff,$ff,$fe,$e4,$1f,$e2,$3f,$d2,$12,$fb,$31
frame851: .byte $50,$2e,$e5,$e1,$11,$e5,$4a,$e1,$e5,$89,$e1,$e4,$89,$e1,$e4,$89,$e1,$e4,$89,$e1,$e4,$7a,$e1,$e5,$5a,$e2,$f2,$e2,$f1,$e3,$f1,$e3,$ee,$5e,$4e,$e4,$e5,$ee,$3e,$6e,$e1,$e8,$ec,$ea,$e8,$ee,$1e,$6e,$e3,$e5,$ee,$4e,$4e,$e5,$e3,$f1,$e2,$f2,$e1,$f3,$e1,$f3,$df,$4d,$c4,$e6,$dc,$5e,$5d,$b6,$e5,$dc,$5e,$5d,$c4,$e7,$cf,$31,$2b,$f3,$11
frame852: .byte $47,$1f,$e2,$18,$3f,$ac,$f3,$e3,$ee,$4e,$6e,$e3,$e7,$ee,$2e,$8e,$e1,$e9,$ed,$ea,$ec,$ea,$ec,$eb,$eb,$eb,$eb,$92,$de,$b7,$6b,$c3,$97,$6b,$b6,$77,$6b,$a7,$78,$5b,$a8,$6e,$ba,$86,$eb,$a8,$6e,$c9,$77,$ec,$a5,$8e,$ce,$ae,$de,$9e,$e1,$e8,$ee,$1e,$8e,$e2,$e7,$ee,$4e,$4f,$1e,$2f,$59,$ff,$ff,$ec
frame853: .byte $45,$e9,$1e,$39,$e7,$5e,$19,$e7,$6d,$9e,$76,$d9,$e7,$6d,$9e,$84,$e1,$9f,$89,$f7,$af,$7a,$f6,$bf,$5c,$f4,$df,$3e,$1f,$2e,$2e,$e5,$e4,$ee,$3e,$6e,$9e,$de,$6e,$e3,$e4,$ee,$5e,$2f,$2e,$1f,$3d,$f4,$cf,$5c,$f5,$bf,$6b,$b6,$e7,$ba,$8e,$6a,$b8,$e6,$aa,$9e,$6a,$b8,$e6,$ab,$8e,$6b,$b6,$e7
frame854: .byte $3b,$ff,$ff,$ff,$ff,$ed,$3f,$d5,$fb,$7e,$28,$e5,$7c,$e1,$e3,$5b,$e5,$e2,$3b,$e7,$ee,$2e,$8e,$e1,$e9,$ed,$ea,$ec,$ea,$ec,$eb,$eb,$eb,$eb,$ec,$ea,$ed,$e9,$a5,$ce,$89,$7c,$e7,$89,$ce,$59,$9e,$1e,$1b,$9e,$48,$e2,$7f,$b5,$fe,$11,$ff,$ff,$ff,$fa
frame855: .byte $4c,$2e,$2e,$e5,$e6,$ee,$3e,$7e,$e2,$e8,$ee,$1e,$9e,$de,$9e,$de,$ae,$ce,$ae,$ce,$be,$be,$be,$be,$be,$be,$bc,$57,$eb,$c6,$6e,$bb,$76,$75,$cb,$76,$67,$bc,$57,$59,$9e,$22,$85,$99,$ec,$59,$9e,$c5,$99,$ec,$67,$ae,$c7,$5b,$ec,$ea,$ec,$ea,$ec,$eb,$eb,$eb,$eb,$ec,$ea,$ec,$ea,$ed,$e9,$ee,$1e,$8e,$e2,$e7,$ee,$3e,$61
frame856: .byte $48,$1e,$ae,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$be,$b7,$5c,$eb,$67,$bd,$47,$58,$bc,$66,$59,$ac,$66,$59,$ac,$66,$58,$bc,$66,$66,$be,$14,$78,$3c,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$ea,$ec,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb,$eb
frame857: .byte $4f,$1e,$3e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$f6,$bf,$7a,$e1,$4e,$7a,$d6,$e6,$ac,$dd,$ac,$dd,$ad,$7e,$4b,$e1,$4d,$c,$de,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5,$e4,$ee,$5e,$4e,$e5
frame858: .byte $43,$1c,$f4,$df,$4d,$f4,$df,$4d,$f4,$df,$4d,$f4,$df,$4d,$f4,$df,$4d,$e1,$5e,$3d,$aa,$e3,$ca,$be,$3b,$ba,$e3,$bd,$9e,$3a,$e2,$7e,$2b,$e2,$6e,$3b,$e1,$a2,$55,$c2,$65,$e6,$3d,$72,$5e,$62,$de,$2e,$52,$de,$54,$72,$4d,$f4,$df,$4d,$f4,$df,$4d,$f4,$df,$4d,$f4,$df,$4d,$f4,$df,$41
frame859: .byte $44,$19,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$e5,$1e,$6a,$e4,$2e,$6a,$e2,$5e,$5a,$e4,$5e,$3a,$e5,$4e,$3a,$e5,$2e,$5a,$e5,$5e,$2a,$e6,$4e,$2a,$71,$ad,$7a,$a3,$3e,$36,$ae,$47,$18,$5a,$e8,$17,$27,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7
frame860: .byte $42,$17,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$e3,$10,$3e,$68,$e4,$4e,$68,$e5,$4e,$58,$e6,$4e,$48,$e6,$4e,$48,$e6,$4e,$48,$e7,$4e,$38,$a3,$4e,$19,$8e,$5e,$18,$8e,$91,$45,$88,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$91
frame861: .byte $44,$19,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$ae,$50,$be,$3a,$e6,$3e,$3a,$e6,$4e,$2a,$e7,$4e,$1a,$e7,$4e,$1a,$e7,$4e,$1a,$a2,$93,$e1,$ad,$23,$71,$1b,$ae,$6d,$6a,$e9,$21,$85,$ae,$92,$54,$5a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$7a,$f7,$af,$71
frame862: .byte $43,$1b,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$ce,$61,$e3,$ce,$74,$db,$e7,$5d,$ae,$82,$e2,$ae,$82,$e2,$ae,$74,$db,$a2,$84,$db,$b3,$83,$bc,$e5,$7b,$ce,$69,$8c,$e7,$c4,$ce,$9b,$3c,$ea,$14,$62,$ce,$e4,$42,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$51
frame863: .byte $50,$1e,$2f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3e,$51,$de,$3e,$64,$9e,$3e,$64,$9e,$3e,$73,$9e,$3e,$64,$9e,$3e,$63,$ae,$38,$38,$49,$e3,$b3,$41,$7,$dc,$e2,$9d,$be,$48,$da,$e5,$d7,$ae,$7b,$7a,$e8,$14,$65,$be,$e2,$44,$ce,$e3,$15,$df,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$1e,$3f,$11
frame864: .byte $3c,$1f,$4c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$ce,$53,$e2,$ce,$37,$dc,$e2,$9c,$ce,$29,$cc,$e1,$bb,$ce,$2a,$bc,$e2,$9c,$ce,$38,$cc,$e4,$6d,$ce,$53,$e2,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$cf,$5c,$f5,$c1
frame865: .byte $31,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$51,$fc,$5f,$b9,$f8,$af,$6b,$f6,$bf,$6b,$f7,$9f,$89,$f9,$7f,$d2,$ff,$ff,$ff,$c1,$fe,$31,$fe,$13,$f5,$44,$4e,$e1,$c3,$6e,$7e,$e2,$e2,$f2,$e2,$f1,$e3,$ee,$5e,$4e,$e3,$e6
frame866: .byte $40,$bf,$6b,$f6,$bf,$6a,$f7,$9f,$88,$f9,$8f,$98,$f9,$8f,$94,$8,$f9,$40,$8f,$98,$f9,$8f,$97,$fa,$7f,$a8,$f9,$8f,$98,$e8,$2e,$49,$e6,$5e,$2a,$e4,$7e,$1c,$57,$28,$e1,$ec,$18,$e1,$f3,$e1,$f3,$e1,$f2,$e2,$ed,$14,$e4,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e9
frame867: .byte $3d,$1f,$ee,$52,$fc,$6f,$a8,$f8,$af,$6c,$f5,$df,$4d,$f3,$e1,$f3,$e1,$f3,$df,$4c,$f5,$cf,$5b,$f6,$bf,$6b,$f7,$ad,$4e,$aa,$b5,$e9,$ab,$5e,$9c,$59,$e9,$ec,$ea,$eb,$eb,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e9,$ed,$e8,$ed,$e9,$ed,$a1,$ae,$41
frame868: .byte $44,$1f,$ff,$ff,$fe,$b2,$fb,$7f,$99,$f8,$9f,$8a,$f6,$cf,$5c,$f5,$bf,$6a,$f6,$bf,$6a,$f7,$af,$88,$c2,$ee,$18,$a4,$ee,$18,$95,$ed,$96,$6e,$e1,$b1,$9e,$e1,$e6,$ee,$3e,$6e,$e3,$e6,$ee,$3e,$6e,$e3,$81,$ae,$e2,$91,$ae,$e2,$91,$ae,$e2,$91,$ae,$e2,$92,$9e,$e2,$83,$9e,$e2,$92,$8e,$21
frame869: .byte $3c,$1f,$ff,$ff,$ff,$ff,$ec,$8f,$89,$f8,$9f,$7b,$f6,$bf,$6b,$f6,$af,$6a,$f7,$9f,$89,$f9,$8f,$b6,$73,$f1,$75,$5e,$e5,$75,$5e,$e5,$83,$5f,$18,$16,$f2,$e2,$f2,$e2,$f2,$e3,$f1,$e3,$ee,$5e,$5e,$e4,$e5,$ee,$4e,$5e,$e4,$e5,$ee,$48,$19,$ee,$39,$17,$e3
frame870: .byte $33,$1f,$ff,$ff,$fe,$a3,$fd,$cf,$5c,$f4,$df,$4c,$f5,$cf,$4d,$f5,$cf,$5b,$f6,$bf,$6b,$f6,$81,$2f,$89,$f9,$72,$3f,$5d,$f4,$df,$3d,$f5,$bf,$6b,$f5,$cf,$5d,$f4,$df,$4d,$f4,$e1,$f3,$e1,$f3,$e1,$f3,$e1,$f3,$e1,$e3
frame871: .byte $2a,$f8,$9f,$89,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$98,$f9,$8f,$a7,$fa,$7f,$a7,$fa,$7f,$98,$f9,$8f,$98,$fa,$7f,$b6,$fc,$5f,$e3,$1f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$e2
frame872: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame873: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame874: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame875: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame876: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame877: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41
frame878: .byte $1a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe,$41

    .byte $ff
