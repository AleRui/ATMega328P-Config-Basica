# ATMega328-Config-Basica

Basic install in VSCode Ubuntu 22:

Libraries:
```bash
sudo apt install python3.6-venv beforehand
```

Check Python version library
```bash
python3.6 -v
```

config links
```bash
sudo ln -s ~/.platformio/penv/bin/platformio /usr/local/bin/platformio
sudo ln -s ~/.platformio/penv/bin/pio /usr/local/bin/pio
sudo ln -s ~/.platformio/penv/bin/piodebuggdb /usr/local/bin/piodebuggdb
```

- Createing new project with platfomio tool VS CODE

- Delete files in src/ folder.

- Adding file for config: `atmega328.svd`

- config file: ``platformio.ini
```
[env:uno]
platform = atmelavr
board = uno

; No framework means PIO will use just gcc and the standard C library.
;framework = arduino

; Use the simulator for debugging
debug_tool = simavr

; Use this file for peripheral definitions, that will be shown by the debugger.
debug_svd_path = atmega328p.svd
```

- Arduino ATMega328p Cheat Sheet [Cheat Sheet] (https://cheatography.com/claudiunv/cheat-sheets/arduino-uno-to-avr-gcc-migration/)


- Dalay calculator [Dalay calculator](http://darcy.rsgc.on.ca/ACES/TEI4M/AVRdelay.html)

- TEST:

Test Wokwi [Wokwi](https://wokwi.com/projects/400687879499681793)

PLAY! ENJOY IT!

![](https://github.com/AleRui/ATMega328P-Config-Basica/blob/main/imas/Captura%20desde%202024-06-14%2018-04-34.png){width='100px'}

- Compila ccode in VSCode
![](https://github.com/AleRui/ATMega328P-Config-Basica/blob/main/imas/Captura%20desde%202024-06-14%2018-57-25.png){width='100px'}

- Port Mapping
![](https://github.com/AleRui/ATMega328P-Config-Basica/blob/main/imas/Captura%20desde%202024-06-14%2019-10-45.png){width='100px'}

![](https://github.com/AleRui/ATMega328P-Config-Basica/blob/main/imas/Captura%20desde%202024-06-14%2018-20-41.png){width='100px'}

![](https://github.com/AleRui/ATMega328P-Config-Basica/blob/main/imas/Captura%20desde%202024-06-14%2018-49-37.png){width='100px'}

![](https://github.com/AleRui/ATMega328P-Config-Basica/blob/main/imas/Captura%20desde%202024-06-14%2018-54-49.png){width='100px'}


Stop red led with push button

![](https://github.com/AleRui/ATMega328P-Config-Basica/blob/main/imas/Captura%20desde%202024-06-22%2021-23-27.png){width='100px'}

Stop red led with push button. Conf V2

![](https://github.com/AleRui/ATMega328P-Config-Basica/blob/main/imas/Captura%20desde%202024-06-29%2013-55-43.png){width='100px'}

## Video ATMega328p.  Actividad 1: Semaforo

* https://youtu.be/3i9TWQG4xeg?feature=shared

## Video ATMega328p. Actividad extra: interrumptor de led

* https://youtu.be/JXgJ8hjdt0w?feature=shared

## Video ATMega328p. Actividad extra: interrumptor de led Conf V2

* https://youtu.be/PEmJOxcYEw0?feature=shared