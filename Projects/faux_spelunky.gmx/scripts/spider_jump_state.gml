///spider_jump_state()
image_index = image_number-1;//however many images in the slide (like arrays 0 based indexing)

//Apply gravity
if(!place_meeting(x, y+1, Solid)){
    vspd += grav;
}else{
    vspd = 0;
    
    //Use friction
    apply_friction(accel);
    
    //Check for idle state
    if(hspd == 0 && vspd == 0){
        state = spider_idle_state;
        alarm[0] = 15;//room/2;
        //reset spider
        image_speed = 0;
        image_index = 0;
    }
}

//face the player
if(hspd != 0){
    image_xscale = sign(hspd);
}

//Move the spider
horizontal_move_bounce(Solid);

