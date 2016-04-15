///sushi_run_state()
//image_index = image_number-1;//however many images in the slide

//Apply Gravity
if(!place_meeting(x, y+1, Solid)){
    vspd += grav;
}else{
    vspd = 0;
   
     //use friction
    apply_friction(accel);
    
    //check for idle state
    if(hspd == 0 && vspd == 0){
        state = sushi_idle_state;
        alarm[0] = 10//room_speed/2;
        //reset the sushi
        image_speed = 0;
        image_index = 0;
    }
}

//face the player
if(hspd != 0){
    image_xscale = sign(hspd);
}

//move the sushi
horizontal_move_bounce(Solid);

