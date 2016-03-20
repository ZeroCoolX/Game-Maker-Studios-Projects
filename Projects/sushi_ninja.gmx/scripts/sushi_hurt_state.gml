///sushi_hurt_state()

//Apply gravity
if(!place_meeting(x, y+1, Solid)){
    vspd += grav;
}else{
    vspd = 0;

    //apply friction
    apply_friction(accel);
}

//actually move the enemy
direction_move_bounce(Solid);

//change back into idle move state
if(hspd == 0 && vspd == 0){
    image_blend = c_white;//draw normally
    state = sushi_idle_state;
}
