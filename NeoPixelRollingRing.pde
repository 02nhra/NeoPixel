//creates a rolling ring for the 16 LED NeoPixel Ring
//Dims each led progressively and rotates the values
//Looks like the "You are Stuck Here" icon in Windows...:)

#define NeoNumPixels 16


#include <NeoPixel.h>
#ifdef __AVR_ATtiny85__ // Trinket, Gemma, etc.
  #include <avr/power.h>
#endif

#define PIN  6


NeoPixel pixels = NeoPixel(NeoNumPixels, PIN, NEO_GRB + NEO_KHZ800 + NEO_PxB);
//NEO_PxB tells library to use a brightness array for each pixel

int r,g,b;
int state,brt;
int brightArr[NeoNumPixels];

void setup() {
  Serial.begin(9600); 
  r = 255;
  g = 0;
  b = 0;
  state = 1;

  brt = 34;
  for (int a = 0; a < 16; a++){
    pixels.setBrightnessPixel(brt,a);//(brightness,pixel number)
    brightArr[a] = brt;
    brt -= 2;
  }
  
  brt = 0;
  pixels.begin();
}

void loop() {
int i;
  for (i = 0; i <= 15; i++){
      pixels.setPixelColor(i, r, g, b);
      pixels.show();
      //delay(400);
   }
   //r 255 g 0   b 0
   //r 255 g 255 b 0
   //r 0   g 255 b 0
   //r 0   g 255 b 255
   //r 0   g 0   b 255
   //r 255 g 0   b 255
   //r 255 g 0   b 0
   switch(state){
      case 1:
         g++;
         if (g > 254) state++;
         break; 
     case 2:
         r--;
         if (r == 0) state++;
         break;
     case 3:
         b++;
         if (b > 254) state++;
         break;
     case 4:
         g--;
         if (g == 0) state++;
         break;
     case 5:
         r++;
         if (r > 254) state++;
         break;
     case 6:
         b--;
         if (b == 0) state = 1;
         break;
         
     
   }
  
  brt = 10;
  int br0 = brightArr[0];
  for (int a = 0; a <= NeoNumPixels-1; a++){
     if (a == NeoNumPixels-1) brightArr[NeoNumPixels-1] = br0;
     else brightArr[a] = brightArr[a+1];
     pixels.setBrightnessPixel(brightArr[a],a);
  }
  
  delay(30);
  
}
