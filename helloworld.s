.org    0x1000  // Start at memory location 1000
.text  // Code section
.global _start
_start:

MOV R0, 9       // Store decimal 9 in register R0
MOV R1, 0xE     // Store hex E (decimal 14) in register R1
ADD R2, R1, R0  // Add the contents of R0 and R1 and put result in R2

// End program
_stop:
B   _stop
