ORG 0000H
; Setting the 3 LEDs to 1
MOV P0,#07H
; Setting the 3 counters for the 3 LEDs to 0
MOV R5, # 00H
MOV R6, # 00H
MOV R7, # 00H
; Main Function
MAINLOOP:
ACALL DELAY50MS ; Calling 50ms delay
; Increasing the registers by 1
INC R5
INC R6
INC R7
;
CJNE R5,#0AH, NEXT ; Jump to next if R5 is not equal to 10
CPL P0.0; Complementing bit P0.0
MOV R5,#00H; Resetting counter to 0
NEXT:
CJNE R6,#14H, NEXT1 ; Jump to next if R6 is not equal to 20
CPL P0.1; Complementing bit P0.1
MOV R6,#00H; Resetting counter to 0
NEXT1:
CJNE R7,#1AH, NEXT2 ; Jump to next if R7 is not equal to 26
CPL P0.2; Complementing bit P0.2
MOV R7,#00H; Resetting counter to 0
NEXT2:
SJMP MAINLOOP
; User defined function for 50ms
DELAY50MS:
; Setting Timer 0 to Mode 1
MOV TMOD, #01H
; Lower and Upper counts
MOV TH0, #3CH
MOV TL0, #0B0H
; Initializing/ Starting the timer
SETB TCON.4
; Waiting for timer to raise flag bit
LOOP: JNB TCON.5, LOOP
; Stopping the timer
CLR TCON.4
; Clearing the flag bit
CLR TCON.5
RET
END