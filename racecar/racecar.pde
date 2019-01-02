class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(0, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
    topspeed = 10;
  }

  void update() {
    applyAcceleration();
    //velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    println(velocity);
  }

  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }
  
  void applyAcceleration() {
    if (key == CODED) {
      if (keyCode == UP) {
        changeSpeed(ACCELERATION);
      } else if (keyCode == DOWN) {
        //decelerate
        changeSpeed(BRAKE);
      } 
      } else {
        changeSpeed(NORMAL);
      }
  }
  
  float ACCELERATION = 0.01;
  float BRAKE = -0.1;
  float NORMAL = -0.00001;
  
  void changeSpeed(float scale) {
    //prevent braking leading to reverse
    if ((scale < 0) && (velocity.x <= 0)) return;
    velocity.add(new PVector(scale, 0));
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

Mover car;


void setup() {
  car = new Mover();
  size(640, 360);
}

void draw() {
  background(255);
  car.update();
  car.checkEdges();
  car.display();
}
