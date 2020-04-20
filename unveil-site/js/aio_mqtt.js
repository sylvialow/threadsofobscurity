

var hostname =  'io.adafruit.com'
var port = 443
var username = 'sylvialow'
var password = '5fe03a47cbb94545801926dafadbdf0b'
var con_flag = -1;
var start = -1;
var client;

var options = {
		useSSL: true,
		userName: "sylvialow",
		password: "5fe03a47cbb94545801926dafadbdf0b",
		onSuccess: onConnect,
		onFailure: onFail,
		reconnect: true
	}

function checkMessage(){
	alert(start);
	if(start == 1){
		alert("KINDLY WAIT FOR A WHILE");
		return false;
	}
	else{
		sendMessage();
		return true;
	}
		
}

function sendName(){
	//alert("function: sendName");
	if(bFlag == 1){
		var str1 = document.getElementById('name').value;
		var str2 = document.getElementById('hi').value;
		var msg = str2 + " " + str1 ;
		//alert(msg);
		
		message = new Paho.MQTT.Message(msg);
		message.destinationName = username+"/feeds/threads";
		client.send(message);
		//alert(msg);
		return true;
	}
	return false;
}

// if(bFlag == 1){
// 	var str3 = document.getElementById('name').value;

// 	if(var str3 == 7){
// 		m_SubscribeNameUI.text = "Hi There";
// 	}
// }


function sendMessage(){
	//alert("function: sendMessage");
	if(bFlag == 1){
		var str1 = document.getElementById('threads').value;
		var str2 = $("input:radio[name=a_idx]:checked").val();
		
		var msg1 = str1 ;
		var msg2 = str2 ;
		
		
		message1 = new Paho.MQTT.Message(msg1);
		message1.destinationName = username+"/feeds/threads";
		client.send(message1);
		
		//alert(str2);
		
		message2 = new Paho.MQTT.Message(msg2);
		message2.destinationName = username+"/feeds/a_idx";
		client.send(message2);
		
		return true;
	}
	return false;
}

function onConnect(){
	console.log("connected");
	bFlag = 1;
	client.publish("sylvialow/feeds/threads","",qos=0, retain=True);
	client.subscribe("sylvialow/feeds/threads");
	
	
}

function onFail(){
	bFlag = -1;
	console.log("not connected");
}

function onMessageArrived(message) {
  console.log("onMessageArrived:"+ message);
  start = message.payloadString;
  alert(start);
}

function onConnectionLost(responseObject) {
    if (responseObject.errorCode !== 0) {
      console.log("onConnectionLost:"+responseObject.errorMessage);
    }
  }

function MQTTConnect(){
	con_flag = 0
	//client = new Paho.MQTT.Client(hostname, Number(port), '/mqtt/','clientjs')
	//var client = new Paho.MQTT.Client(hostname, Number(port), 'clientjs');
	client = new Paho.MQTT.Client("io.adafruit.com", 443, "testID");
	client.onMessageArrived = onMessageArrived;
	client.connect(options);
	console.log("connecting to " + hostname + " " + port);
}

