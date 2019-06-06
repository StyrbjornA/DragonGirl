var spriteFrame = 0;
if (dirChangeCooldown > 10){
	spriteFrame = (moveDist/10) mod 2;
} 
draw_sprite_ext(sprite_index,spriteFrame,x + floor(xOffset*.1),y, facing,1,0,c_white,1);

if (detected){
	if (moveDist < 60){
		var drawBox = true;
		if (((moveDist) mod 3) == 0 && moveDist < 20){
			drawBox = false;
		}
		if (drawBox){
			draw_sprite_ext(s_exclamationBox,0,x,y-16, facing,1,0,c_white,1);
		}
	}
}