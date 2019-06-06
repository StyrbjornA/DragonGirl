if (global.pauseAction)exit;

ySpeed = min(ySpeed + global.grav,global.maxFallSpeed);
if (ySpeed != 0){
	for (var yStep = 0; yStep < abs(ySpeed);yStep++){
		if (isCollider){
			CheckCollisions();
		}
		if (ySpeed > 0 && !colliding[DIR.down]){
			yPos++;
			y = round(yPos/global.grid);
		} else if (ySpeed < 0 && !colliding[DIR.up]){
			yPos--;
			y = round(yPos/global.grid);
		} else {
			ySpeed = 0;
		}
	}
}
if (xSpeed != 0){
	for (var xStep = 0; xStep < abs(xSpeed);xStep++){
		if (isCollider){
			CheckCollisions();
		}
		if (xSpeed > 0 && !colliding[DIR.right]){
			xPos++;
			x = round(xPos/global.grid);
		} else if (xSpeed < 0 && !colliding[DIR.left]){
			xPos--;
			x = round(xPos/global.grid);
		} else {
			xSpeed = 0;
		}
	}
}