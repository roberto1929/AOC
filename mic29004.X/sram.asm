.ORG SRAM_START
    

    count: .BYTE 1


    uint: .BYTE 2
    

    var3: .BYTE 3
 
.CSEG
; Replace with your application code
start:
    
    lds r16,count
    inc r16
    sts count,r16
    rjmp start
