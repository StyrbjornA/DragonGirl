colliding[DIR.up] = false;
colliding[DIR.right] = false;
colliding[DIR.down] = false;
colliding[DIR.left] = false;

with (o_tile){
	//checking horizontal collisions
	if (bbox_bottom > other.bbox_top && bbox_top < other.bbox_bottom){	
		if (bbox_left == other.bbox_right){
			other.colliding[DIR.right] = true;
		}
		if (bbox_right == other.bbox_left){
			other.colliding[DIR.left] = true;
			
		}
	}
	//checking vertical collisions
	if (bbox_right > other.bbox_left && bbox_left < other.bbox_right){	
		if (bbox_top == other.bbox_bottom){
			other.colliding[DIR.down] = true;
		}
		if (bbox_bottom == other.bbox_top){
			other.colliding[DIR.up] = true;
		}
		
	}
}