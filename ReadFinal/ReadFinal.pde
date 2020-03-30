//This code reads from WriteFinal and shows the feedback

BufferedReader reader;
String line;
int i=0; 
 
PFont font;
PFont colon;
PFont title;
PFont title2;
 
void setup() {
  // Open the file from the createWriter() example
  reader = createReader("C:/Users/Amanda Lee Ping Ping/Desktop/WriteFinal/database.txt");
  //size(1000,1000);
  //textSize(30); 
  font = createFont("Lato-Light.ttf", 30);
  colon = loadFont("TimesNewRomanPS-BoldMT-48.vlw");
  title = createFont("Stellar-Light.otf", 70);
  title2 = createFont("Stellar-Regular.otf", 70);
  background(#000000);
  fullScreen();
}

 
void draw() {
  
   fill(#FFFFFF);
   rect(420, 40, 1500, 1000);

    String[] lines = loadStrings("C:/Users/Amanda Lee Ping Ping/Desktop/WriteFinal/database.txt");
   // println("there are " + lines.length + " lines");

      println(lines[i]);
      fill(#000000);
      line(570, 410, 1230, 410); //topline
      textFont(title);
      text("HOW OTHERS", 870, 440, 450, 100);
      textFont(title2);
      text("INTERPRETED", 870, 520, 450, 100);
      line(870, 610, 1900, 610); //bottom line
      
      textFont(colon, 60);
      text("''", 870, 150); //top colon
      text("''", 660, 650); //bottom colon
      text("''", 1300, 410); //rightside colon
      
      textFont(font);
      textLeading(35);
      textAlign(LEFT);
      text(lines[i], 880, 160, 300, 225);
      text(lines[i], 670, 660, 700, 200);
      text(lines[i], 1310, 420, 600, 300);
      i++; 
      
      delay(1500);
      
      // to cycle back 
      if (i==lines.length){
        i=0;
      }

}
