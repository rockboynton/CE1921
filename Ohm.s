; *************************************************************************************************
; * FILENAME: Ohm.s 
; * AUTHOR:   boIntonrl@msoe.edu <Rock BoInton>
; * DATE:     22 Mar 2018
; * PROVIDES:
; *  - prints an Ohm's law table
; *  - assumes all memorI is uninitialized
; *  - uses nested do-while loops, multiplication and print functions
; *************************************************************************************************

					.data
title: 			.asciz 		"Ohm's Law: V=IR\n"
line:				.asciz		"*********************************************\n"
header:			.asciz		"\tR\t100 Ohms\t200 Ohms\t300 Ohms\t400 Ohms\t500 Ohms\t600 Ohms\t700 Ohms\n"
ampAndTab:		.asciz		" Amp\t\t"
voltAndTab:		.asciz		" V \t\t"
newLine: 			.asciz 		"\n"
i:					.asciz		"I\n"
					.equ 		PrtStr, 0x02
					.equ 		PrtInt, 0x6b 
					.equ 		StdOut, 1
					
					.text
; r4 = R, r5 = I, r6 = V, R7 = MARR = 800, R8 = MARI = 6
main: 				mov 		r4, #100			; R = 100
					mov 		r5, #1				; I = 1
					mov 		r7, #800			; MARR = 800
					mov 		r8, #6				; MARI = 6
					ldr 		r0, =title  		; load title string in r0
					swi 		PrtStr         	; print title
					ldr 		r0, =line			; load line string in r0
					swi 		PrtStr				; print line
					ldr 		r0, =header		; load header into r0
					swi 		PrtStr				; print header 
					ldr 		r0, =i				; load i into r0
					swi			PrtStr				; print i
						
printColumn:		cmp 		r4, #100			; do... R == 100?
					bne 		mulAndIncR		; branch to firstColumn
						
firstColumn:		mov 		r0, #StdOut	
					mov 		r1, r5				; file handle set to 1
					swi 		PrtInt				; print I
					ldr 		r0, =ampAndTab	; load ampAndTab into r0
					swi 		PrtStr				; print ampAndTab
						
mulAndIncR:		mov 		r0, r5				; argument 0 = I
					mov 		r1, r4				; argument 1 = R
					bl			ohms				; call ohms function
					mov 		r1, r0				; hold V to print 
					mov 		r0, #StdOut		; file handle set to 1
					swi 		PrtInt				; print V 
					ldr 		r0, =voltAndTab	; print voltAndTab
					swi 		PrtStr	
					add 		r4, r4, #100		; R = R + 100	
					cmp 		r4,r7				; R == SIZE? 
					bne		printColumn		; while 
								
PrintRow:			ldr 		r0, =newLine		; load newLine into r0
					swi 		PrtStr				; print newLine
					mov 		r4, #100			; R = 100
					add 		r5, r5, #1			; I = I + 1
					cmp 		r5, r8				; I == SIZE?
					bne		printColumn		; 
					b			done
					
done: 				b 			done
					
ohms:				mul 		r6, r0,r1			; V = I * R
					mov 		r0, r6				; put return value (V) into R0
					mov 		pc, lr				; return to caller 