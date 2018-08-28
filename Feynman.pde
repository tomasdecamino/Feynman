/* @author: Tomas de-Camino-Beck
 @version: 1.1 Aug 2018
 @company www.funcostarica.org
 */

float d=300;
float r=d/2;
PVector p1 = new PVector(105, 0, 0);
float a=0.0;
float inc=PI/501;

void setup() {
  size(600, 600);
  smooth(8);
  background(0);
}

void draw() {
  //background(0,10);
  //fill(0,100);
  //rect(-1,-1,width+1,height+1);
  stroke(255, 100);
  noFill();
  PVector p2 = new PVector(r*cos(a), r*sin(a), 0);
  int sign = Integer.signum((int)(p2.y-p1.y));
  float dist = dist(p2.x, p2.y, p1.x, p1.y);
  float p1Ang =sign*acos((p2.x-p1.x)/dist);
  //text(sign,30,30);
  //text((p2.y-p1.y)/dist,30,60);
  PVector midPoint = new PVector((p2.x-p1.x)/2+p1.x, (p2.y-p1.y)/2, 0);
  strokeWeight(1);
  pushMatrix();
  translate(width/2, height/2);
  ellipse(0, 0, d, d);
  strokeWeight(5);

  strokeWeight(1);
  //lineAng(p1.x,p1.y, dist,p1Ang);
  line(p1.x, p1.y, p2.x, p2.y);
  //line(0,0,p2.x,p2.y);
  strokeWeight(3);
  PVector p3 = new PVector();
  point(midPoint.x, midPoint.y);
  lineAng(midPoint.x, midPoint.y, dist/2, -HALF_PI+p1Ang);
  point(0, 0);
  point(p1.x, p1.y);
  popMatrix();
  a+=inc;
  //saveFrame("frames/####.jpg");
}

void lineAng(float x, float y, float len, float ang) {
  pushMatrix();
  translate(x, y);
  rotate(ang);
  line(-len, 0, len, 0);
  popMatrix();
}
