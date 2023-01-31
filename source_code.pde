import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;


//famous constant
float a = 10;
float b = 28;
float c = 8.0/3.0;

float dt = 0.01;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup(){
  size(1200,1000,P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
}

void draw(){
  
  background(0);
  //grado di cambiamento ogni dt (tot di tempo)
  float dx = (a * (y-x))*dt;
  float dy = (x * (b - z)-y)*dt;
  float dz = (x * y - c * z)*dt;
  
  //updating x,y,z
  x = x + dx;
  y = y + dy; 
  z = z + dz;
  
  points.add(new PVector(x,y,z));
  
  translate(0, 0, -80);
  scale(4);
  stroke(255);
  noFill();
  
  float hu = 0;
  beginShape();
  for(PVector v : points){
    stroke(hu,255,255);
    vertex(v.x,v.y,v.z);
   
    hu+=0.35;
    if(hu>255)  hu = 0;
  }
  endShape();
}
