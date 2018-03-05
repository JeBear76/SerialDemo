;
; Sender.asm
;
; Created: 2018-03-04 15:53:42
; Author : Jeremie
;
.org 0x0000
rjmp reset

reset:
	clr r16
	out DDRD, r16		;port D is input
	ldi r16, 0x10
	out PORTD, r16		;port D set to on
	ser r16
	ldi r17, 0x0F
	out UBRRH, r17		;set BAUD rate
	out UBRRL, r16		;set BAUD rate
	ldi r16, (1<<TXEN)
	out UCSRB, r16
	ldi r16, (1<<USBS) | (3<<UCSZ0)
	out UCSRC, r16
	clr r17

start:
    sbic PIND, 4
	rjmp start
wait:
	sbis UCSRA, UDRE
	rjmp wait
	sbis PIND, 4
	rjmp wait
	inc r17
	out UDR, r17
    rjmp start
