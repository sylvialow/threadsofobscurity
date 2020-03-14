import mqtt.*;

PFont font;

String feedback;
int index = 0;

MQTTClient client;

void setup() {
  size(1000, 1000);
  background(0);
  font = createFont("Lato-Light.ttf", 40);
  
  
  client = new MQTTClient(this);
  client.connect("mqtt://sylvialow:5fe03a47cbb94545801926dafadbdf0b@io.adafruit.com", "sylvia");
  
  //fullScreen();
}



void keyPressed() {
  //client.publish("/hello", "world");
}

void clientConnected() {
  println("client connected");

  client.subscribe("sylvialow/feeds/threads");
}

void messageReceived(String topic, byte[] payload) {
  background(0);
 fill(255); 
  text(new String(payload),width/4,height/8, 500, 500);
  println("new message: " + new String(payload));
}

void connectionLost() {
  println("connection lost");
}

void draw() {
 // background(0);
  
  textSize(40);
  textAlign(LEFT);
  textFont(font);
  text("ncsjfjfhurfhfbjdhudshfuhfudjhfudhfudhufeufewjf",width/8,height/8, 500, 500);
  //text(, width/2, height/2);
  //index++;
}
