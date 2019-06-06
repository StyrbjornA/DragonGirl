if (!global.pauseAction){
	PlayerControl();

	UpdateActive();
}

with (c_graphics){
	var camX = o_player.x - window_width/2;
	var camY = o_player.y - window_height/2;

	camX = clamp(camX,leftLimit,room_width-window_width);
	camY = clamp(camY,0,room_height-window_height);
	camera_set_view_pos(view_camera[0],camX,camY);
	leftLimit = camX;
	if (other.x < leftLimit+4){
		
		other.x = leftLimit+4;
		with (other){
			CheckCollisions();
		}
		other.xPos = other.x * global.grid;
		if (other.xSpeed < 0){
			if (c_controls.controls[CTRL.rightHeld]){
				other.xSpeed = 0;
			}
			other.xSpeed = max(other.xSpeed,-other.maxWalkSpeed/2);
		}
	}
}
if (ySpeed > 0){
	hitBlock = false;
}