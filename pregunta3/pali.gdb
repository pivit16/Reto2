set trace-commands on
set logging file comand3.txt
set print pretty on
set logging on
set pagination off
file palindromo
b _start
b _exit
r
c
print (char) lvl
info r r9
c
q