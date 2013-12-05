NeoPixel
========

NeoPixel Library for Arduino and the NeoPixel strip sold by AdaFruit.  Adds individual LED brightness functionality.
AdaFruit version has setBrightness but the entire string responds instead of just a single led.
The AdaFruit Example still worked with this library
I tested with a 16 LED NeoPixel Ring.

New Setup Parameter:
;NEO_PxB  tells library to use a Pixel Brightness Array 
NeoPixel pixels = NeoPixel(NeoNumPixels, PIN, NEO_GRB + NEO_KHZ800 + NEO_PxB);

New Call: 
setBrightnessPixel(HowBright,Pixel#);
