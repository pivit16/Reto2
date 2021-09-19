set trace-commands on
set logging file comand2.txt
set print pretty on
set logging on
set pagination off
file fuerte
b _start

b _exit
r
c
info r r9
print (int) num
print (char) lvl
c
q