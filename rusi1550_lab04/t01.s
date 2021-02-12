/*
-------------------------------------------------------
read_string.s
Reads a string from the UART
-------------------------------------------------------
Author:  David Brown
ID:      999999999
Email:   dbrown@wlu.ca
Date:    2020-11-03
-------------------------------------------------------
*/
// Constants            
.equ UART_BASE, 0xff201000     // UART base address
.equ SIZE, 80        // Size of string buffer storage (bytes)
.equ VALID, 0x8000   // Valid data in UART mask
.equ ENTER, 0x0a 	 //Enter key

.org    0x1000       // Start at memory location 1000
.text  // Code section
.global _start
_start:

// read a string from the UART
LDR  R1, =UART_BASE
LDR  R4, =READ_STRING
ADD  R5, R4, #SIZE // store address of end of buffer
        
LOOP:
LDR  R0, [R1]  // read the UART data register
CMP R0, #ENTER
BEQ _stop
TST  R0, #VALID    // check if there is new data
BEQ  _stop         // if no data, return 0

STR  R0, [R1]    // copy the character to the UART DATA field

//ADD  R4, R4, #1    // move to next byte in storage buffer
//CMP  R4, R5        // end program if buffer full
//BEQ  _stop
B    LOOP

_stop:
B    _stop

.data  // Data section
// Set aside storage for a string
READ_STRING:
.space    SIZE

.end