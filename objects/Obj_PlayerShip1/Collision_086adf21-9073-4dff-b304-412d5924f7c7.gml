lives -= 1;
x = room_width/2;
y = room_height/2;
with (other)
{
	if (sprite_index == Spr_Asteroid_Sm1)
	{
		instance_destroy();
	}
	if (sprite_index == Spr_Asteroid_Lg1)
	{
		repeat(2)
		{
			var inst;
			inst = instance_create_layer(x, y, "Instances", Obj_Asteroid1);
			with (inst)
			{
				sprite_index = Spr_Asteroid_Sm1;
			}
		}
   }
	instance_destroy();
}
