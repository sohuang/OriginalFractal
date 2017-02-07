public float t;
public float h;

public void setup() {
	size(640, 480);
	background(200);
	colorMode(HSB);
	noFill();
	t = 0;
}

public void draw() {
	background(200);
	h = map(noise(t), 0, 1, -100, 255);
	drawCircle(width / 2, height / 2, 500);
	t += 0.005;
}

public void drawCircle(int x, int y, int r) {
	stroke(h, map(noise(x, t), 0, 1, 0, 255), 255);
	ellipse(x, y, r, r);
	int r2 = r / 2;
	if (r2 >= 10) {
		drawCircle(x - r2, y, r2);
		drawCircle(x + r2, y, r2);
		drawCircle(x, y - r2, r2);
		drawCircle(x, y + r2, r2);
	}
}