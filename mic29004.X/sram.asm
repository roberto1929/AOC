
    .DSEG
    .ORG SRAM_START
    
    var1: .BYTE 1

    var2: .BYTE 1
    
    var3: .BYTE 1
 
.CSEG
; Replace with your application code
start:
    ;primeiro programa
    ;lds r0,var1
    ;lds r1, var2
    ;add r0, r1
    ;sts var3, r0
    
    ;programa 2
    LDS R0, var1
    LDS R1, var1+1
    
    LDS R2, var2
    LDS R3, var2+1
    
    add R0, R2
    adc R1, R3
    
    sts var3, R0
    sts var3+1, R1
    
    rjmp start
