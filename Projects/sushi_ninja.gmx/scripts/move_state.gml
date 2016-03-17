///move_state

//Gravity check
if(!place_meeting(x, y+1, Solid)){
    //Apply Gravity
    vspd += grav;
    
}else{
    vspd = 0;
    
    //Player is on the ground
    if(hspd == 0){
        sprite_index = spr_player_idle
        image_speed = 0.5;
    }else{
        sprite_index = spr_player_run_left;
        image_speed = 1;
    }
}

//acceleration code
if(right_control || left_control){
    hspd += (right_control - left_control)*accel;
    hspd_dir = (right_control - left_control);
    
    //movement cap
    if(hspd > spd){
        hspd = spd;
    }
    if(hspd < -spd){
        hspd = -spd;
    }
}else{
    //apply_friction(accel);
}

//sprite facing check
if(hspd != 0){
    image_xscale = sign(hspd);    
}

move(Solid);








