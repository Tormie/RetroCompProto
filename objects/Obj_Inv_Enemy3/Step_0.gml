if (visible = 1 && !place_meeting(x, y+64, Obj_Inv_Enemy2) && !place_meeting(x, y+128, Obj_Inv_Enemy1) && !place_meeting(x, y+192, Obj_Inv_Enemy1)) 
{
	selectable = 1;
} else
{
	selectable = 0;
}