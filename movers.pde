class Mover {
  PVector location;
  PVector velocity;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2), random(-2, 2));
  }

  void update() {
    location.add(velocity);
  }

  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }

}

Mover mover1;
Mover mover2;

void setup() {
  mover1 = new Mover();
  mover2 = new Mover();
}

void draw() {
  background(255);
  mover1.update();
  mover1.checkEdges();
  mover1.display();
  mover2.update();
  mover2.checkEdges();
  mover2.display();
}
