/// @description Insert description here
// You can write your code in this editor
current_movement = 0;
desired_movement = 0;

switch(room){
	case Rm_02_Asteroids1:
		sprite_index = Spr_PlayerShip_Rocks;
		solid = true;
		break;
	case Rm_01_Pacman1:
		sprite_index = Spr_PlayerShip_Maze;
		solid = false;
		break;
	case Rm_03_Invaders:
		sprite_index = Spr_PlayerShip1;
		solid = true;
		break;
	case Rm_04_Breakout:
		sprite_index = Spr_PlayerShip_Breakout;
		solid = true;
		break;
}