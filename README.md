# SerialDemo

__2 small demo programs that perform very basic serial communication between ATtiny2313's__

## Setup
The button is connected to Port D4 of one ATtiny - that chip gets the sender hex
LEDs are connected to Port B ofn the other ATtiny - that one gets the receiver hex

The 2 Attiny's are connected to each other RX <-> Tx 

Pressing the button increments a counter on the first chip and send the result to the second on who displays the value on PORTB

The debounce on the button is really bad so it sometimes increments more than once.

The datasheet for the Attiny2313 is available here - 
[Datasheet](http://ww1.microchip.com/downloads/en/DeviceDoc/doc8246.pdf)

To load the hex onto the chips, I used the Arduino as an isp to setup my arduino
[Arduino as ISP and Arduino Bootloaders](https://www.arduino.cc/en/Tutorial/ArduinoISP)

I then load each one with the command line.  
_avrdude -p t2313 -c stk500v1 -b 19200 -P COM8 -U flash:w:Sender.hex -q_  
_avrdude -p t2313 -c stk500v1 -b 19200 -P COM8 -U flash:w:Receiver.hex -q_  

(COM8 <= replace with the COM port your Arduino ISP is connected on.)
(This will only run if the path for avrdude is in your PATH and you run them in the folder where the hex is located.)



