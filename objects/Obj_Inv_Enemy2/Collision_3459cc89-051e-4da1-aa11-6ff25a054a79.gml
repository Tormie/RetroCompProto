if (visible == 1)
{
	score += 20;
	global.score_inv += 20;
	with (other){
		instance_destroy();
	}
	visible = 0;
	x = -500;
	y = -500;
}
