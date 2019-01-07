if (visible == 1)
{
	score += 30;
	global.score_inv += 30;
	with (other){
		instance_destroy();
	}
	visible = 0;
	x = -500;
	y = -500;
}
