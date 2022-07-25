// Load Wi-Fi library
#include <WiFi.h>
#include <WebServer.h>


// Replace with your network credentials
//const char* ssid = "1280";
//const char* password =  "12345678";
const char* ssid = "Dat 2.4 G";
const char* password =  "5555555555";

// Set web server port number to 80
WebServer server(80);


// Auxiliar variables to store the current output state
String output2State = "off";
String output18State = "off";

// Assign output variables to GPIO pins
const int output2 = 2;
const int output18 = 18;

// Current time
unsigned long currentTime = millis();
// Previous time
unsigned long previousTime = 0; 
// Define timeout time in milliseconds (example: 2000ms = 2s)
const long timeoutTime = 2000;

void handleNotFound() {
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET) ? "GET" : "POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for (uint8_t i = 0; i < server.args(); i++) {
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }
  server.send(404, "text/plain", message);
}

void setup() {
  Serial.begin(115200);
  
  // Initialize the output variables as outputs
  pinMode(output2, OUTPUT);
  pinMode(output18, OUTPUT);
  // Set outputs to LOW
  digitalWrite(output2, LOW);
  digitalWrite(output18, LOW);

  // Connect to Wi-Fi network with SSID and password
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  // Print local IP address and start web server
  Serial.println("");
  Serial.println("WiFi connected.");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  // Dht setup
  //dht.begin();
  //Serial.println("Connect to dht11");

  server.enableCORS();

  server.on("/dht11", []() {
    float temp = random(20,40);
    float humi = random(50,70);
    Serial.printf("Nhiet do %s - Do am %s\r\n", String(temp, 1).c_str(), String(humi, 1).c_str());
    String tempStr = String(temp, 0);
    String humiStr = String(humi, 0);
    String res = String(tempStr + " " + humiStr);
    server.send(200, "text/plain", res);
  });
  
  server.on("/led/2/on", []() {
    if (output2State == "off") {
      Serial.println("LED 2 on");
      output2State = "on";
      digitalWrite(output2, HIGH);
      server.send(200, "text/plain", "Sucessfully!");
    }
    else {
      server.send(304, "text/plain", "No change!");
    }
  });

  server.on("/led/2/off", []() {
    if (output2State == "on"){
      Serial.println("LED 2 off");
      output2State = "off";
      digitalWrite(output2, LOW);
      server.send(200, "text/plain", "Sucessfully!");
    }
    else {
      server.send(304, "text/plain", "No change!");
    }
  });

  server.on("/led/1/on", []() {
    if (output18State == "off") {
      Serial.println("LED 18 on");
      output18State = "on";
      digitalWrite(output18, HIGH);
      server.send(200, "text/plain", "Sucessfully!");
    }
    else {
      server.send(304, "text/plain", "No change!");
    }
  });

  server.on("/led/1/off", []() {
    if (output18State == "on"){
      Serial.println("LED 18 off");
      output18State = "off";
      digitalWrite(output18, LOW);
      server.send(200, "text/plain", "Sucessfully!");
    }
    else {
      server.send(304, "text/plain", "No change!");
    }
  });

  server.on("/led/2/status", []() {
    server.send(200, "text/plain", output2State);
  });

  server.on("/led/1/status", []() {
    server.send(200, "text/plain", output18State);
  });

  server.onNotFound(handleNotFound);
  server.begin();
}

void loop(void) {
  server.handleClient();
}
