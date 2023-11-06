float ballPosX;
float ballPosY;
float ballSpeedX;
float ballSpeedY;
float paddleX;
float paddleWidth = 80;

int score = 0;
boolean gameOver = false;

void setup() {
  size(600, 400);
  textAlign(CENTER, CENTER);
  textSize(32);
  resetGame();
}

void draw() {
  background(173, 216, 230);
  
  if (!gameOver) {
    updateBall();
    checkCollision();
    drawPaddle();
    // Draw the ball
    fill(0);
    ellipse(ballPosX, ballPosY, 20, 20);
  } else {
    displayGameOver();
  }
}

void updateBall() {
  ballPosX += ballSpeedX;
  ballPosY += ballSpeedY;
}

void checkCollision() {
  if (ballPosY >= height) {
    gameOver = true;
  } else if (ballPosY <= 0) {
    ballSpeedY *= -1;
  } else if (ballPosY >= height - 20 && ballPosX >= paddleX && ballPosX <= paddleX + paddleWidth) {
    ballSpeedY *= -1;
    score++;
  } else if (ballPosX <= 0 || ballPosX >= width) {
    ballSpeedX *= -1;
  }
}

void drawPaddle() {
  fill(0, 0, 0);
  rect(paddleX, 380, paddleWidth, 20);
}

void displayGameOver() {
  fill(0);
  text("Game Over!", width / 2, height / 2 - 20);
  text("Score: " + score, width / 2, height / 2 + 20);
  text("Click to play again", width / 2, height / 2 + 60);
}

void resetGame() {
  ballPosX = 300;
  ballPosY = 100;
  ballSpeedX = 3;
  ballSpeedY = 3;
  paddleX = 260;
  score = 0;
  gameOver = false;
}

void keyPressed() {
  if (key == 'a' && paddleX > 0) {
    paddleX -= 10;
  } else if (key == 'd' && paddleX + paddleWidth < width) {
    paddleX += 10;
  }
}

void mousePressed() {
  if (gameOver) {
    resetGame();
  }
}
