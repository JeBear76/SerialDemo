;
; Receiver.asm
;
; Created: 2018-03-04 15:54:05
; Author : Jeremie
;

.org 0x0000
rjmp reset

reset:
	ser r16
	out DDRB, r16
	ldi r17, 0x0F
	out UBRRH, r17
	out UBRRL, r16
	ldi r16, (1 << RXEN)
	out UCSRB, r16
	ldi r16, (1<<USBS) | (3<<UCSZ0)
	out UCSRC, r16
	ser r16
	out PORTB, r16

start:
	sbis UCSRA, RXC
	rjmp start
	in r16, UDR
	out PORTB, r16	
    rjmp start

