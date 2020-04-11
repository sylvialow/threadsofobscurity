//This code reads from WriteFinal and shows the feedback

BufferedReader reader;
String line;
String linea;
String lineb;
int i=0; 
 
PFont font;
PFont colon;
PFont title;
PFont title2;
 
void setup() {
  // Open the file from the createWriter() example
  reader = createReader("C:/Users/Amanda Lee Ping Ping/Desktop/WriteFinal/database.txt");
  reader = createReader("C:/Users/Amanda Lee Ping Ping/Desktop/WriteFinal/database2.txt");
  reader = createReader("C:/Users/Amanda Lee Ping Ping/Desktop/WriteFinal/database3.txt");
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
   rect(0, 0, 1920, 1080);

    String[] lines = loadStrings("C:/Users/Amanda Lee Ping Ping/Desktop/WriteFinal/database.txt");
    String[] linea = loadStrings("C:/Users/Amanda Lee Ping Ping/Desktop/WriteFinal/database2.txt");
    String[] lineb = loadStrings("C:/Users/Amanda Lee Ping Ping/Desktop/WriteFinal/database3.txt");
    
   // println("there are " + lines.length + " lines");

      println(lines[i]);
      fill(#000000);
      line(100, 410, 820, 410); //topline
      textFont(title);
      text("HOW OTHERS", 450, 440, 450, 100);
      textFont(title2);
      text("INTERPRETED", 450, 520, 450, 100);
      line(450, 610, 1900, 610); //bottom line
      
      textFont(colon, 60);
      text("''", 450, 100); //top colon
      text("''", 240, 680); //bottom colon
      text("''", 880, 410); //rightside colon
      
      textFont(font);
      textLeading(35);
      textAlign(LEFT);
      text(lines[i], 460, 110, 300, 225); //top text
      text(linea[i], 250, 690, 700, 200); //bottom text
      text(lineb[i], 890, 420, 600, 300); //rightside text
      i++; 
      
      delay(1500);
      
      // to cycle back 
      if (i==lines.length){
        i=0;
      }

}
