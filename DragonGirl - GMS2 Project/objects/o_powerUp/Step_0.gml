if (!detected){
	if (dirChangeCooldown == 0){
		movement = choose(1,-1);
		dirChangeCooldown = 50 + irandom(40);
		moveDist = 30+irandom(50);
	} else{
		dirChangeCooldown --;
	}
	if (moveDist > 0){
	
		facing = movement;
		xOffset = clamp(xOffset+movement,-40,40);
		if (abs(xOffset) == 40){
			movement = -movement;
		}
		moveDist --;
	}
	if (distance_to_object(o_player) < 64){
		detected = true;
	}
	
} else{
	if (decidedDirection == 0){
		moveDist = 0;
		dirChangeCooldown = 11;
		decidedDirection = sign (x - o_player.x);
		xSpeed += decidedDirection*initSpeed;
	} else{
		UpdateActive();
		moveDist ++;
		facing = decidedDirection;
	}
}
