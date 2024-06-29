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
  ldi r16, (1 << PB4 | 0 << PB3 | 0 << PB2 | 0 << PB1) ;Posición STOP
  ldi r17, (0 << PB4 | 1 << PB3 | 0 << PB2 | 0 << PB1) ;Posición PRECAUCION
  ldi r18, (0 << PB4 | 0 << PB3 | 1 << PB2 | 0 << PB1) ;Posición AVANCE
  ldi r19, (0 << PB4 | 0 << PB3 | 0 << PB2 | 1 << PB1) ;LED Auxiliar Debugueo
  ldi r26, (0 << PB4 | 0 << PB3 | 0 << PB2 | 0 << PB1) ;LED Auxiliar Debugueo

; Habilita pull-up interno para el pulsador en PD6
  ldi r24, (1 << PD6)  ; Cargar el valor 0x04 (1 << 2) en el registro r24
  out PORTD, r24       ; Habilitar el pull-up interno en PD6

; Inicializa los puertos B (Salidas) y D (Entradas) a 0
  ldi r20, 0b00000000
  out _SFR_IO_ADDR(PORTB), r20
  out _SFR_IO_ADDR(PORTD), r20

loop:
  ldi r20, 0b00000100
  rcall check_push_button ; llama a subrutina
  out _SFR_IO_ADDR(PORTD), r20
  call sign_stop ; llama a subrutina
  call delay ; llama a subrutina
  ;-----

  ldi r25, 0b00000100
  rcall check_push_button ; llama a subrutina
  out _SFR_IO_ADDR(PORTD), r20
  call sign_caution ; llama a subrutina
  call delay ; llama a subrutina
  ;-----

  ldi r25, 0b00000100
  rcall check_push_button ; llama a subrutina
  out _SFR_IO_ADDR(PORTD), r20
  call sign_go ; llama a subrutina
  call delay ; llama a subrutina

  rjmp loop ; vuelve a lanzar subrutina

sign_stop:
  out _SFR_IO_ADDR(PORTB), r16 ; manda valor de r16 a la salida PORTB
  ret ; retorno a la parte del código que hizo la llamada

sign_caution:
  out _SFR_IO_ADDR(PORTB), r17 ; manda valor de r17 a la salida PORTB
  ret ; retorno a la parte del código que hizo la llamada

sign_go:
  out _SFR_IO_ADDR(PORTB), r18 ; manda valor de r17 a la salida PORTB
  ret ; retorno a la parte del código que hizo la llamada

turn_on_white_light_debug:
  out _SFR_IO_ADDR(PORTB), r19
  ret

turn_off_all:
  out _SFR_IO_ADDR(PORTB), r26
  ret

check_push_button:
  nop ; no hace nada y permite estabilizar le voltaje.
  in r25, _SFR_IO_ADDR(PIND) ; lee estado del pulsador
  sbrs r25, PD6
  rjmp reset_push_button
  ret

;fase_intermedia:
;   rjmp reset_push_button

reset_push_button:
  nop
  call turn_on_white_light_debug
  call delay;
  call turn_off_all
  call delay;
  ldi r20, 0b00001000
  out _SFR_IO_ADDR(PORTD), r20
  rcall check_push_button
  
  ; Vuelve al bucle normal.; continua
  call delay;
  rjmp loop


; para poder verlo hay que poner un delay
; mirar CALCULADORA de retardos para AVR en los apuntes
; http://darcy.rsgc.on.ca/ACES/TEI4M/AVRdelay.html

; Assembly code auto-generated
; by utility from Bret Mulvey
; Delay 8 000 000 cycles
; 1s at 8.0 MHz

delay: ; usados 21, 22, 23
;    ldi  r21, 122
;    ldi  r22, 193
;    ldi  r23, 130
;L1: dec  r23
;    brne L1
;    dec  r22
;    brne L1
;    dec  r21
;    brne L1
;    ret ; añadido para que vuelva return

    ldi  r21, 203
    ldi  r22, 236
    ldi  r23, 133
L1: dec  r23
    brne L1
    dec  r22
    brne L1
    dec  r21
    brne L1
    nop
    ret

