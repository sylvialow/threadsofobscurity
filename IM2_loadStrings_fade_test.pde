PFont font1;

String[] words; //for loadString function
int index = 0; //forloadString function

//String a = "source";
//String b = "other source";
//String displayed = "";

float timeInterval;
float timePast;

int time0;
int textAlpha = 100; //holds the alpha value (opacity of text)
int textFade = 5; //how quickly the text will fade in and out --> 2 seconds


void textFade() { 
  if (millis() > timeInterval + timePast) { //when total time is more than the time taken to fade and the fading method, the fading will repeat itself
    timePast = millis(); //returns the number of milliseconds since the text started running
    textFade *= -1; //reverse so that text will fade in and out
  }
  textAlpha += textFade; //text is going to fade in every phrase
}


void setup() {
  size(1000, 1000);
  background(0);
  font1 = loadFont("HPSimplified-BoldItalic-48.vlw"); //copy and paste font name from Tools > create font
  
  String[] lines = loadStrings("loadstring.txt");
  String alllines = join(lines, " ");
  println(alllines);
  
  //displayed = a
  timePast = millis();
  timeInterval = 5000.0f; //every 5s, the fading method will repeat
  delay(2000); //break after fade in and fade out  
  noStroke();
  //fullscreen(); //when the final proj is ready the display can be fullscreen
}


void draw() {
  background(0);
  textFade();
  
  textFont(font1); //set font to times new roman
  textSize(100);
  textAlign(CENTER);
  fill(#F7AFAF, textAlpha);
  
  text(words[index], width/2, height/2);
  //text(displayed, 200, 200, width/2, height/4);
  //text(displayed, width/4 - textWidth(displayed)/2, height/4);
  //if (millis() - timePast >= timeInterval){
  //  displayed = displayed.equals(a)? b:a;
  //  time0 = millis();
  //}
  
  
  //displayed = displayed.equals(a)? a:b;
  
  //for(int i = 0, i < 2, i+=2){
    
    
}

//int r = c.recv(); --> for processing to receive the command from webserver
//when this code is receiving from adafruit IO, it needs a condition/command to always take the next string/ next comment in the database
//puts an array of codes in the processing code, and make a cyclic shift with these codes and the input
