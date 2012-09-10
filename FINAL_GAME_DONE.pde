
  int CircleSize = 16;
  boolean shoot = false;
  boolean playing = true; 
  boolean killer = true; 
  PFont fontA;
  int timer = 100;
  int count = 0;
  int why = 2; 
 float rand1 = random(255);
float rand2 = random(255);
float rand3 = random(255);
  
  int randx()

  

  {
    return int(random(600));
  }
  int C1 = randx(); 
  int C2 = randx();
   int C3 = randx(); 
  int C4 = randx(); 
 int C5 = randx(); 
 
  int[] CircleX = { C1,C2,C3,C4,C5 };
  int[] CircleY = { 0, 0, 0, 0, 0 };
  
  void setup()
  {
    size(600,620);
    fontA = loadFont("Rockwell-ExtraBold-48.vlw");
    textFont(fontA, 38);
    fill(0,0,0);

  }
  
  
  void draw()
  {
    background(0);
    fill(color(0,255,0));
    stroke(color(0,255,0));
    triangle(mouseX-8, 580, mouseX+8, 580, mouseX, 565);
    text(count,10, height - 50);
    if (timer > 0) {
       timer --;
    }
    //print(timer + " ");
   // if (timer == 0) {
     // key = 0; }
  //  if (key == ' ') {
       // timer = 50; } 
        
        if(shoot==true)
    {
      sphereKiller(mouseX);
      shoot = false;
    }
  if (playing==false){
     why = 0; 
      mouseX = -100; 
      killer = false;
     rand1 = 0;
    rand2 = 0;
   rand3 = 0; 
      //count = 0;
   }
     if (playing == true){
     why = 2;
     killer = true;
     rand1 = random(255);
     rand2 = random(255);
     rand3 = random(255);
   }
     
     

    CircleDrops();
    gameOver();
   Shooter(); 
   if ( killer == true) {
    Collision();
   }
    //Winner();
    if (key == 'r') {
    restart();

  }
  }
  
  void CircleDrops()
  {  


stroke(rand1,rand2,rand3);
fill(rand1,rand2,rand3);
for (int i=0; i<5; i++)

    {
      ellipse(CircleX[i], CircleY[i]+=why,
              CircleSize, CircleSize);
   

 }
  }
  
  void Shooter()
  {
   if (key == ' ')

    { 
   shoot = true;
    }
  }

   void restart(){
  {
    for (int i=0; i< 5; i++)
    {
      CircleY[i] = 0; 
      CircleX[i] = randx();
              count = 0;

       } 
      
  }
  loop();
key = 's';
   }
  void gameOver()
  {
    for (int i=0; i< 5; i++)
    {
      if(CircleY[i]==600)
      {
       
        //PImage b;
      // Images must be in the "data" directory to load correctly
        //b = loadImage("Loser.jpg");
        //image(b, 0, 0);
        //stroke(0,0,0);
        fill(255,255,255);
         text("You Lose!",150, height - 300);
        playing = false; 
        
        if (key == 'r') {
          loop(); 
          playing = true; 
        }
      }
    }
  }
  
  void mousePressed()
  {
    shoot = true;
  }
    
    void Collision() {
       for (int i=0; i< 5; i++)
       {
     if (CircleX[i] == mouseX && timer > 0) 
     CircleX[i] = -10;
     
     
     
     
     
     }
  }
  
   void sphereKiller(int shotX)
  {
    boolean hit = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (CircleX[i]-CircleSize/2)) && 
         (shotX <= (CircleX[i]+CircleSize/2)))
      {
        hit = true;
        line(mouseX, 565, mouseX, CircleY[i]);
        //rect( 0,0,1000,1000);
         text("Kill",100, height - 50);
        CircleX[i] = randx();
        CircleY[i] = 0;
        count++;
        print("you've killed " + count + " invaders ");
      }    
    }
  }

 
   // void Winner() {
     //if count == 100;
      {
       
        //PImage b;
      // Images must be in the "data" directory to load correctly
        //b = loadImage("Loser.jpg");
        //image(b, 0, 0);
      //  stroke(0,0,0);
        //fill(255,255,255);
         //text("Winner",10, height - 50);
        //noLoop();
      }
 


