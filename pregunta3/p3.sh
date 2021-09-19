nasm -f elf64 -g palindromo.asm -o palindromo.o
ld palindromo.o -o palindromo
./palindromo