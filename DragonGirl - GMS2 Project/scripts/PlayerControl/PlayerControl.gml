
var currentMaxSpeed = maxWalkSpeed;

if (c_controls.controls[CTRL.action1Held]){
	currentMaxSpeed = currentMaxSpeed * 5 / 3;
} else{
	if (xSpeed > currentMaxSpeed){
		xSpeed = max (currentMaxSpeed,xSpeed - runDeceleration);
	}
	if (xSpeed < -currentMaxSpeed){
		xSpeed = min (-currentMaxSpeed,xSpeed + runDeceleration);
	}
}



if (c_controls.controls[CTRL.rightHeld] && xSpeed < currentMaxSpeed){
	xSpeed += runAcceleration;
} else if (xSpeed > 0){
	var brakeSpeed = runDeceleration;
	if (!colliding[DIR.down]){
		brakeSpeed = brakeSpeed * .1;
	}
	xSpeed = max (0, xSpeed - brakeSpeed);
}
if (c_controls.controls[CTRL.leftHeld] && xSpeed > -currentMaxSpeed){
	xSpeed -= runAcceleration;
} else if (xSpeed < 0){
	var brakeSpeed = runDeceleration;
	if (!colliding[DIR.down]){
		brakeSpeed = brakeSpeed * .1;
	}
	xSpeed = min (0, xSpeed + brakeSpeed);
}
if (colliding[DIR.down]){
	groundTouchCooldown = 3;
} else{
	groundTouchCooldown = max (0, groundTouchCooldown - 1);
}
if (c_controls.controls[CTRL.action2Pressed] && groundTouchCooldown > 0){
	if (abs(xSpeed <= maxWalkSpeed)){
		groundTouchCooldown = 0;
		ySpeed = jumpHeight;
	} else{
		groundTouchCooldown = 0;
		ySpeed = jumpHeight*1.12;
	}
}
if (!c_controls.controls[CTRL.action2Held] && !colliding[DIR.down] && ySpeed < 0){
	ySpeed += 2.5 * global.grav;
}