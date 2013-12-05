//an example to just set the brightness of each led and display with COLOR rotating ROYGBIV

#define NeoNumPixels 16

#include <NeoPixel.h>
#ifdef __AVR_ATtiny85__ // Trinket, Gemma, etc.
  #include <avr/power.h>
#endif

#define PIN  6


NeoPixel pixels = NeoPixel(NeoNumPixels, PIN, NEO_GRB + NEO_KHZ800 + NEO_PxB);
//NEO_PxB tells library to use a brightness array for each pixel

int r,g,b;
int state;
int brightArr[NeoNumPixels];

void setup() {
  Serial.begin(9600); 
  r = 255;
  g = 0;
  b = 0;
  state = 1;
  //define each pixels brightness here
  pixels.setBrightnessPixel(80  ,0);//(brightness,pixel number)
  pixels.setBrightnessPixel(10  ,1);
  pixels.setBrightnessPixel(70  ,2);
  pixels.setBrightnessPixel(10  ,3);
  pixels.setBrightnessPixel(60  ,4);
  pixels.setBrightnessPixel(10  ,5);
  pixels.setBrightnessPixel(50  ,6);
  pixels.setBrightnessPixel(10  ,7);
  pixels.setBrightnessPixel(60  ,8);
  pixels.setBrightnessPixel(10  ,9);
  pixels.setBrightnessPixel(70  ,10);
  pixels.setBrightnessPixel(10  ,11);
  pixels.setBrightnessPixel(80  ,12);
  pixels.setBrightnessPixel(10 ,13);
  pixels.setBrightnessPixel(80 ,14);
  pixels.setBrightnessPixel(10 ,15);

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
  

  //delay(30);
  
}
