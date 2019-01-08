//set random directions
switch (random_direction)
{
	case 0:
		desired_movement = 1;
		break;
	case 1:
		desired_movement = 2;
		break;
	case 2:
		desired_movement = 3;
		break;
	case 3:
		desired_movement = 4;
		break;
}

//initial var set

rightfree = 0;
leftfree = 0;
upfree = 0;
downfree = 0;

//Check if directions are free.
if (delaytime >= 30)
{
	/*if (!place_meeting(x + MaxSpeed, y, Obj_Wall_V)) rightfree = 1;
	if (!place_meeting(x - MaxSpeed, y, Obj_Wall_V)) leftfree = 1;
	if (!place_meeting(x, y - MaxSpeed, Obj_Wall_H) && !place_meeting(x, y - MaxSpeed, Obj_Wall_H_Half)) upfree = 1;
	if (!place_meeting(x, y + MaxSpeed, Obj_Wall_H) && !place_meeting(x, y + MaxSpeed, Obj_Wall_H_Half)) downfree = 1;*/
	if (place_meeting(x + MaxSpeed, y, Obj_Wall_V)) rightfree = 0; else rightfree = 1;
	if (place_meeting(x - MaxSpeed, y, Obj_Wall_V)) leftfree = 0; else leftfree = 1;
	if (place_meeting(x, y - MaxSpeed, Obj_Wall_H) && !place_meeting(x, y - MaxSpeed, Obj_Wall_H_Half)) upfree = 0; else upfree = 1;
	if (place_meeting(x, y + MaxSpeed, Obj_Wall_H) && !place_meeting(x, y + MaxSpeed, Obj_Wall_H_Half)) downfree = 0; else downfree = 1;

//If one (or more) direction is free and it's not current, choose between current and potential. -- THIS MUST HAPPEN AT ONCE, not after one another.

	switch (current_movement)
	{
	case 1:
		if (leftfree && upfree && downfree) desired_movement = choose(1,2,4);
		
		if (leftfree && upfree && !downfree) desired_movement = choose(1,4);
		if (leftfree && !upfree && downfree) desired_movement = choose(1,2);
		if (!leftfree && upfree && downfree) desired_movement = choose(1,2,4);
		
		if (!leftfree && upfree && !downfree) desired_movement = choose(1,4);
		if (!leftfree && !upfree && downfree) desired_movement = choose(1,2);
		delaytime = 0;
		break;
	case 2:
		if (rightfree && leftfree && upfree) desired_movement = choose (1,2,3);
		
		if (rightfree && leftfree && !upfree) desired_movement = choose (1,2,3);
		if (rightfree && !leftfree && upfree) desired_movement = choose (1,2);
		if (!rightfree && leftfree && upfree) desired_movement = choose (2,3);
		
		if (rightfree && !leftfree && !upfree) desired_movement = choose (1,2);
		if (!rightfree && leftfree && !upfree) desired_movement = choose (2,3);
		delaytime = 0;
		break;
	case 3:
		if (rightfree && downfree && upfree) desired_movement = choose (2,3,4);
		
		if (rightfree && downfree && !upfree) desired_movement = choose (2,3);
		if (rightfree && !downfree && upfree) desired_movement = choose (3,4);
		if (!rightfree && downfree && upfree) desired_movement = choose (2,3,4);
		
		if (!rightfree && downfree && !upfree) desired_movement = choose (2,3);
		if (!rightfree && !downfree && upfree) desired_movement = choose (3,4);
		delaytime = 0;
		break;
	case 4:
		if (rightfree && downfree && leftfree) desired_movement = choose (1,3,4);
		
		if (rightfree && downfree && !leftfree) desired_movement = choose (1,4);
		if (rightfree && !downfree && leftfree) desired_movement = choose (1,3,4);
		if (!rightfree && downfree && leftfree) desired_movement = choose (3,4);
		
		if (rightfree && !downfree && !leftfree) desired_movement = choose (1,4);
		if (!rightfree && !downfree && leftfree) desired_movement = choose (3,4);
		delaytime = 0;
		break;		
	}
}




//change current_movement to desired_movement if no blocking objects
if (desired_movement != current_movement)
{
	switch(desired_movement)
	{
		case 1:
			if (!place_meeting(x + MaxSpeed, y, Obj_Wall_V))
			{
				current_movement = desired_movement;
			}
			break;
		case 2:
			if (!place_meeting(x, y + MaxSpeed, Obj_Wall_H) && !place_meeting(x, y + MaxSpeed, Obj_Wall_H_Half))
			{
				current_movement = desired_movement;
			}
			break;			
		case 3:
			if (!place_meeting(x - MaxSpeed, y, Obj_Wall_V))
			{
				current_movement = desired_movement;
			}
			break;			
		case 4:
			if (!place_meeting(x, y - MaxSpeed, Obj_Wall_H)&& !place_meeting(x, y - MaxSpeed, Obj_Wall_H_Half))
			{
				current_movement = desired_movement;
			}
			break;
	}
}	
//set speed for current movement
switch(current_movement)
	{
		case 0:
			hspd = 0;
			vspd = 0;
			break;
		case 1:
			hspd = MaxSpeed;
			vspd = 0;
			break;
		case 2:
			hspd = 0;
			vspd = MaxSpeed;
			break;
		case 3:
			hspd = -MaxSpeed;
			vspd = 0;
			break;
		case 4:
			hspd = 0;
			vspd = -MaxSpeed;
			break;
	}
	
//eventual movement
if (place_meeting(x + hspd, y, Obj_Wall_V) && hspd != 0)
	{
		while (!place_meeting(x + sign(hspd), y, Obj_Wall_V))
			x += sign(hspd);
			hspd = 0;
			random_direction = irandom_range(0,4);
	}
x += hspd;
				
if (place_meeting(x, y + vspd, Obj_Wall_H) && vspd != 0)
	{
		while (!place_meeting(x, y + sign(vspd), Obj_Wall_H))
			y += sign(vspd);
			vspd = 0;
			random_direction = irandom_range(0,4);
	}
y += vspd;
move_wrap(true,true,sprite_width/2);
delaytime++;