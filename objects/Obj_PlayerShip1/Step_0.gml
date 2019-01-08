/// @description Controls
switch(room){
	case Rm_02_Asteroids1:
		//sprite_index = Spr_PlayerShip_Rocks;
		if (keyboard_check(vk_left)){
			image_angle = image_angle + TurnRate;
		}
		if (keyboard_check(vk_right)){
			image_angle = image_angle - TurnRate;
		}
		if (keyboard_check(vk_up)){
			motion_add(image_angle, Impulse);
		}
		if (keyboard_check(vk_down)){
			motion_add(image_angle, -Impulse);
		}
		if (keyboard_check_pressed(vk_space)){
			var inst;
			inst = instance_create_layer(x, y, "Instances", Obj_Laser1);
			with (inst){
				speed = 6;
				image_angle = other.image_angle;
				direction = other.image_angle;
			}
		}
		if (speed >= MaxSpeed)
		{
			speed = MaxSpeed;
		}
		move_wrap(true,true,sprite_width/2);
		break;
	
	case Rm_01_Pacman1:
		//sprite_index = Spr_PlayerShip_Maze;
		if (keyboard_check(vk_right))
		{
			desired_movement = 1;
		}
		if (keyboard_check(vk_down))
		{
			desired_movement = 2;
		}
		if (keyboard_check(vk_left))
		{
			desired_movement = 3;
		}
		if (keyboard_check(vk_up))
		{
			desired_movement = 4;
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
					if (!place_meeting(x, y + MaxSpeed, Obj_Wall_H) && !place_meeting(x, y + MaxSpeed, Obj_Wall_H_Half) && !place_meeting(x, y + MaxSpeed, Obj_Wall_V))
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
					if (!place_meeting(x, y - MaxSpeed, Obj_Wall_H) && !place_meeting(x, y - MaxSpeed, Obj_Wall_H_Half)&& !place_meeting(x, y - MaxSpeed, Obj_Wall_V))
					{
						current_movement = desired_movement;
					}
					break;
			}
		}	
		//move in direction of current_movement

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
		if (place_meeting(x + sign(hspd), y, Obj_Wall_V))
		{
			while (!place_meeting(x + sign(hspd), y, Obj_Wall_V))
				x += sign(hspd);
				hspd = 0;
		}
		x += hspd;
				
		if (place_meeting(x, y + sign(vspd), Obj_Wall_H))
			{
			while (!place_meeting(x, y + sign(vspd), Obj_Wall_H))
				y += sign(vspd);
				vspd = 0;
		}
		y += vspd;
		move_wrap(true,true,sprite_width/2);
		break;

	case Rm_03_Invaders:
		hspd = keyboard_check(vk_right) - keyboard_check(vk_left);
		x = x + hspd * MaxSpeed * 2;
		if (keyboard_check_pressed(vk_space) && instance_number(Obj_Laser1) <= 0){
			var inst;
			inst = instance_create_layer(x, y, "Instances", Obj_Laser1);
			with (inst){
				speed = 6;
				image_angle = 270;
				direction = 90;
			}
		}
		break;
	case Rm_04_Breakout:
		hspd = keyboard_check(vk_right) - keyboard_check(vk_left);
		if (place_meeting(x + hspd * MaxSpeed * 2, y, Obj_Wall_V_Breakout_Coll))
		{
			hspd = 0;
		}
		x = x + hspd * MaxSpeed * 2;
		break;
}
