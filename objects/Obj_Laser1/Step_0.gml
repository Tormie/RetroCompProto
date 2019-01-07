ttl -=1;
if (ttl <= 0) && (room == Rm_02_Asteroids1){
	instance_destroy();
}
