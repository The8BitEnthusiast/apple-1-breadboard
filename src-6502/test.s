.SEGMENT "TEST"
.org $E000

; links to functions

PRBYTE      = $FFDC
; FULLCYCLE   = $C1BC
; CMPLEVEL    = $C1BF
ECHO        = $FFEF
TAPEIN      = $C081
LASTSTATE   = $29
LASTVALUE   = $30

loop:
    JSR FULLCYCLE
    LDY #31
    JSR CMPLEVEL
    TYA
    JSR PRBYTE
    LDA #' '+$80
    JSR ECHO
    JMP loop

FULLCYCLE: JSR CMPLEVEL         ; Wait for two level changes
CMPLEVEL: DEY                   ; Decrement time counter
        DEY
        LDA TAPEIN              ; Get Tape In data
        CMP TAPEIN
        BNE CMPLEVEL
; loop2:  STA LASTVALUE
        ; LDA TAPEIN
;         CMP LASTVALUE
;         BNE loop2
        CMP LASTSTATE           ; Same as before?
        BEQ CMPLEVEL            ; Yes!
        STA LASTSTATE           ; Save new data

        CPY #128                ; Compare threshold
        RTS


