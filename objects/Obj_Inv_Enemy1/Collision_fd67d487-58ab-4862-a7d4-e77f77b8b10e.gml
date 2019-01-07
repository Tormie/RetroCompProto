if (visible == 1)
{
	score += 10;
	global.score_inv += 10;
	with (other){
		instance_destroy();
	}
	visible = 0;
	x = -500;
	y = -500;
}
