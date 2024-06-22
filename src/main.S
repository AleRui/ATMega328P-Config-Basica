; Comentario con punto y coma ;

; Preogram: Blink. Led de la placa parpadea
; Author: Ale Ruiz
; Created: 2024-06-11

#include <avr/io.h> ; necesario incluir libreia C++
;.include "m328Pdef.inc"

;Vector de interrumpción, "reste"
.org 0 ; empieza en la posición 0 de la memoria del programa.

; salta a la etiqueta setup
rjmp setup ; salto relativo. consume menos ciclos de reloj y memoria

; etiqueta setup
setup:

; necesario para compilar
.global main

main:
  ; realizamos el "seteo" de las salidas y la entrada
  ldi r16, (1 << PB4) ;carga directa en r16 el valor 1 para el pueto PB4
  ldi r17, (0 << PB4) ;carga directa en r16 el valor 0 para el pueto PB4


; Habilita pull-up interno para el pulsador en PD6
  ldi r25, (1 << PD6) ;
  out _SFR_IO_ADDR(PORTD), r25

; Inicializa los puertos B y D a 0
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTB), r18
  out _SFR_IO_ADDR(PORTD), r18

loop:
  call turn_on_red_led ; llama a subrutina
  ;call delay ; llama a subrutina
  call check_push_button ; llama a subrutina
  ;call delay ; llama a subrutina
  rjmp loop ; vuelve a lanzar subrutina

turn_on_red_led:
  out _SFR_IO_ADDR(PORTB), r16 ; manda valor de r16 a la salida PORTB
  ret ; retorno a la parte del código que hizo la llamada

turn_off_red_led:
  out _SFR_IO_ADDR(PORTB), r17 ; manda valor de r17 a la salida PORTB
  ret ; retorno a la parte del código que hizo la llamada

check_push_button:
  in r25, _SFR_IO_ADDR(PIND) ; lee a entrada
  sbrs r25, PD6 
  rjmp reset_push_button
  ret

reset_push_button:
  out _SFR_IO_ADDR(PORTD), r18 ; salta si el registro en el bit es 1
  call turn_off_red_led
  call delay;
  ret


; para poder verlo hay que poner un delay
; mirar CALCULADORA de retardos para AVR en los apuntes
; http://darcy.rsgc.on.ca/ACES/TEI4M/AVRdelay.html

; Assembly code auto-generated
; by utility from Bret Mulvey
; Delay 8 000 000 cycles
; 1s at 8.0 MHz

delay: ; usados 21, 22, 23
    ldi  r21, 122
    ldi  r22, 193
    ldi  r23, 130
L1: dec  r23
    brne L1
    dec  r22
    brne L1
    dec  r21
    brne L1
    ret ; añadido para que vuelva return
