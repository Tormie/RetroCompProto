draw_text(20,0, "SCORE: "+string(score));
draw_text(20,20, "LIVES: "+string(lives));
draw_text(20,40, string(inv_movetime));
draw_text(200,0, "Rocks Diff: "+string(global.difficulty_rocks));
draw_text(200,20, "Maze Diff: "+string(global.difficulty_maze));
draw_text(200,40, "Inv Diff: "+string(global.difficulty_inv));
if (room = Rm_02_Asteroids1) draw_text(400,0, "Rocks count: "+string(instance_number(Obj_Asteroid1)));
if (room = Rm_01_Pacman1) draw_text(400,0, "Dots count: "+string(global.dotcounter));
draw_text(600,0, "GlobalScoreRocks: "+string(global.score_rocks));
draw_text(600,20, "GlobalScoreMaze: "+string(global.score_maze));
draw_text(600,40, "GlobalScoreInv: "+string(global.score_inv));
/*draw_text(390,520, +string(global.shootingenemy));
draw_text(390,540, +string(instance_find(Obj_PlayerShip1,0)));

draw_set_font(Fnt_Text2);
for (i=0; i <= ds_list_size(global.lst_inv_enemies); i++)
{
	if (ds_list_find_value(global.lst_inv_enemies,i) == instance_find(Obj_PlayerShip1,0)) draw_text(10 + 20*i,400,string(ds_list_find_value(global.lst_inv_enemies,i)));
}
draw_set_font(Fnt_Text);*/