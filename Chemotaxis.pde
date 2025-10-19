Electron[] booley;
Lightning electroboom;
void setup() {
  background(#B2D8F5);
  size(800, 500);
  textAlign(CENTER);
  booley = new Electron[0];
  electroboom = new Lightning(100);
}

int lightningStruck = 0;
void draw() {
  background(5,0, 25);
  textSize(20);
  text("Discharge the potential difference into the ground by clicking", 400, 30);
   noStroke();
   fill(#5DB90D);
   rect(0, 300, 800,500);
   fill(#795F07);
   rect(0, 325, 800,500);
  fill(255,255,255);
  for (int i = 0; i < booley.length; i++) {
   booley[i].dissipation(booley[i].myX, booley[i].myY); 
   booley[i].show();
    }
}


class Electron {
  int size, myX, myY, fade, fadeFactor, shade;
  Electron(int x1, int y1) {
    myX = x1;
    myY = y1;
    fade = 350;
    fadeFactor = (int)(Math.random()* 15)+10;
    shade = color((int)(Math.random() * 50), (int)(Math.random() * 30) + 150, 210);
  }
  void dissipation(int x, int y) {
    if (myX == x)
      myX += (int)(Math.random() * 21) - 10;
    else if (myX <= x)
      myX -= (int)(Math.random()*20) + 5;
    else if (myX > x)
      myX -= (int)(Math.random()*20) + 5;
    myY += (int)(Math.random()*10) - 3;
    fade -= .35*fadeFactor;
  }
  void show() {
  if (fade > 0) {
    noStroke();
    fill(shade, fade);
    ellipse(myX, myY, 20, 20);

    textAlign(CENTER, CENTER);
    textSize(10);          
    fill(255);              
    text("e-", myX, myY);
  }
}
}
  
void mouseReleased(){
   lightningStruck = mouseX;
   electroboom = new Lightning(lightningStruck); 
   booley = new Electron[(int)(Math.random() * 6) + 10];
   for (int i = 0; i < booley.length; i++) {
     booley[i] = new Electron(lightningStruck, 300);
   
  }
  electroboom = new Lightning(lightningStruck);
  electroboom.show();
}

class Lightning {
  int myX, myY, endY, xF, yF,shade, fade, fadeFactor;
   Lightning(int x) {
    myX = x;
    myY = 0;
    endY = 300;
    xF =  0;
    yF = 0;
    fade = 500;
    fadeFactor = 25;
  }

  void show() {
  if (fade > 0) {
    stroke(255, fade);
    strokeWeight(3);
    int lastX = myX;
    int lastY = myY;
    while (lastY < endY - 10) {
      int nextX = lastX + (int)(Math.random() * 11) - 5;
      int nextY = lastY + (int)(Math.random() * 15) + 5;
      line(lastX, lastY, nextX, nextY);
      lastX = nextX;
      lastY = nextY;
    }
    line(lastX, lastY, lastX, endY);
 
    fade -= fadeFactor;
  }
}
}
