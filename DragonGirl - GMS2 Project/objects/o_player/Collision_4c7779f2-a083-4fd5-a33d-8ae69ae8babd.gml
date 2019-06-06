if (collision_line(x,y,x,-8,other,0,0)){
	with (other){
		if (bouncing == 0){
			bouncing = pi;
			hitBlock = true;
		}
	}
}
if (!hitBlock){
	if (collision_line(x+3,y,x+3,-8,other,0,0)){
		with (other){
			if (bouncing == 0){
				bouncing = pi;
				hitBlock = true;
			}
		}
	}
}
if (!hitBlock){
	if (collision_line(x-3,y,x-3,-8,other,0,0)){
		with (other){
			if (bouncing == 0){
				bouncing = pi;
				hitBlock = true;
			}
		}
	}
}
