public float t;
public float h;

public void setup() {
	size(640, 480);
	background(200);
	colorMode(HSB);
	rectMode(CENTER);
	noFill();
	t = 0;
}

public void draw() {
	background(200);
	h = map(noise(t), 0, 1, -100, 255);
	drawCircle(width / 2, height / 2, 600);
	t += 0.005;
}

public void drawCircle(int x, int y, int r) {
	float h1 = h;
	float s1 = map(noise(x, t), 0, 1, 0, 255);
	float b1 = 255;
	stroke(h1, s1, b1);
	ellipse(x, y, r, r);
	noStroke();
	fill(s1, h1, b1, 50);
	rect(x, y, r * noise(x, t) * 2, r * noise(y, t) * 2);
	noFill();
	int r2 = r / 2;
	if (r2 >= 10) {
		drawCircle(x - r2, y, r2);
		drawCircle(x + r2, y, r2);
		drawCircle(x, y - r2, r2);
		drawCircle(x, y + r2, r2);
	}
}