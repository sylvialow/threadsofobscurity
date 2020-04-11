//This code takes the data from Adafruit IO


import java.io.FileWriter;
import java.io.*;
import mqtt.*;

FileWriter fw;
BufferedWriter bw;
MQTTClient client;

//read and write string
BufferedReader reader; 
String line; 

//adafruit io
PFont font;
String feedback;
int index = 0;

void setup() {
  // Open the text file. RMB CHANGE FILE PATh 
  reader = createReader("C:/Users/Amanda Lee Ping Ping/Desktop/WriteFinal/database.txt");    
 // size(1000,1000);
 // background(0);
 // textSize(30); 
  
  //adafruitio
  client = new MQTTClient(this);
  client.connect("mqtt://sylvialow:5fe03a47cbb94545801926dafadbdf0b@io.adafruit.com", "sylvia");

}


//adafruitio
void clientConnected() {
  println("client connected");
  client.subscribe("sylvialow/feeds/threads");
}

//receive msg from adafruitio
void messageReceived(String topic, byte[] payload) {
  text(new String(payload),width/4,height/8, 500, 500);
  println("new message: " + new String(payload));
  
  //testing if file exists, if not, create new text file. RMB CHANGE file path
  try {
    File file =new File("C:/Users/Amanda Lee Ping Ping/Desktop/WriteFinal/database.txt");
     
    if (!file.exists()) {
      file.createNewFile();
    }
 
    FileWriter fw = new FileWriter(file, true);///true = append
    BufferedWriter bw = new BufferedWriter(fw);
    PrintWriter pw = new PrintWriter(bw);
    
    //pw.write(INPUT + new line)
    pw.write("\n" + new String(payload) );
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

 // Projects newest line-> write file dont need 
void draw() {
}
