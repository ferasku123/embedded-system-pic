
_main:

;keypad3.c,25 :: 		void main() {
;keypad3.c,26 :: 		trisb.b1   = 0;
	BCF        TRISB+0, 1
;keypad3.c,27 :: 		portb.b1 = 0;
	BCF        PORTB+0, 1
;keypad3.c,30 :: 		Keypad_Init();                           // Initialize Keypad
	CALL       _Keypad_Init+0
;keypad3.c,32 :: 		Lcd_Init();                              // Initialize LCD
	CALL       _Lcd_Init+0
;keypad3.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;keypad3.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;keypad3.c,35 :: 		Lcd_Out(1, 1, "Key:");                 // Write message text on LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_keypad3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;keypad3.c,38 :: 		do {
L_main0:
;keypad3.c,39 :: 		kp = 0;
	CLRF       _kp+0
;keypad3.c,40 :: 		c1 = 1;                            // Reset key code variable
	MOVLW      1
	MOVWF      _c1+0
;keypad3.c,41 :: 		for(index=0;index<=4;index++)
	CLRF       _index+0
L_main3:
	MOVF       _index+0, 0
	SUBLW      4
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;keypad3.c,44 :: 		do {
L_main6:
;keypad3.c,46 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;keypad3.c,47 :: 		}while (!kp); // stay if the button not clicked
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;keypad3.c,49 :: 		switch (kp) {
	GOTO       L_main9
;keypad3.c,55 :: 		case  1: kp = '1'; break; // 1        // Uncomment this block for keypad4x4
L_main11:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,56 :: 		case  2: kp = '2'; break; // 2
L_main12:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,57 :: 		case  3: kp = '3'; break; // 3
L_main13:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,58 :: 		case  4: kp = 'A'; break; // A
L_main14:
	MOVLW      65
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,59 :: 		case  5: kp = '4' ; break; // 4
L_main15:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,60 :: 		case  6: kp = '5'; break; // 5
L_main16:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,61 :: 		case  7: kp = '6'; break; // 6
L_main17:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,62 :: 		case  8: kp = 'B'; break; // B
L_main18:
	MOVLW      66
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,63 :: 		case  9: kp = '7'; break; // 7
L_main19:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,64 :: 		case 10: kp = '8'; break; // 8
L_main20:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,65 :: 		case 11: kp = '9'; break; // 9
L_main21:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,66 :: 		case 12: kp = 'C'; break; // C
L_main22:
	MOVLW      67
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,67 :: 		case 13: kp = '*'; break; // *
L_main23:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,68 :: 		case 14: kp = '0'; break; // 0
L_main24:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,69 :: 		case 15: kp = '#'; break; // #
L_main25:
	MOVLW      35
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,70 :: 		case 16: kp = 'D'; break; // D
L_main26:
	MOVLW      68
	MOVWF      _kp+0
	GOTO       L_main10
;keypad3.c,72 :: 		}
L_main9:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main25
	MOVF       _kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main26
L_main10:
;keypad3.c,73 :: 		password[index]=kp;
	MOVF       _index+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
;keypad3.c,74 :: 		lcd_chr(1,c1+5,password[index]);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	ADDWF      _c1+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _index+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;keypad3.c,75 :: 		if (index == 4){
	MOVF       _index+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main27
;keypad3.c,81 :: 		if (password[0]=='5' && password[1]=='1' && password[2]=='4' && password[3]=='2' && password[4]=='5')
	MOVF       _password+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_main30
	MOVF       _password+1, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main30
	MOVF       _password+2, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_main30
	MOVF       _password+3, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main30
	MOVF       _password+4, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_main30
L__main36:
;keypad3.c,83 :: 		{    delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
	NOP
;keypad3.c,84 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;keypad3.c,85 :: 		Lcd_Out(1, 1, "welcome");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_keypad3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;keypad3.c,86 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
	DECFSZ     R11+0, 1
	GOTO       L_main32
;keypad3.c,87 :: 		portb.b1 = 1;
	BSF        PORTB+0, 1
;keypad3.c,89 :: 		}
	GOTO       L_main33
L_main30:
;keypad3.c,92 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
	NOP
;keypad3.c,93 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;keypad3.c,94 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;keypad3.c,95 :: 		Lcd_Out(1, 1, "the password is error");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_keypad3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;keypad3.c,96 :: 		delay_ms(2000);        // Write message text on LCD
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
;keypad3.c,97 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;keypad3.c,98 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;keypad3.c,99 :: 		Lcd_Out(1, 1, "Key:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_keypad3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;keypad3.c,104 :: 		}
L_main33:
;keypad3.c,105 :: 		}
L_main27:
;keypad3.c,107 :: 		c1 = c1+1;
	INCF       _c1+0, 1
;keypad3.c,41 :: 		for(index=0;index<=4;index++)
	INCF       _index+0, 1
;keypad3.c,109 :: 		}
	GOTO       L_main3
L_main4:
;keypad3.c,112 :: 		}while (1);
	GOTO       L_main0
;keypad3.c,113 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
