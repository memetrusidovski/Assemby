/*
-------------------------------------------------------
write_string.s
Writes a string to the UART
-------------------------------------------------------
Author:  David Brown
ID:      999999999
Email:   dbrown@wlu.ca
Date:    2020-11-03
-------------------------------------------------------
*/
// Constants            
.equ UART_BASE, 0xff201000     // UART base address
.org    0x1000    // Start at memory location 1000
.text  // Code Section
.global _start
_start:
// print a text string to the UART
LDR  R1, =UART_BASE
LDR  R4, =TEXT_STRING
        
LOOP:
LDRB R0, [R4]    // load a single byte from the string
CMP  R0, #0
BEQ  _stop       // stop when the null character is found
STR  R0, [R1]    // copy the character to the UART DATA field
ADD  R4, R4, #1  // move to next character in memory
B LOOP

_stop:
B    _stop

.data  // Data Section
// Define a null-terminated string
TEXT_STRING:
.asciz    "This is a text string"

.end