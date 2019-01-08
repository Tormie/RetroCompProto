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

hspd = lengthdir_x(speed, direction);
vspd = lengthdir_y(speed, direction);

//Horizontal bounce
if(place_meeting(x + hspd, y, Obj_Wall_V_Breakout_Coll))
    direction = -direction + 180;
	
//Horizontal bounce
if(place_meeting(x + hspd, y, Obj_Breakout_Block1))
{
	direction = -direction;
	inst = instance_nearest(x,y,Obj_Breakout_Block1);
	with (inst)
	{
		alarm[0] = 1;
	}
	
}
	

//Vertical bounce
if(place_meeting(x, y + vspd, Obj_Wall_H_Breakout_Coll))
    direction = -direction;
	
//Vertical bounce
if(place_meeting(x, y + vspd, Obj_Breakout_Block1))
{
	direction = -direction;
	inst = instance_nearest(x,y,Obj_Breakout_Block1);
	with (inst)
	{
		alarm[0] = 1;
	}
	
}
	
//Vertical bounce
if(place_meeting(x, y + vspd, Obj_PlayerShip1) && stuckToPlayer == 0)
    direction = -direction;



if (place_meeting(x + hspeed, y, Obj_Wall_V_Breakout_Coll))
{
	audio_play_sound(Snd_Bounce,1,false);
}

if (place_meeting(x, y + vspeed, Obj_PlayerShip1) && stuckToPlayer == 0)
{
	audio_play_sound(Snd_Bounce,1,false);
}

if (place_meeting(x, y + vspeed, Obj_Wall_H_Breakout_Coll))
{
	audio_play_sound(Snd_Bounce,1,false);
}