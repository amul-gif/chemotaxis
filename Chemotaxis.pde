/* Amulya Mulakala
2/10/25
Students will apply object-oriented programming concepts, including arrays of objects, constructors, and methods, to create a simulation of organisms performing a biased random walk in response to a stimulus using Math.random().
*/

//declare Stock variables here  

import java.util.ArrayList; //imported ArrayList package
//global variables initialized here
int x;
int y;
int stockColor;

ArrayList<Stock> apple = new ArrayList<Stock>(); //creating new arraylist holding the object Stock as it's type, and it's named apple

 void setup()  
 {    
    size(400,400); //canvas size
   
   apple.add(new Stock()); //initializes the arraylist with one new Stock

   
 }  
 void draw()  
{  
  background(255); //white background
 
  //creates the two black axis lines
  stroke(0);
   strokeWeight(5);
   line(20,0,20,400);
   line(0,320,400,320);
   
   //creates the gray background lines that simulate a graph
   strokeWeight(3);
   strokeWeight(1);
   for(int xDash = 20; xDash < 400; xDash+=50) //lines on x axis
   {
     for(int yDash = 20; yDash < 400; yDash +=50) { //lines on y axis
    // stroke(168,168,168);
    stroke(0);
     
     line(xDash,0, xDash,400);
     line(0,yDash, 400, yDash);
     
     }
   }
   
   //creates text "Stock Market" to display on screen
   fill(0);
    textSize(32);
   text("Stock Market", 120,50);
 
 
   //draws the stock objects to the screen
   for(int i = 0; i < apple.size(); i++) //for loop to iterate through the apple arrayList
   {

     if(i > 0) // i is greater than 0 then create stock object
     {
       if(apple.get(i).y > 320) // conditional to impact color of Stock, if greater than 320 (negative direction) then stock is red, if less than 320 (positive direction) then stock is green.
        {
          stockColor = color(255,0,0); //red
        }
       else
        {
          stockColor = color(0,255,0); //green
        }
 
        stroke(stockColor); //sets the color of the line to the stockColor value
        strokeWeight(3);
        //Connect previous point to the current point
        line(apple.get(i-1).x,apple.get(i-1).y,apple.get(i).x,apple.get(i).y); //draws line at x and y values based on random walk
     }
 
   }
   //Add new Stock object at each frame to extend the line
  apple.add(new Stock(apple.get(apple.size()-1).x,apple.get(apple.size()-1).y)); //adds a stock object to the arrayList




}  

  void mousePressed()
  {
    //Resets graph line on mouse click
    apple.clear(); //clears array list
    apple.add(new Stock()); //then starts fresh with one new stock
  }
 
 class Stock    
 {    
   int x; //instance variables
   int y;

 public Stock(){
   x = 20; //initializes instance variables to certain values
   y = 320;
 }
  public Stock(int prevX, int prevY) //overloaded contructor with previous x and y values to help with creating the random walk
  {
    x = prevX + 2; //increases by a constant of 2
    y = prevY + (int)(Math.random()*10)-5; //random walk, y values between -5 of 320 or 5 of 320.
  }
 
 
 }
