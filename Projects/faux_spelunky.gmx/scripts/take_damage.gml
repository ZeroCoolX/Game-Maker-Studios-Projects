///take_damage()
    if(state != hurt_state){
        //                   emitter , 1=normal
        audio_emitter_pitch(audio_em, 1.6);//pitch
        audio_emitter_gain(audio_em, 1.4);//volume
        audio_play_sound_on(audio_em, snd_ouch, false, 8);
    
        //custom colour for hurtness
        image_blend = make_colour_rgb(220, 150,150);
        vspd = -12;//hardcoded for now but should abstract
        hspd = sign(x-other.x)*10
        
        //Activate state
        state = hurt_state;
        
        move(Solid);
        
        if(instance_exists(PlayerStats)){
            PlayerStats.hp -= 1;
        }
    }
