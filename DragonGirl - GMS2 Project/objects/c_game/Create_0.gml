global.grav = 2.7;
global.grid = 16;
global.maxFallSpeed = 60;
global.pauseAction = false;
instance_create_layer(0,0,"Controllers",c_graphics);
instance_create_layer(0,0,"Controllers",c_controls);

enum DIR{
	up,
	right,
	down,
	left
}