; Comentario con punto y coma ;

; Preogram: Semaforo
; Author: Ale Ruiz
; Created: 2024-06-11

#include <avr/io.h> ; necesario incluir libreia C++

;Vector de interrumpción, "reste"
.org 0 ; empieza en la posición 0 de la memoria del programa.

; salta a la etiqueta setup
rjmp setup ; salto relativo. consume menos ciclos de reloj y memoria

; etiqueta setup
setup:

; necesario para compilar
.global main
main:
  ldi r16, (1 << PB0 | 0 << PB1 | 0 << PB2 | 0 << PD6 | 1 << PD7) ;verde semaforo : rojo peatón
  ldi r17, (0 << PB0 | 1 << PB1 | 0 << PB2 | 0 << PD6 | 1 << PD7) ;amarillo semaforo : verde peatón
  ldi r18, (0 << PB0 | 0 << PB1 | 1 << PB2 | 0 << PD6 | 1 << PD7) ;rojo semaforo : verde peatón
  out _SFR_IO_ADDR(DDRB), r16 ;

loop:
  out _SFR_IO_ADDR(PORTB), r16
  call delay
  out _SFR_IO_ADDR(PORTB), r17
  call delay
  out _SFR_IO_ADDR(PORTB), r18
  call delay
  rjmp loop


; para poder verlo hay que poner un delay
; mirar CALCULADORA de retardos para AVR en los apuntes
; http://darcy.rsgc.on.ca/ACES/TEI4M/AVRdelay.html

; Assembly code auto-generated
; by utility from Bret Mulvey
; Delay 8 000 000 cycles
; 1s at 8.0 MHz

delay:
    ldi  r20, 41
    ldi  r21, 150
    ldi  r22, 128
L1: dec  r22
    brne L1
    dec  r21
    brne L1
    dec  r20
    brne L1
    ret ; añadido para que vuelva return