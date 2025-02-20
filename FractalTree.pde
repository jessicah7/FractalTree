private double fractionLength = 0; 
private int smallestBranch = 10; 
private double branchAngle = .5;  
private double treeAngle = Math.PI/2;

public void setup() {   
  size(640,500);    
} 
public void draw(){   
  background(211, 225, 235);
  strokeWeight(3);
  stroke(135, 99, 58);
  line(320,550,320,380);  
  fill(255);
  strokeWeight(0);
  rect(0, 450, 640, 100);
  strokeWeight(1);
  drawBranches(320, 380, 100, treeAngle);
} 

public void keyPressed() {
  if(keyCode == UP)
    fractionLength+=0.01;
  if(keyCode == DOWN)
    fractionLength-=0.1;
  if(keyCode == LEFT)
    treeAngle-=0.01;
  if(keyCode == RIGHT)
    treeAngle+=0.01;
    
  if(fractionLength > 0.85 || fractionLength < 0)
    fractionLength = 0.5;
  if(treeAngle < 5*Math.PI/4 || treeAngle > 5.492388962950331)
    treeAngle = 3*Math.PI/2;
}

public void drawBranches(int x,int y, double branchLength, double angle) {   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if (branchLength < 20) {
    stroke(64, 113, 34);
  }
  
  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
