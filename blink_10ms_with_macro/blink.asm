.device ATmega32

.equ PORTB = 0x05 
.equ DDRB  = 0x04

 .macro delay_10ms 
    ldi  r20, @0
    ldi  r21, 208
    ldi  r22, 202
L1: dec  r22
    brne L1
	dec  r21
    brne L1
    dec  r20
    brne L1

 .endmacro

.org 0x0000
    jmp main
.org 0x0060

main:
		LDI             R16, (1<<5)
		LDI             R17, (1<<5)
		OUT             DDRB, R16
LOOP: 
		OUT             PORTB, R16
		delay_10ms      10
		EOR             R16, R17
		RJMP            LOOP



;Below is non active code because is commented
;it's just for inspiration

;if put r24 0 all led off , if put 255 all led on

;ldi r24, 0
;out ddrb,r24
;out portb,r24
;loop:
;rjmp loop


; blink


;		LDI             R16, (1<<5)
;		LDI             R17, (1<<5)
;		OUT             0x3A, R16
;LOOP: 
;		OUT             0x3B, R16
;		RCALL           DELAY_1S
;		EOR             R16, R17
;		RJMP            LOOP
;DELAY_1S:
;		LDI             R20, 64
;DELAY1:	LDI             R21, 250
;DELAY2:	LDI             R22, 250
;DELAY3:	DEC             R22
;		NOP
;		BRNE            DELAY3
;		DEC             r21
;		BRNE            DELAY2
;		DEC             r20
;		BRNE            DELAY1
;		RET