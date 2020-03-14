BufferedReader reader;
String line;
int i=0; 
 
PFont font;
 
 //text fade
float timeInterval;
float timePast;
//int time0;
int textAlpha = 100; //holds the alpha value (opacity of text)
int textFade = 1; //how quickly the text will fade in and out seconds
 
void setup() {
  // Open the file from the createWriter() example
  reader = createReader("C:/Users/User/Desktop/WriteFinal/database.txt");
  size(1000,1000);
  textSize(30); 
  font = createFont("Lato-Light.ttf", 40);
  
   //textfade 
  timePast = millis();
  timeInterval = 5000.0f; //every 5s, the fading method will repeat
 // delay(2000); //break after fade in and fade out  
 // noStroke();
}

//textfade
void textFade() { 
  if (millis() > timeInterval + timePast) { //when total time is more than the time taken to fade and the fading method, the fading will repeat itself
    timePast = millis(); //returns the number of milliseconds since the text started running
    textFade *= -1; //reverse so that text will fade in and out
  }
  textAlpha += textFade; //text is going to fade in every phrase
}
 
void draw() {

    String[] lines = loadStrings("C:/Users/User/Desktop/WriteFinal/database.txt");
   // println("there are " + lines.length + " lines");

      println(lines[i]);
      background(0); 
      textFade(); //fade BUT IT NO WORK 
      fill(255,255,255,textAlpha); //fade
      text(lines[i],height/2,width/2);
      delay(3000); // when to fade to next response
      i++; 
      
      // to cycle back 
      if (i==lines.length){
        i=0;
      }
    //}
  }
