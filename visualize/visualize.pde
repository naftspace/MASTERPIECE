ArrayList<Float> x_angles, y_angles, z_angles, rocket_heights;
boolean empty;
int loop_count;
int rocket_height = 190;

void setup() {
  size(640, 480, P3D);

  empty = false;
  loop_count = 0;

  x_angles = new ArrayList<Float>();
  y_angles = new ArrayList<Float>();
  z_angles = new ArrayList<Float>();
  rocket_heights = new ArrayList<Float>();

  load_datas();
  frameRate(20);
}

void draw() {
  background(135, 206, 235);
  lights();
  pushMatrix();
  rotateX(90);
  noStroke();
  
  int index = loop_count % rocket_heights.size();
  
  // you can choose translation or rotation
  //float z_translate = rocket_heights.get(index)*100;  // watch translation
  float z_translate = 0.0;  // watch rotation
  

  camera(
    0,200, 200, 
    0, 0, z_translate , 
    0, 0, -1
    );

  if ( empty ) {
    stroke(0, 255, 0);
    fill(0, 255, 0);
    textSize(10);
    textAlign(CENTER);
    text("error: file not found", 0, 0);
    return;
  }
  
  // draw ground
  beginShape();
  fill(0, 255, 30);
  vertex(-1000, -1000, -rocket_height/2);
  vertex(-1000, 1000, -rocket_height/2);
  vertex(1000, 1000, -rocket_height/2);
  vertex(1000, -1000, -rocket_height/2);
  endShape();
  
  // translate rockets
  translate(0, 0, z_translate );
  
  pushMatrix();
  // rotate the axis
  rotateZ(z_angles.get(index));
  rotateY(y_angles.get(index));
  rotateX(x_angles.get(index));
  
  // draw rocket( parameter: see definition of this function )
  drawRocket(20, 10, rocket_height, 20, 40, 0.5, 30);
  popMatrix();

  //saveFrame("frame/####.jpeg");
  popMatrix();
  loop_count++;
}