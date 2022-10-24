// Arduino/Procesing coupling example. 
//
// This example demonstrates transmitting values through the
// serial port from Arduino to Processing, using comma-delimited
// values (CSV). 
//
// This example displays the random values recieved from the Arduino.  


import processing.serial.*;

// Serial port vairables. 
Serial myPort;  // Create object from Serial class
int val;        // Temporary variable storing data received from the serial port

// Array of x/y coordinates recieved over serial port.  Maximum number of recordings to store is MAX_RECORDINGS. 
int MAX_RECORDINGS = 20;
int[][] data = new int[MAX_RECORDINGS][2];
int curDataIdx = 0;      // Index of array element that has highest populated value (-1)

// Font (for drawing text)
PFont fontA;

// Screenshot index (for taking screenshots). 
int screenshot_number = 0;


// Called whenever there is serial data available to read
void serialEvent(Serial port) {
  // Data from the Serial port is read in serialEvent() using the readStringUntil() function with * as the end character.
  String input = port.readStringUntil(char(10)); 
  
  if (input != null) {
    // Helpful debug message: Uncomment to print message received   
    println( "Receiving:" + input);
    input = input.trim();    
    int split_point = input.indexOf(',');
    if (split_point <= 0) return;        // If data does not contain a comma, then disregard it. 
      // Parse data
      // The data is split into an array of Strings with a comma or asterisk as a delimiter and converted into an array of integers.
      float[] vals = float(splitTokens(input, ","));
      int x = int(vals[0]) - 1;
      int y = int(vals[1]) - 1;
      
      // Store data
      data[curDataIdx][0] = x;
      data[curDataIdx][1] = y;
      
      // Increment index that we store new data at. 
      curDataIdx += 1;
      if (curDataIdx >= MAX_RECORDINGS) {
        curDataIdx = 0;
      }
      
      // Helpful debug message: Display serial data after parsing. 
      println ("Parsed x:" + x + "  y:" + y);
  }
  
}


// Draws a shape at each x/y location sent over the serial port. 
// Only draws the last N locations, where N is equal to MAX_RECORDINGS (i.e. the size of the data array). 
void draw_stored_data() {
    int size = 20;                // Size of shape to draw
    ellipse(300, 50, 50, 50);
    fill(255, 255, 255);
    text("Home", 280, 305);
    
    for (int i=0; i<MAX_RECORDINGS; i++) {        
      int angle = data[i][0];            // Grab x/y values from stored data
      int distance = data[i][1];
      System.out.println(angle + " " + distance);
      if ((angle > 0) && (distance > 0)) {          // Ensure that data is valid (greater than zero).
        int fillCol = floor(((float)i / (float)MAX_RECORDINGS) * 255); 
        fill(fillCol, fillCol, fillCol);  // Set fill colour dynamically
        stroke(128, 128, 128);            // Set stroke to middle grey
     
        ellipse(distance*cos(radians(angle))+300, distance*sin(radians(angle))+50, size, size);     // Draw circle at those x/y coordinates.
       
        line(30*cos(radians(angle))+300, 30*sin(radians(angle))+50, (distance-20)*cos(radians(angle))+300, (distance-20)*sin(radians(angle))+50);
       
        // Example of drawing text      
        fill(0, 0, 255);                   // Set fill to blue (RGB = 0, 0, 255)
        text(i,distance*cos(radians(angle))+295,distance*sin(radians(angle))+55); 
      } 
    } 

}


// This function runs a single time after the program beings. 
void setup() {
  size(600, 600);                    // Window size
  //colorMode(HSB, 255, 255, 255);     // Colour space
      
  // Initialize Serial Port
  println ("Available Serial Ports:");
  println (Serial.list());                     // Display a list of ports for the user.  
  String portName = Serial.list()[2];          // Change the index (e.g. 1) to the index of the serial port that the 
                                               // Arduino is connected to.
  print ("Using port: ");                      // Display the port that we are using. 
  println(portName); 
  println("This can be changed in the setup() function.");
  myPort = new Serial(this, portName, 9600);   // Open the serial port. (note, the baud rate (e.g. 9600) must match
                                               // the baud rate that the Arduino is transmitting at). 
    
  // Initialize font
  fontA = createFont("Arial-black", 20);
  textFont(fontA, 12);
  
  // Initialize data array  (set all elements to zero). 
  for (int i=0; i<MAX_RECORDINGS; i++) {
    data[i][0] = 0;
    data[i][1] = 0;
  }  
  
}


// This function runs repeatedly, like the loop() function in the Arduino language. 
void draw() {
  
  background(255, 255, 255);             // Set background to white

  // At each iteration, draw the data currently specified in the 'data' array to the screen.    
  draw_stored_data();
  
  // Note: Serial data is updated in the background using the serialEvent() function above, so we don't 
  // have to explicitly look for it (or parse it here). 

}


// This is another interrupt function that runs whenever a key is pressed.
// Here, as an example, if the space key (' ') is pressed, then the program will save a screenshot.
// If the 'a' key is pressed, then the program will clear the data history. 
void keyPressed() {
  // Press <space>: Save screenshot to file.
  if (key == ' ') {
   saveFrame("screenshot-" + screenshot_number + ".png"); 
   screenshot_number += 1;
  }
  
  // Press 'a': Clear data array
  if (key == 'a') {  
    for (int i=0; i<MAX_RECORDINGS; i++) {
      data[i][0] = 0;
      data[i][1] = 0;
    }
    curDataIdx = 0;
  }  
}
