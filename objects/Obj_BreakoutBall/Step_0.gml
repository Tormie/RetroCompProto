if (stuckToPlayer == 1)
{
	x = instance_find(Obj_PlayerShip1,0).x;
}
if (keyboard_check(vk_space) && stuckToPlayer == 1)
{
	stuckToPlayer = 0;
	speed = initialSpeed;
}
if (direction >= 0 && direction < 90)
{
	vsign = 1;
}
if (direction >= 90 && direction < 180)
{
	vsign = -1;
}
if (direction >= 180 && direction < 270)
{
	vsign = 1;
}
if (direction >= 270 && direction < 360)
{
	vsign = -1;
}



/*hspd = lengthdir_x(speed, direction);
vspd = lengthdir_y(speed, direction);
draw_set_font(Fnt_Text2);
draw_set_color(c_white);
draw_text(x,y-20,string(direction));
draw_set_font(Fnt_Text);*/

if (place_meeting(x + hspeed, y, Obj_Wall_V_Breakout_Coll))
{
	audio_play_sound(Snd_Bounce,1,false);
}

if (place_meeting(x, y + vspeed, Obj_PlayerShip1) && stuckToPlayer == 0)
{
	audio_play_sound(Snd_Bounce,1,false);
}

/*if (place_meeting(x, y + vspd, Obj_PlayerShip1) && stuckToPlayer == 0 && collisionticker > 10)
{
	direction = direction + 180 - ((direction % 90) * 2);
	audio_play_sound(Snd_Bounce,1,false);
	collisionticker = 0;
}*/

if (place_meeting(x, y + vspeed, Obj_Wall_H_Breakout_Coll))
{
	audio_play_sound(Snd_Bounce,1,false);
}

move_bounce_solid(false);