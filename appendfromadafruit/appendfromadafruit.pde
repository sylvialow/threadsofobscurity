
import java.io.FileWriter;
import java.io.*;
import mqtt.*;

FileWriter fw;
BufferedWriter bw;
MQTTClient client;

BufferedReader reader; 
String line; 

PFont font;
String feedback;
int index = 0;

void setup() {
  // Open the text file. RMB CHANGE FILE PATh 
  reader = createReader("C:/Users/User/Desktop/appendfromadafruit/database.txt");    
  // bg and display text values
  size(1000,1000);
  background(0);
  textSize(30); 
  font = createFont("Lato-Light.ttf", 40);
  
  client = new MQTTClient(this);
  client.connect("mqtt://sylvialow:5fe03a47cbb94545801926dafadbdf0b@io.adafruit.com", "sylvia");
}

void clientConnected() {
  println("client connected");

  client.subscribe("sylvialow/feeds/threads");
}

//receive msg from adafruitio
void messageReceived(String topic, byte[] payload) {
  //background(0);
  //fill(255); 
  text(new String(payload),width/4,height/8, 500, 500);
  println("new message: " + new String(payload));
  
  //testing if file exists, if not, create new file?
  try {
    File file =new File("C:/Users/User/Desktop/appendfromadafruit/database.txt");
     
    if (!file.exists()) {
      file.createNewFile();
    }
 
    FileWriter fw = new FileWriter(file, true);///true = append
    BufferedWriter bw = new BufferedWriter(fw);
    PrintWriter pw = new PrintWriter(bw);
    
    //pw.write(INPUT + new line)
    pw.write(new String(payload) + "\n");
      //for (int i = 0 ; i < 20; i++) {
      //  pw.write(mouseX + "\n");
      //}
 
    pw.close();
  }
  catch(IOException ioe) {
    System.out.println("Exception ");
    ioe.printStackTrace();
  }
}


 // Projects the newest line?
void draw() {
  String[] lines = loadStrings("C:/Users/User/Desktop/appendfromadafruit/database.txt");
  //println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) {
      println(lines[i]);
      //delay(1000);
      background(0); 
      text(lines[i],height/2,width/2);
  }
}
