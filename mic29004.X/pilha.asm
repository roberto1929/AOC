.DEF temp1 = R16
.DEF temp2 = R17
.DEF carry = R18

.ESEG
var1: .BYTE 4
var2: .BYTE 4
resultado: .BYTE 4
 
.CSEG
.ORG 0x0000
rjmp main
 
add_32bts:
    PUSH R16
    PUSH R17
    PUSH R18
    
    clr carry
    ld temp1, X+
    ld temp2, Y+
    add temp1, temp2
    adc carry, R0
    st Z+, temp1
    
    ld temp1, X+
    ld temp2, Y+
    adc temp1, temp2
    st Z+, temp1
    
    ld temp1, X+
    ld temp2, Y+
    adc temp1, temp2
    st Z+, temp1
    
    POP R18
    POP R17
    POP R16
    
    main:
	LDI R26, low(var1)
	LDI R27, high(var1)
	
	LDI R28, low(var2)
	LDI R29, high(var2)
	
	LDI R30, low(resultado)
	LDI R31, high(resultado)
	
	LDI temp1, 0x01
	st X+, temp1
	clr temp1
	ST X+, temp1
	st X+, temp1
	st X, temp1
	
	LDI temp1, 0x02
	st Y+, temp1
	clr temp1
	ST Y+, temp1
	st Y+, temp1
	st Y, temp1
	
	RCALL add_32bts
	
	rjmp main