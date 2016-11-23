void drawRocket(
  int sides, int rocket_r, int rocket_h, 
  int fin_w, int fin_h, float fin_ratio, 
  int nose_h) {
  /* draw rocket at (0,0,0) */

  fill(200);  // set color: gray

  // body
  drawCylinder(sides, rocket_r, rocket_h);
  pushMatrix();
  rotateZ(PI/4);
  // draw fins
  for (int i = 0; i < 4; i++ ) {
    rotateZ(PI/2);
    drawFin(fin_w, fin_h, rocket_r, rocket_h, fin_ratio);
  }
  popMatrix();
  // draw nose cone
  drawNoseCone(rocket_r, rocket_h, nose_h, sides);
}

void drawNoseCone(int r, int h, int nose_h, int sides) {
  /* draw nose cone */
  float angle = 360 / sides;
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, h/2 );
    vertex( 0, 0, h/2+nose_h );
  }
  endShape(CLOSE);
}

void drawFin(int fin_w, int fin_h, int r, int h, float ratio) {
  /* draw fin (trapezoid) */
  beginShape();
  vertex(r, 0, -h/2);
  vertex(r+fin_w, 0, -h/2);
  vertex(r+fin_w, 0, -h/2+fin_h*ratio);    // ratio is "taper rato of fin"
  vertex(r, 0, -h/2+fin_h);
  endShape(CLOSE);
}

void drawCylinder(int sides, float r, float h) {
  /* draw clinder: http://vormplus.be/blog/article/drawing-a-cylinder-with-processing */

  float angle = 360 / sides;
  float halfHeight = h / 2;

  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, halfHeight);
    vertex( x, y, -halfHeight);
  }
  endShape(CLOSE);
} 