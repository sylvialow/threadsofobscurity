
import java.io.FileWriter;
import java.io.*;

FileWriter fw;
BufferedWriter bw;

BufferedReader reader; 
String line; 

void setup() {
  // Open the text file. RMB CHANGE FILE PATh 
  reader = createReader("C:/Users/User/Desktop/hi.txt");    
  // bg and display text values
  size(1000,1000);
  textSize(30); 
}

void keyPressed() { // Press a key to save mouseX 
//testing if file exists, if not, create new file?
  try {
    File file =new File("C:/Users/User/Desktop/hi.txt");
     
    if (!file.exists()) {
      file.createNewFile();
    }
 
    FileWriter fw = new FileWriter(file, true);///true = append
    BufferedWriter bw = new BufferedWriter(fw);
    PrintWriter pw = new PrintWriter(bw);
    
    //pw.write(INPUT + new line)
    pw.write(mouseX + "\n");
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
  String[] lines = loadStrings("C:/Users/User/Desktop/hi.txt");
  //println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) {
      println(lines[i]);
      background(0); 
      text(lines[i],height/2,width/2);
  }
}
