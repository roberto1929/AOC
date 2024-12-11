.DSEG   
    A1: .BYTE   12           
    A2: .BYTE   12            
    A3: .BYTE   12            
    A4: .BYTE   3             

.CSEG
     
start:
    
    LDI YH, HIGH(A2)
    LDI YL, LOW(A2) 
    LDI ZH, HIGH(A3)
    LDI ZL, LOW(A3)
    
    LDI R16, 1
    
    init_A2_A3:
	ST Y+, R16
	ST Z+, R16
	INC R16
	cpi R16, 13
	BRNE init_A2_A3
    
	LDI YH, HIGH(A2)
	LDI YL, LOW(A2) 
	LDI ZH, HIGH(A3+12)
	LDI ZL, LOW(A3+12)
	
	LDI XH, HIGH(A1)
	LDI XL, LOW(A1) 
	
	LDI R16, 1
	
    sum_seq:
	LD R17, Y+
	LD R18, -Z
	ADD R17, R18
	ST X+, R17
	
	inc R16
	CPI R16, 13]
	BRNE sum_seq
	
	LDI YH, HIGH(A2)
	LDI YL, LOW(A2) 
	LDI ZH, HIGH(A3+12)
	LDI ZL, LOW(A3+12)
	
	LDI XH, HIGH(A1)
	LDI XL, LOW(A1) 
	
    sum_ale:
	  LDD R17, Y+2
	  LDD R18, Z+5
	  ADD R17, R18
	  ST X+, R17
	  
	  LDD R17, Y+3
	  LDD R18, Z+4
	  ADD R17, R18
	  ST X+, R17
	  
	  LDD R17, Y+8
	  LDD R18, Z+9
	  ADD R17, R18
	  ST X+, R17
	    
rjmp start