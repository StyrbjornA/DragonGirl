
if (crt){
	shader_set(shd_crt);
}
draw_surface(application_surface,0,0);
if (crt){
	shader_reset();
}