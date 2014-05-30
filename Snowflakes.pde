int n_flakes = 150;
Flake[] flake = new Flake[n_flakes];
long time = 0;

void setup() {
  size(800, 600); 
  for (int i = 0; i < n_flakes; i++) {
    flake[i] = new Flake();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < n_flakes; i++) {
    flake[i].shaking();
    flake[i].falling();
    flake[i].render();
    flake[i].checkLimits();
  }
}

class Flake {
  float x, y, frequency;
  float c_x, c_shake_limit;
  boolean s = false;
  boolean personality;
  Flake() {
    c_x = random(780)+10;
    x = c_x;
    c_shake_limit = ceil((random(10000))/100)+15;
    y = (random(1000)+5)*-1;
    frequency = (random(100))/100;
    personality = random(1) > .5? true : false;
  }

  public void render() {
    fill(#EEEEEE);
    strokeWeight(2);
    stroke(#DDDDDD);    
    ellipse(x, y, 2, 2);
  }

  public void shaking() {
    s = (x == c_x+c_shake_limit) || (x == c_x-c_shake_limit) ? !s : s;
    if (personality) {
      x += s ? frequency*-1 : frequency;
    } else {
      x += s ? frequency : frequency*-1;
    }
  }

  void falling() {
    y++;
  }

  void checkLimits() {
    if (y > 800) {
      y = (random(1000)+5)*-1;
      x = c_x;
    }
  }
}

