var drawX = x;
var drawY = y;
if (bouncing > 0){
	
	bouncing = max (0, bouncing - 0.4);
	drawY = drawY - sin(bouncing)*5;
}

draw_sprite(sprite_index,image_index,drawX,drawY);