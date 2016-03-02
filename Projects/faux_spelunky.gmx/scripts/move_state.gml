//move_state


//Gravity check
if(!place_meeting(x, y+1, Solid)){
    //Apply gravity
    vspd += grav;
    
    //Player is in the air
    sprite_index = spr_player_jump;
    image_speed = 0;//don't want the jump sprite to animate
    image_index = (vspd > 0);//returns true (1) or false (0). Tricky shorcut for which image to use since the choice is binary
    
    //Control jump height
    if(up_release && vspd < -6){
        vspd = -6;
    }
}else{    
    vspd = 0;
    //Jump check
    if(up_control){
        //Play jump sound sound   priority   loop
        audio_play_sound(snd_jump, 9, false);
        vspd = -Player.jspd;
    }
    
    //Player is on the ground
    if(hspd == 0){//not moving
        sprite_index = spr_player_idle;//image speed doesn't matter for single sprite without animations
    }else{
        sprite_index = spr_player_walk;
        image_speed = 0.6;//60% of the normal animation speed
    }
}



//get down
if(down_control){
    vspd = spd;
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
    apply_friction(accel);
}

//sprite faceing check
if(hspd != 0){
    image_xscale = sign(hspd);
}

//Play landing sound
if(place_meeting(x, y+vspd+1, Solid) && vspd > 0){
    audio_emitter_pitch(audio_em, random_range(0.8, 1.2));
    audio_emitter_gain(audio_em, 0.2);
    audio_play_sound_on(audio_em, snd_step, false, 11);
}

move(Solid);


//Ledgegrab state check
var falling = y-yprevious > 0;
var wasnt_wall = !position_meeting(x+(17*image_xscale), yprevious, Solid);//17 pixels horizontal
var is_wall = position_meeting(x+(17*image_xscale), y, Solid);

if(falling && wasnt_wall && is_wall){
    hspd = 0;
    vspd = 0;
    
    //Move against the ledge
    while(!place_meeting(x+image_xscale, y, Solid)){
        x+=image_xscale;
    }
    
    //Make sure we are the correct height
    while(position_meeting(x+(17*image_xscale), y-1,Solid)){
        y -=1;
    }
    
    sprite_index = spr_player_ledge_grab;
    state = ledge_grab_state;
    
    //Play the ledgegrab sound
    audio_emitter_pitch(audio_em, 1.5);
    audio_emitter_gain(audio_em, 0.1);
    audio_play_sound_on(audio_em, snd_step, false, 6);
    
}


