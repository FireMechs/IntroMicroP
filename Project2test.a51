 LED1		BIT		P0.0
LED2		BIT		P0.1
LED3		BIT		P0.2
BUTTON		BIT		P3.2
 org   0100h
 ORG 13H
 JMP BLINKING
 RETI
   
Start:
     SETB EX1
     SETB EA
     jmp Start
 
  BLINKING:
    
    SETB LED1
    SETB LED2
    SETB LED3
    
    MOV R1, #50D
    MOV R2, #100D
    MOV R3, #130D
RPT:    ACALL DELAY
 
SWITCH1:
        DJNZ R1, SWITCH2
        CPL LED1
        MOV R1, #50D
SWITCH2:
        DJNZ R2, SWITCH3
        CPL LED2
        MOV R2, #100D
SWITCH3:
        DJNZ R3, RPT
        CPL LED3
        MOV R3, #130D 
 
      SJMP RPT 
   
DELAY:	
      MOV TMOD, #01H
      MOV TH0, #0DBH
      MOV TL0, #0FFH
      SETB TCON.4
    L1: JNB TCON.5, L1
       CLR TCON.4
       CLR TCON.5
       RET
        
;====================================================================
      END
