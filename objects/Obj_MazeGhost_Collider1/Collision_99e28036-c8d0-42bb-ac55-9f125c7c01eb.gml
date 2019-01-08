if (CoupledGhost.vulnerable = 0)
{
	lives -= 1;
	with (Obj_PlayerShip1){
		x = room_width/2-16;
		y = 448;
		current_movement = 0;
		desired_movement = 0;
	}
	with (CoupledGhost)
	{
		x = startx;
		y = starty;
	}
	x = CoupledGhost.startx;
	y = CoupledGhost.starty;
}