///hurt_state()

//Apply gravity
if(!place_meeting(x, y+1, Solid)){
    vspd += grav;
}else{
    vspd = 0;

    //apply friction
    apply_friction(accel);
}

//actually move the Player
direction_move_bounce(Solid);

//change back into idle move state
if(vspd == 0){
    hspd = 0;
    show_debug_message("clearing!!!")
    image_blend = c_white;//draw normally
    state = move_state;
}
