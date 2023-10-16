.data
prompt:     .asciiz "Ingresa un número: "
result:     .asciiz "El resultado es: "

.text
.globl main

main:
    # Inicialización de registros y variables
    li $t0, 0  # Inicializa el contador en $t0
    li $t1, 0  # Inicializa el acumulador en $t1

input_loop:
    # Imprime el mensaje para ingresar un número
    li $v0, 4
    la $a0, prompt
    syscall

    # Lee un número entero desde la entrada estándar
    li $v0, 5
    syscall

    # Suma el número ingresado al acumulador
    add $t1, $t1, $v0

    # Incrementa el contador
    addi $t0, $t0, 1

    # Comprueba si se han ingresado 5 números
    bne $t0, 5, input_loop

    # Muestra el resultado
    li $v0, 4
    la $a0, result
    syscall

    # Muestra el resultado calculado
    move $a0, $t1
    li $v0, 1
    syscall

    # Termina el programa
    li $v0, 10
    syscall
