unsigned short kp;
// Keypad module connections
char  keypadPort at PORTD;
// End Keypad module connections

// LCD module connections
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;
// End LCD module connections
  char password[5];
  char index;
  char c1;

void main() {
  trisb.b1   = 0;
  portb.b1 = 0;
  
                                   // Reset counter
  Keypad_Init();                           // Initialize Keypad

  Lcd_Init();                              // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);                     // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
  Lcd_Out(1, 1, "Key:");                 // Write message text on LCD


  do {
    kp = 0;   
     c1 = 1;                            // Reset key code variable
    for(index=0;index<=4;index++)
    {
    // Wait for key to be pressed and released
    do {
      // kp = Keypad_Key_Press();          // Store key code in kp variable
      kp = Keypad_Key_Click();             // Store key code in kp variable
    }while (!kp); // stay if the button not clicked
   // Prepare value for output, transform key to it's ASCII value
    switch (kp) {
      //case 10: kp = 42; break;  // '*'   // Uncomment this block for keypad4x3
      //case 11: kp = 48; break;  // '0'
      //case 12: kp = 35; break;  // '#'
      //default: kp += 48;

      case  1: kp = '1'; break; // 1        // Uncomment this block for keypad4x4
      case  2: kp = '2'; break; // 2
      case  3: kp = '3'; break; // 3
      case  4: kp = 'A'; break; // A
      case  5: kp = '4' ; break; // 4
      case  6: kp = '5'; break; // 5
      case  7: kp = '6'; break; // 6
      case  8: kp = 'B'; break; // B
      case  9: kp = '7'; break; // 7
      case 10: kp = '8'; break; // 8
      case 11: kp = '9'; break; // 9
      case 12: kp = 'C'; break; // C
      case 13: kp = '*'; break; // *
      case 14: kp = '0'; break; // 0
      case 15: kp = '#'; break; // #
      case 16: kp = 'D'; break; // D

    }
    password[index]=kp;
    lcd_chr(1,c1+5,password[index]);
    if (index == 4){

      //lcd_chr(1,index,"please press enter #");
      //delay_ms(700);
      

      if (password[0]=='5' && password[1]=='1' && password[2]=='4' && password[3]=='2' && password[4]=='5')
      
      {    delay_ms(500);
           Lcd_Cmd(_LCD_CLEAR);
           Lcd_Out(1, 1, "welcome");
           delay_ms(200);
           portb.b1 = 1;

      }
      else{
      
             delay_ms(500);
             Lcd_Cmd(_LCD_CLEAR);                     // Clear display
             Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
             Lcd_Out(1, 1, "the password is error");
             delay_ms(2000);        // Write message text on LCD
              Lcd_Cmd(_LCD_CLEAR);                     // Clear display
             Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
             Lcd_Out(1, 1, "Key:");

             


      }
    }

        c1 = c1+1;

   }
   
   
  }while (1);
}
