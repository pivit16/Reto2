nasm -f elf64 -g multibucle.asm -o multibucle.o
ld multibucle.o -o multibucle
./multibucle