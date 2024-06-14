; Comentario con punto y coma ;

; Preogram: Blink. Led de la placa parpadea
; Author: Ale Ruiz
; Created: 2024-06-11

; necesario incluir libreia C++
#include <avr/io.h>

;Vector de interrumpción, "reste"
.org 0 ; empieza en la posición 0 de la memoria del programa.

; salta a la etiqueta setup
rjmp setup ; salto relativo. consume menos ciclos de reloj y memoria

; etiqueta setup
setup:

; necesario para compilar
.global main
main:

  ; INICIALIZA codigo
  ;ldi r16, 0b00100000 ; manda 1 bit al puerto 5
  ldi r16, 0xFF ; inicializa variable a 1, manda 1 bit a todos los puertos
  ;out DDRB, r16 ; le paso el valor a DDRB
                ; esto le indica que los puertos son de salida
  out _SFR_IO_ADDR(DDRB), r16 ; Libreria de dependencia, apunta a dirección de memoria directamente.
  ldi r17, 0x00 ; inicializa variable a O
  out _SFR_IO_ADDR(PORTB), r17; inicializa el puerto b a 0 (que es la variable r17)

loop:
  out _SFR_IO_ADDR(PORTB), r16 ; enciende el led, porque son todos 1
  call delay
  out _SFR_IO_ADDR(PORTB), r17 ; apaga el puerto, porque los pone a 0
  call delay
  rjmp loop ; salta de nuevo al loop, esto es lo que crea el bucle

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