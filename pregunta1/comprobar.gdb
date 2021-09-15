set trace-commands on
set logging file comand1.txt
set print pretty on
set logging on
set pagination off
file multibucle
b _start
b _exit
r
c
i r r10 r11
n
q