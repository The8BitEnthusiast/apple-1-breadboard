import wave, struct
import RPi.GPIO as GPIO    # Import Raspberry Pi GPIO library
from time import sleep     # Import the sleep function from the time module

GPIO.setwarnings(False)    # Ignore warning for now
GPIO.setmode(GPIO.BOARD)   # Use physical pin numbering
GPIO.setup(8, GPIO.OUT, initial=GPIO.LOW)   # Set pin 8 to be an output pin and set initial

wavefile = wave.open('BASIC.wav', 'r')

length = wavefile.getnframes()
for i in range(0, length):
    wavedata = wavefile.readframes(1)
    data = struct.unpack("<h", wavedata)
    if (int(data[0]) == -32678:
        GPIO.output(8, GPIO.LOW)
    else:
        GPIO.output(8, GPIO.HIGH)

    sleep(20/1000000)

    #print(int(data[0]))
