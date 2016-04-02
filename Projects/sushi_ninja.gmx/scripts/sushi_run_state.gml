///sushi_run_state()

//Apply Gravity
if(!place_meeting(x, y+1, Solid)){
    vspd += grav;
}else{
    hspd = sign(Player.x - x)*spd;
    vspd = 0;
   
     //use friction
    apply_friction(accel);
}

//face the player
if(hspd != 0){
    image_xscale = sign(hspd);
}

//move the sushi
move(Solid);

