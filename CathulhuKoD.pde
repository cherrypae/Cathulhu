PGraphics h1;
PGraphics h2;
PImage Servant;
PImage Ghost;
PImage Cthulhu;

int screen = 1;
int turn = 0;
int character = 2;

float health = 100;
float MAX_HEALTH = 100;
float rectWidth = 200;

float myHealth=100;
float myMAX_HEALTH=100;
float myRectWidth = 200;

int delayTime;
int creationTime;
int currentIndex;

Title box1;
Story box2;
Select box3;
Win1 box4;
Win2 box5;
Lose box6;
Attack box7;
Guard box8;
Special box9;
Final box10;
Hero box11;
Hero2 box12;

void setup()
{
  size(500, 500, P2D);
  box1 = new Title( "C(a)thulhu: Kittens of Darkness", 20, 20, 100);
  box2 = new Story( "C(a)thulhu's seal, located in the submerged city of R'lyeh,\nhas been broken, and his servants were released with the\nmain objective of spreading the fundamental chaos around\nthe world. Meanwhile, sectarians of the Star Seed will try to\nstop our hero, so there's no time left for the great creature\nto come back to Earth, trying to recover its sacred land...\n\nAnd through the darkness, you can hear them calling:\n«Ph´nglui mglw´nafh Cthulhu R´lyeh wgah´nagl fhtagn...»", 20, 20, 100);
  box3 = new Select("CHOSE YOUR HERO WISELY AND FIGHT WITH YOUR HEART", 20, 20, 100);
  box4 = new Win1("YOU DEFEATED THE SECTARIAN", 20, 20, 100);
  box5 = new Win2("YOU DEFEATED THE SERVANT", 20, 20, 100);
  box6 = new Lose("YOU'VE BEEN DEFEATED", 20, 20, 100);
  box7 = new Attack("Attack", 20, 20, 100);
  box8 = new Guard("Guard", 20, 20, 100);
  box9 = new Special("Special", 20, 20, 100);
  box10 = new Final( "You have defeaten the dark kitten, and now the seal will\nremain in the deep ocean, located in the submerged\ncity of R'lyeh, where C(a)thulhu rests in the inmortality...\n\nAn now, an honorable warrior becomes a great hero...\n\n                                     THE END.", 20, 20, 100);
  box11 = new Hero();
  box12 = new Hero2();
  
  Servant =  loadImage("Servant.png");
  Ghost = loadImage("Ghost.png");
  Cthulhu = loadImage("Cthulhu.png");
  
}

void draw()
{
  background(25);
  if(screen == 1) 
  {
    box1.draw();
    pressSpace();
  }
  if(screen == 2) 
  {
    box2.draw();
  }
  if(screen == 3) 
  {
    box3.draw();
    box11.draw();
    box12.draw();
    choseHero();
  }

  if(screen == 4) 
  {
    image(Servant,370,100);
    box7.draw();
    box8.draw();
    box9.draw();
    noStroke();
    
    float drawWidth = (health / MAX_HEALTH) * rectWidth;
    rect(260, 225, drawWidth, 15);
    float myDrawWidth = (myHealth / myMAX_HEALTH) * myRectWidth;
    rect(150, 450, myDrawWidth, 15);
    
    if(key == '2') 
    {
      character = 2;
      translate(-320, 150);
      box11.draw();
    }
    else if(key == '1') 
    {
      character = 1;
      translate(-30, 150);
      box12.draw();
      }   
      
    if(health<=0)
    {
      screen=screen+1;
    }
    
    if(myHealth<=0)
    {
      screen=screen+7;
    }
  }
  if(screen == 5) 
  {
    box4.draw();
    health=100;
    myHealth=100;
  }
  if(screen == 6) 
  {
    image(Ghost,370,125);
    Ghost.resize(0,75);
    box7.draw();
    box8.draw();
    box9.draw();
    noStroke();
    
    float drawWidth = (health / MAX_HEALTH) * rectWidth;
    rect(260, 225, drawWidth, 15);
    float myDrawWidth = (myHealth / myMAX_HEALTH) * myRectWidth;
    rect(150, 450, myDrawWidth, 15);
    
    if(character == 2) 
    {
      translate(-320, 150);
      box11.draw();
    }
    else if(character == 1) 
    {
      translate(-30, 150);
      box12.draw();
      }
      
         if(health<=0)
    {
      screen=screen+1;
    }
    
    if(myHealth<=0)
    {
      screen=screen+5;
    }
  }
  if(screen == 7) 
  {
    box5.draw();
    finalBattle();
    health=100;
    myHealth=100;
  }
  
  if(screen == 8) 
  {
    image(Cthulhu,370,115);
    Cthulhu.resize(0,115);
    box7.draw();
    box8.draw();
    box9.draw();
    noStroke();
    
    float drawWidth = (health / MAX_HEALTH) * rectWidth;
    rect(260, 225, drawWidth, 15);
    float myDrawWidth = (myHealth / myMAX_HEALTH) * myRectWidth;
    rect(150, 450, myDrawWidth, 15);
    
    if(character == 2) 
    {
      translate(-320, 150);
      box11.draw();
    }
    else if(character == 1) 
    {
      translate(-30, 150);
      box12.draw();
      }
      
      if(health<=0)
    {
      screen=screen+1;
    }
    
    if(myHealth<=0)
    {
      screen=screen+3;
    }
  }
  if(screen == 9) 
  {
    box10.draw();
  }
  
  if (screen == 10)
  exit();
  
  if(screen == 11) 
  {
    box6.draw();
    loseAgainst();
  }
}


//Functions
void pressSpace(){
  fill(255);
  text("Press SPACE to play", width/4+71, height/2+25);
}

void choseHero(){
  fill(255);
  text("        Aerin\nPress 1 to chose", width/2-190, height-75);
  text("        Auron\nPress 2 to chose", width/2+100, height-75);
}



void finalBattle(){
  fill(255);
  text("You'll fight the great creature!\n  -Press SPACE to continue-", width/4+52, height/2+25);
}

void loseAgainst(){
  fill(255);
  text("You lose the battle against the chaos!\n       -Press R to play again-", width/4+27, height/2+25);
  if(key == 'r') {
    screen = 1;
    }
   health = 100;
   myHealth = 100;
}

//END OF FUNCTIONS

//Screen switch
void keyPressed( ) 
{
  screen = min(screen + 1, 11);
}

//Attack selection
void mousePressed()
{
  if (mouseY >= 320 && mouseY <= 335)
  {
    if (health > 0 && mouseButton == LEFT)
    {
      health -= 10;
      myHealth-=random(5,20);
     }
   }
  
  if (mouseY >= 340 && mouseY <= 355)
  {
    if (health > 0 && mouseButton == LEFT)
    { 
        myHealth-=random(1,5);
     }
    }
  
  if (mouseY >= 360 && mouseY <= 375)
  {
    if (health > 0 && mouseButton == LEFT)
    {
      health -= 20;
      myHealth-=random(5,20);
     }
    }
  }