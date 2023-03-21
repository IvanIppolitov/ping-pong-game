.model small
.486
    delay macro time
        local ext, iter
        push cx
        mov cx, time
    ext:
        push cx
        mov cx, 5000
    iter:
        loop iter
        pop cx
        loop ext
        pop cx
    endm
.stack 100h
.data
    int_num equ 9h
    oldInt dw 0, 0
    key db 0AAh
    
    MX equ 320
    MY equ 200
    SZ equ (MX * MY)
    buffer equ 0A000h

    TW equ 15
    LW equ 5
    RW equ 5

    ball byte  0,   0,  0Fh, 0Fh, 0Fh, 0Fh,  0,   0
         byte  0,  0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh,  0
         byte 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh
         byte 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh
         byte 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh
         byte 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh
         byte  0,  0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh,  0
         byte  0,   0,  0Fh, 0Fh, 0Fh, 0Fh,  0,   0

    SW equ 8
    SH equ 8 
    SX dw 100
    SY dw 100
    X dw -1
    Y dw 1

    PW equ 25
    PH equ 4
    PX dw (MX+PW)/2

    score db 0, 0, 0, 0 ;BCD number
    len equ 4

    digit0 byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,   0,  0Fh,  0

    digit1 byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0Fh,  0
           byte 0,   0,  0Fh,  0
           byte 0,   0,  0Fh,  0
           byte 0,   0,  0Fh,  0
           byte 0,   0,  0Fh,  0
           byte 0,   0,  0Fh,  0
           byte 0,   0,  0Fh,  0
           byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0Fh, 0Fh

    digit2 byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,   0,   0,  0Fh
           byte 0,   0,   0,  0Fh
           byte 0,   0,   0,  0Fh
           byte 0,   0,  0Fh,  0
           byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0,    0
           byte 0,  0Fh, 0Fh, 0Fh

    digit3 byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,   0,   0,  0Fh
           byte 0,   0,   0,  0Fh
           byte 0,   0,  0Fh,  0
           byte 0,   0,   0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,   0,  0Fh,  0

    digit4 byte 0,   0,   0,   0
           byte 0,   0,   0,  0Fh
           byte 0,   0,  0Fh, 0Fh
           byte 0,   0,  0Fh, 0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,   0,   0,  0Fh
           byte 0,   0,   0,  0Fh
           byte 0,   0,   0,  0Fh

    digit5 byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh,  0,   0
           byte 0,  0Fh, 0Fh,  0
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,   0,   0,  0Fh
           byte 0,   0,   0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,   0,  0Fh,  0

    digit6 byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,   0
           byte 0,  0Fh, 0Fh,  0
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,   0,  0Fh,  0

    digit7 byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,   0,   0,  0Fh
           byte 0,   0,   0,  0Fh
           byte 0,   0,  0Fh, 0Fh
           byte 0,   0,  0Fh,  0
           byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0Fh,  0
           byte 0,  0Fh,  0,   0
           byte 0,  0Fh,  0,   0

    digit8 byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,   0,  0Fh,  0

    digit9 byte 0,   0,  0Fh,  0
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,   0,  0Fh, 0Fh
           byte 0,   0,   0,  0Fh
           byte 0,  0Fh,  0,  0Fh
           byte 0,  0Fh, 0Fh, 0Fh
           byte 0,   0,  0Fh,  0

    DGW equ 4
    DGH equ 10
