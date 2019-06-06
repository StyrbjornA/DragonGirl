if (!global.pauseAction){
	if (playerSprite == s_playerTurn && xSpeed > 0){
		facing = -1;	
	}
	else if (playerSprite == s_playerTurn && xSpeed < 0){
		facing = 1;	
	} else{
		playerSprite = s_playerStand;
		if (powerLevel == 1){
			playerSprite = s_playerStand_large;
		}
	}
	playerFrame = 0;
	if (colliding[DIR.down]){
		if (xSpeed != 0){
			animFrame += max(0.1,abs(xSpeed)/80);
			if (animFrame > 4){
				animFrame = animFrame - 4;
			}
			playerSprite = s_playerRun;
			if (powerLevel == 1){
				playerSprite = s_playerStand_large;
			}
			playerFrame = animFrame;
			if (c_controls.controls[CTRL.leftHeld] || c_controls.controls[CTRL.rightHeld]){
				if ((xSpeed > 0 ||  c_controls.controls[CTRL.rightHeld]) ||xSpeed < 0 ||  c_controls.controls[CTRL.leftHeld]){
					facing = sign(xSpeed);
				}
			}
		} else{
			animFrame = 0;
		}
		if (xSpeed > 0 && c_controls.controls[CTRL.leftHeld] && !c_controls.controls[CTRL.rightHeld]){
			animFrame = 0;
			playerSprite = s_playerTurn;
			if (powerLevel == 1){
				playerSprite = s_playerStand_large;
			}
		}
		if (xSpeed < 0 && c_controls.controls[CTRL.rightHeld] && !c_controls.controls[CTRL.leftHeld]){
			animFrame = 0;
			playerSprite = s_playerTurn;
			if (powerLevel == 1){
				playerSprite = s_playerStand_large;
			}
		}
	} else{
		playerSprite = s_playerJump;
		if (powerLevel == 1){
			playerSprite = s_playerStand_large;
		}
	}
	draw_sprite_ext(playerSprite,playerFrame,x,y,facing,1,0,c_white,1);
} else{
	
	if (gettingPowerup > 0){
		gettingPowerup ++;
		playerSprite = s_playerEating;
		if (gettingPowerup > 40 && gettingPowerup < 100){
			if (floor(gettingPowerup/5) mod 2 == 0){
				playerSprite = s_playerFlying_large;
			}
		}
		if (gettingPowerup > 100){
			playerSprite = s_playerFlying_large;
		}
		var pFrame = floor(current_time/200) mod 2;
		if (gettingPowerup > 110 && pFrame == 0){
			pFrame = 0;
		}
		draw_sprite_ext(playerSprite,pFrame,x,y-4,facing,1,0,c_white,1);
		var biteFrame = (gettingPowerup-30)/4;
		if (biteFrame < 4){
			draw_sprite_ext(s_virginCaught,current_time/100 mod 2,floor(powerUpX),floor(powerUpY),1,1,0,c_white,1);
		}
		powerUpX = lerp(powerUpX,x,0.4);
		powerUpY = lerp(powerUpY,y+4,0.4)
		
		if (biteFrame >= 0 && biteFrame < 12){
			draw_sprite_ext(s_bite,biteFrame,x,y+2,1,1,0,c_white,1);
		}
		if (gettingPowerup > 120){
			gettingPowerup = 0;
			powerLevel = 1;
			global.pauseAction = false;
		}
	} else{
		draw_sprite_ext(playerSprite,playerFrame,x,y,facing,1,0,c_white,1);
	}
}