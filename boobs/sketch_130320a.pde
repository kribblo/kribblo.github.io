color backgroundColor = #E0C3A3;
color c1 = #FADEC0;
color c2 = #F25FB5;
color c3 = #F289C6;

boolean pressed = false;

float boingLeft = 0;
float boingRight = 0;

int boobCenterFromBorder = 195;

int radius1 = 300;
int radius2 = 100;
int radius3 = 35;

void setup() {
  size(700,400);
  noStroke();
  frameRate(30);
}

void draw() {
  // clear background
  background(backgroundColor);
  
  // slowly make boing left smaller
  if(boingLeft > 0 && !pressed) {
    boingLeft = boingLeft -0.7;
  }
  
  // slowly make boing right smaller
  if(boingRight > 0 && !pressed) {
    boingRight = boingRight -0.7;
  }

  // calculate smooth boing for this frame, while the boings are counting down (see above), the sin() function makes the actual bounce effect
  float leftSinus = sin(boingLeft) * boingLeft;
  float rightSinus = sin(boingRight) * boingRight;
  
  // draw boobs
  fill(c1);
  ellipse(boobCenterFromBorder, 200, radius1 + leftSinus, radius1 + leftSinus);
  ellipse(width - boobCenterFromBorder, 200, radius1 + rightSinus, radius1 + rightSinus);
  fill(c2);
  ellipse(boobCenterFromBorder, 200, radius2 + leftSinus, radius2 + leftSinus);
  ellipse(width - boobCenterFromBorder, 200, radius2 + rightSinus, radius2 + rightSinus);
  fill(c3);
  ellipse(boobCenterFromBorder, 200, radius3 + leftSinus / 2, radius3 + leftSinus / 2);
  ellipse(width - boobCenterFromBorder, 200, radius3 + rightSinus / 2, radius3 + rightSinus / 2);
}

void mousePressed() {
  // inside left boob?
  if(inCircle(mouseX, mouseY, boobCenterFromBorder, 200, radius1)) {
    boingLeft = 30;
    boingRight = 35;
    pressed = true;
  }
  
  // inside right boob?
  if(inCircle(mouseX, mouseY, width - boobCenterFromBorder, 200, radius1)) {
    boingLeft = 35;
    boingRight = 30;
    pressed = true;
  }
}

void mouseReleased() {
  pressed = false;
}

// test if mx,my is inside a circle cx,cy with diameter
boolean inCircle(float mx, float my, float cx, float cy, float diameter) {
  // max distance inside a circle is always half the diameter
  float distance = dist(mx, my, cx, cy);
  if(distance > diameter / 2) {
    return false;
  } 
  else {
    return true;
  }
}