.code
main:
    mov ax, @data
    mov ds, ax
    mov ax, 0
    mov es, ax

    ;Save the old interrupt adress
    mov ax, word ptr es:[int_num*4]
    mov oldInt, ax
    mov ax, word ptr es:[int_num*4+2]
    mov oldInt+2, ax

    ;Set a new interrupt adress
    cli
    mov word ptr es:[int_num*4], handler
    mov word ptr es:[int_num*4+2], cs
    sti

    mov ax, buffer
    mov es, ax

    mov ax, 13h
    int 10h

    ;Draw the left wall
    mov di, MX*TW
    mov bx, MY-TW
    mov al, 0Fh
    @row1:
        mov cx, LW
        rep stosb
        add di, MX-LW
        dec bx
        cmp bx, 0
        jne @row1

    ;Draw the right wall
    mov di, (MX-RW)+MX*TW
    mov bx, MY-TW
    mov al, 0Fh
    @row2:
        mov cx, RW
        rep stosb
        add di, MX-RW
        dec bx
        cmp bx, 0
        jne @row2

    ;Draw the top wall
    xor di, di
    mov bx, TW
    @row3:
        mov cx, MX
        rep stosb
        dec bx
        cmp bx, 0
        jne @row3

    call displayScore

    draw:
        delay 20

        mov ax, SY
        shl ax, 6
        mov di, 5
        mul di
        add ax, SX
        mov di, ax

        mov bx, SH
        xor al, al
        @row4:
            mov cx, SW
            rep stosb
            sub di, SW
            add di, MX
            dec bx
            cmp bx, 0
            jne @row4

        ;Check a bounce of the ball
        bounce_left:
            cmp SX, LW
            jne bounce_right
            not X
            inc X
        bounce_right:
            mov ax, SX
            add ax, SW
            cmp ax, MX-RW
            jne bounce_bottom
            not X
            inc X
        bounce_bottom:
            mov ax, SY
            add ax, SH
            cmp ax, MY
            jne bounce_platform
            mov SX, (MX+SW)/2
            mov SY, (MY+SH)/2

            ;Reset score
            mov word ptr score, 0
            mov word ptr score+2, 0
            call displayScore

            jmp draw_ball
        bounce_platform:
            mov ax, SY
            add ax, SH
            cmp ax, MY-PH
            jne bounce_top
            mov ax, SX
            sub ax, PX
            add ax, SW
            test ax, 10000000b
            jnz bounce_top
            mov ax, PX
            add ax, PW
            sub ax, SX
            test ax, 10000000b
            jnz bounce_top
            not Y
            inc Y

            ;Increase score
            xor bx, bx
            mov cx, len

            mov al, [score]
            inc al
            @loop:
                aaa
                mov [score+bx], al
                inc bx
                mov al, [score+bx]
                adc al, 0
                mov [score+bx], al
                loop @loop

            ;Display the score
            call displayScore
        bounce_top:
            cmp SY, TW
            jne nobounce
            not Y
            inc Y
        nobounce:
            mov ax, X
            add SX, ax
            mov ax, Y
            add SY, ax

        draw_ball:
        mov ax, word ptr SY
        shl ax, 6
        mov di, 5
        mul di
        add ax, word ptr SX
        mov di, ax

        mov bx, SH
        mov si, 0
        @row5:
            mov cx, SW
            @column1:
                mov al, [ball+si]
                stosb
                inc si
                loop @column1
            sub di, SW
            add di, MX
            dec bx
            cmp bx, 0
            jne @row5

        ;Clear platform
        mov di, MX*(MY-PH)
        add di, PX
        mov bx, PH
        mov al, 0
        @row6:
            mov cx, PW
            rep stosb
            add di, MX-PW
            dec bx
            cmp bx, 0
            jne @row6

        ;Check keys
        mov dx, 3BCh
        mov al, key
        out dx, al
        cmp al, 1
        je exit
        cmp al, 4Bh
        jne a2
        cmp PX, LW
        je draw_platform
        dec PX
        jmp draw_platform
        a2:
        cmp al, 4Dh
        jne draw_platform
        cmp PX, MX-PW-RW
        je draw_platform
        inc PX

        
        ;Draw platform
        draw_platform:
        mov di, MX*(MY-PH)
        add di, PX
        mov bx, PH
        mov al, 0Fh
        @row7:
            mov cx, PW
            rep stosb
            add di, MX-PW
            dec bx
            cmp bx, 0
            jne @row7
        jmp draw

    jmp exit

    ;New interrupt
    handler:
        in al, 60h
        test al, 10000000b
        jnz @a3
        mov key, al
        @a3:
        in al, 61h
        or al, 10000000b
        out 61h, al
        nop
        and al, 01111111b
        out 61h, al

        ;Send End Of Interrupt (EOI) to 8259
        mov al, 00100000b
        out 20h, al

        iret

    exit:
        mov ax, 3h
        int 10h

        mov ax, 0
        mov es, ax

        ;Restore the original interrupt
        cli
        mov ax, word ptr oldInt
        mov word ptr es:[int_num*4], ax
        mov ax, word ptr oldInt+2
        mov word ptr es:[int_num*4+2], ax
        sti

        mov ax, 4c00h
        int 21h

    displayScore proc
        mov bp, len
        xor bx, bx
        mov di, MX*2+MX/2-DGW*2
        draw_digit:
            mov al, ds:[score+bp-1]
            mov cl, DGH*DGW
            mul cl
            mov bx, ax

            mov dx, DGH
            xor si, si
            @@row:
                mov cx, DGW
                @@column:
                    mov al, [digit0+bx+si]
                    cmp al, 0Fh
                    jne @a1
                    mov al, 0
                    jmp @ps
                    @a1:
                    mov al, 0Fh
                    @ps:
                    stosb
                    inc si
                    loop @@column    
                sub di, DGW
                add di, MX
                dec dx
                cmp dx, 0
                jne @@row
            add di, DGW-MX*DGH
            dec bp
            cmp bp, 0
            jne draw_digit
        ret
    displayScore endp
end main
