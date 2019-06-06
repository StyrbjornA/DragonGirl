if (collision_line(x,y,x + 6,y,o_tile,0,0)){
	xSpeed = -initSpeed;
	decidedDirection = sign(xSpeed);
}
if (collision_line(x,y,x - 6,y,o_tile,0,0)){
	xSpeed = initSpeed;
	decidedDirection = sign(xSpeed);
}