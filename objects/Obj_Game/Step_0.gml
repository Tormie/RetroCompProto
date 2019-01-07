if (keyboard_check_pressed(vk_tab)){
	if (room == Rm_02_Asteroids1){
		room_goto(Rm_01_Pacman1);
	}else if (room == Rm_01_Pacman1){
		room_goto(Rm_03_Invaders);
	}else if (room == Rm_03_Invaders){
		room_goto(Rm_04_Breakout);
	}else if (room == Rm_04_Breakout){
		room_goto(Rm_02_Asteroids1);
	}
}

//Check room and behave accordingly
switch (room){
	case Rm_02_Asteroids1:
		//Overhead code for asteroids room
		if (tick_counter >= 120/global.difficulty_rocks){
			var spawn_location = irandom_range(0,3);
			switch (spawn_location){
				case 0:
					instance_create_layer(spawnrockdown_x,spawnrockdown_y,"Instances",Obj_Asteroid1);
					break;
				case 1:
					instance_create_layer(spawnrockup_x,spawnrockup_y,"Instances",Obj_Asteroid1);
					break;
				case 2:
					instance_create_layer(spawnrockleft_x,spawnrockleft_y,"Instances",Obj_Asteroid1);
					break;
				case 3:
					instance_create_layer(spawnrockright_x,spawnrockright_y,"Instances",Obj_Asteroid1);
					break;
			}
			tick_counter = 0;
		}
		tick_counter++;
		break;
	case Rm_01_Pacman1:
		//Overhead code for PACMAN room
		if (global.score_rocks > 0) 
		{
			global.score_rocks -= 0.005;
		}
		global.dotcounter = instance_number(Obj_SmallGreenDot);
		with (Obj_SmallGreenDot) 
		{
			if (visible == 0) global.dotcounter -= 1; 
		}
		if (global.dotcounter == 0)
		{
			with (Obj_PlayerShip1)
			{
				x = room_width/2-16;
				y = 448;
				current_movement = 0;
				desired_movement = 0;
			}
			with (Obj_SmallGreenDot) 
			{
				if (visible == 0) visible = 1; 
			}
			with (Obj_MazeGhost)
			{
				x = startx;
				y = starty;
			}
		}
		break;
	case Rm_03_Invaders:
		//Overhead code for Invaders room
		global.inv_enemycounter = instance_number(Obj_Inv_Enemy1) + instance_number(Obj_Inv_Enemy2) + instance_number(Obj_Inv_Enemy3);
		with (Obj_Inv_Enemy1)
		{
			if (selectable = 1) 
			{
				ds_list_add(global.lst_inv_enemies,id);
			}
			if (visible == 0) global.inv_enemycounter -= 1; 
			if (visible == 1 && global.invdirection == 0 && x <= global.inv_xlimit) global.invdirection = 2;
			if (visible == 1 && global.invdirection == 1 && x >= room_width - global.inv_xlimit) global.invdirection = 2;
		}
		with (Obj_Inv_Enemy2)
		{
			if (visible == 0) global.inv_enemycounter -= 1;
			if (selectable = 1) 
			{
				ds_list_add(global.lst_inv_enemies,id);
			}
			if (visible == 1 && global.invdirection == 0 && x <= global.inv_xlimit) global.invdirection = 2;
			if (visible == 1 && global.invdirection == 1 && x >= room_width - global.inv_xlimit) global.invdirection = 2;
		}
		with (Obj_Inv_Enemy3)
		{
			if (visible == 0) global.inv_enemycounter -= 1;
			if (selectable = 1) 
			{
				ds_list_add(global.lst_inv_enemies,id);
			}
			if (visible == 1 && global.invdirection == 0 && x <= global.inv_xlimit) global.invdirection = 2;
			if (visible == 1 && global.invdirection == 1 && x >= room_width - global.inv_xlimit) global.invdirection = 2;
		}
		var inv_chosen_enemy = irandom_range(0,ds_list_size(global.lst_inv_enemies));
		if (inv_shootticker >= inv_shoottime)
		{
			var inst_en = ds_list_find_value(global.lst_inv_enemies,inv_chosen_enemy)
			global.shootingenemy = inst_en;
			if (inst_en != instance_find(Obj_PlayerShip1,0))
			{
			with (inst_en)
			{
				var inst = instance_create_layer(x,y,"Instances",Obj_Inv_EnemyLaser);
				with (inst)
				{
					direction = 270;
					speed = 3;
				}
			}
			}
			inv_shoottime = irandom_range(60,120);
			inv_shootticker = 0;
		}
		inv_shootticker ++;
		if (global.inv_enemycounter == 0)
		{
			inv_movetime = 60;
			global.invdirection = 1;
			with (Obj_Inv_Enemy1)
			{
				x = startx;
				y = starty;
				visible = 1;
			}
			with (Obj_Inv_Enemy2)
			{
				x = startx;
				y = starty;
				visible = 1;
			}
			with (Obj_Inv_Enemy3)
			{
				x = startx;
				y = starty;
				visible = 1;
			}
		}
		inv_movetime = 1 + (29 / (18 / global.inv_enemycounter))/global.difficulty_inv;
		if (inv_ticker >= inv_movetime)
		{
			switch (global.invdirection)
			{
				case 0:
					with (Obj_Inv_Enemy1)
					{
						x -= global.inv_moveamount;
					}
					with (Obj_Inv_Enemy2)
					{
						x -= global.inv_moveamount;
					}
					with (Obj_Inv_Enemy3)
					{
						x -= global.inv_moveamount;
					}
					inv_prevdir = 0;
					break;
				case 1:
					with (Obj_Inv_Enemy1)
					{
						x += global.inv_moveamount;
					}
					with (Obj_Inv_Enemy2)
					{
						x += global.inv_moveamount;
					}
					with (Obj_Inv_Enemy3)
					{
						x += global.inv_moveamount;
					}
					inv_prevdir = 1;
					break;
				case 2:
					with (Obj_Inv_Enemy1)
					{
						y += global.inv_moveamount;
					}
					with (Obj_Inv_Enemy2)
					{
						y += global.inv_moveamount;
					}
					with (Obj_Inv_Enemy3)
					{
						y += global.inv_moveamount;
					}
					if (inv_prevdir == 0) global.invdirection = 1;
					if (inv_prevdir == 1) global.invdirection = 0;
					break;
			}
			inv_ticker = 0;
		}
		inv_ticker++;
		break;
}
global.difficulty_rocks = 1 + score * 0.001 + global.score_rocks * 0.001;
global.difficulty_maze = 1 + score * 0.001 + global.score_maze * 0.001;
global.difficulty_inv = 1 + score * 0.001 + global.score_inv * 0.001;
global.gameticker++;