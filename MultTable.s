; *************************************************************************************************
; * FILENAME: MultTable.s 
; * AUTHOR:   boyntonrl@msoe.edu <Rock Boynton>
; * DATE:     21 Mar 2018
; * PROVIDES:
; *  - prints a multiplication table 
; *  - assumes all memory is uninitialized
; *  - uses nested do-while loops, multiplication and print functions
; *************************************************************************************************

					.data
title: 			.asciz "MULTIPLICATION TABLE\n"
line:				.asciz "---------------------------------------------\n"
header:			.asciz "\t1\t2\t3\t4\t5\t\n"
tab:				.asciz "\t"
newLine: 			.asciz "\n"
					.equ PrtStr, 0x02
					.equ PrtInt, 0x6b 
					.equ StdOut, 1
					
					.text
; R2 = x, R3 = y, R4 = SIZE = 6,
main: 				mov R2, #1			; x = 1
					mov R3, #1			; y = 1
					mov R4, #6			; SIZE = 6
					ldr R0, =title  	; load title string in R0
					swi PrtStr         ; print title
					ldr R0, =line		; load line string in R0
					swi PrtStr			; print line
					ldr R0, =header	; load header into R0
					swi PrtStr			; print header 
printColumn:		cmp R2, #1			; do... x == 1?
					bne mulAndIncX	; branch to firstColumn
firstColumn:		mov r0, #StdOut
					mov r1, r3			; file handle set to 1
					swi PrtInt			; print y
					ldr r0, =tab		; print tab
					swi PrtStr
mulAndIncX:		mul R5, R2, R3		; sum = x * y
					mov R1, R5			; hold sum to print 
					mov R0, #StdOut	; file handle set to 1
					swi PrtInt			; print sum 
					ldr R0, =tab		; print tab
					swi PrtStr
					add R2, R2, #1		; x = x + 1	
					cmp R2,R4			; x == size? 
					bne printColumn	; while 
PrintRow:			ldr R0, =newLine	; load newLine into R0
					swi PrtStr			; print newLine
					mov R2, #1			; x = 1
					add R3, R3, #1		; y = y + 1
					cmp R3, R4			; y == 6?
					blt printColumn	; 