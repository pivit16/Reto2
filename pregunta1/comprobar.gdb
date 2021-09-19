set trace-commands on
set logging file comand1.txt
set print pretty on
set logging on
set pagination off
file multibucle
b _start
b sumloop
b _exit
r
c
set $cont = $rcx
while($cont >0)
    info r rax
    c 
    p $cont
    set $cont = $rcx
end
c
info r r10 r11
q