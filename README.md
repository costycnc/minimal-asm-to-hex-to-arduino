# minimal-asm-to-hex-to-arduino

I create https://www.costycnc.it/avr-hex-uploader

![image](https://github.com/costycnc/minimal-asm-to-hex-to-arduino/assets/3405110/aad6170d-b068-48ea-8ce0-eca87676716d)

1.I create two buttons because exists arduino with 57600 bauds and 115200. you have no way of knowing what arduino have,so... try first button ... if procent non increase ... disconnect and reconnect usb and try with second button! After upload the led need to blinking!


2.In this box you can put the hex code. So open your hex file with notepad ... copy text and put in this box.And upload to arduino.

3. Here have two hex file :
    if put :020000020000FC:040000000C946000FC:0800C0008FEF84B985B9FFCF71:00000001FF in the box and upload to arduino the led will remain on.
    here is the asm code that I followed:
           .device ATmega32
        
           .equ PORTB = 0x05 
           .equ DDRB  = 0x04
        
           .org 0x0000
            jmp main
           .org 0x0060
        
           main:
           ldi r24, 255 ;255 have al 8 bits one 11111111
           out DDRB,r24 ; All 8 gate of port b will be high ... mean output( low 0 mean input)
           out PORTB,r24 ; All 8 pins of port b will be high that mean ON (low mean OFF)
           loop:
           rjmp loop


   4. if put :020000020000FC:040000000C946000FC:0800C00080E084B985B9FFCF8F:00000001FF  in the box and upload to arduino the led will remain on.
    here is the asm code that I followed:
           .device ATmega32
        
           .equ PORTB = 0x05 
           .equ DDRB  = 0x04
        
           .org 0x0000
            jmp main
           .org 0x0060
        
           main:
           ldi r24, 0 ;0 have al 8 bits one 00000000
           out DDRB,r24 ; All 8 gate of port b will be low ... mean input
           out PORTB,r24 ; All 8 pins of port b will be low that mean off 
           loop:
           rjmp loop

    5.From here https://www.costycnc.it/avr-hex-uploader/easy-hex-create.zip you can download file where have the mini program avra that is a minimal asm to hex compiler.Also will have a sample asm example.
   you can compile directly in dos command with : avra test.asm  or can create a bat file where put avra test.asm  and second line the Pause for rimain the windows open to see what comunicate program

   
   

       
