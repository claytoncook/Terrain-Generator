int col, row;
int scl = 10;
int h = 500;
int w = 800;

float forward;

float[][] terrain;

void setup() {
  size(900, 900, P3D);
  col = h/scl;
  row = w/scl;
  terrain = new float[row][col];
};

void draw() {
  forward -= 0.05;

  float yOff = forward;
  for (int y = 0; y < col; y++) {
    float xOff = 0;
    for (int x = 0; x < row; x++) {
      terrain[x][y] = map(noise(xOff, yOff), 0, 1, 0, 250);
      xOff += 0.1;
    }
    yOff += 0.1;
  }

  background(0);
  stroke(255);
  strokeWeight(0.5);
  noFill();

  translate(height/2, width/2, -500);
  rotateX(PI/3);

  translate(-w/2, 500, 250);

  for (int y = 0; y < col-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < row; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}
