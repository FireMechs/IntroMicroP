ORG 000H
BACK:	
	MOV A, #0FFH ; store FFH(Logic 1) in the accumulator
	MOV P0,A   ; send the accumulator data to port 0
	ACALL DELAY ; call dalay subroutine to give a delay of 1s 
	MOV A, #000H ; store OOH(Logic 0) in the accumulator
	MOV P0, A  ;send the accumulator data to port 0
	ACALL DELAY ; call delay
	SJMP BACK ;return to BACK
DELAY: 
	MOV R7,#130D ; execute the program 100 times
	BACK1: 
		MOV TMOD,#01H ; initialize timer mode to 1
		MOV TH0,#0DBH ; store count 10ms 
		MOV TL0,#0FFH 
		SETB TCON.4    ; start timer
		L1: JNB TCON.5,L1 ; continously check the flag bit using JNB
		CLR TCON.4 ; stop timer 
		CLR TCON.5 ; clear flag bit
		DJNZ R7,BACK1 ; loop for 100
RET ; return to main
END