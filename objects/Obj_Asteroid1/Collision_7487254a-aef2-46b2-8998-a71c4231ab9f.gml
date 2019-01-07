score += 10;
global.score_rocks += 10;
if (sprite_index == Spr_Asteroid_Sm1){
	with (other){
	   instance_destroy();
    }
	instance_destroy();
}
if (sprite_index == Spr_Asteroid_Lg1){
	repeat(2){
		var inst;
		inst = instance_create_layer(x, y, "Instances", Obj_Asteroid1);
		with (inst){
			sprite_index = Spr_Asteroid_Sm1;
		}
	}
   with (other){
	   instance_destroy();
   }
	instance_destroy();
}