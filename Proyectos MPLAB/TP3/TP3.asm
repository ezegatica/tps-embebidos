#INCLUDE <P16F84A.INC>
SETUP
    BSF STATUS, RP0
    MOVLW 0x00
    MOVWF TRISA
    MOVLW 0x02
    MOVWF TRISB
	BCF OPTION_REG, NOT_RBPU
    BCF STATUS, RP0

LOOP
    BCF PORTA, RA0
	BTFSS PORTB, RB1
    GOTO PRENDER
	GOTO LOOP

PRENDER
	BSF PORTA, RA0
	BTFSS PORTB, RB1
	GOTO PRENDER
	GOTO LOOP

END