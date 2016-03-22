///stab_attack_state
sprite_index = spr_ninja_stab_attack;
image_speed = 0.5;

if(image_index >= 4){
    if(sign(image_xscale < 0)){
        //attacking left
        xx = x-52;
        yy = y+8;
        face = -1;
    }else{
        //attacking right
        xx = x+52;
        yy = y+8;
    }

    var damage = instance_create(xx, yy, StabCollider);
    damage.image_xscale = sign(image_xscale);
    damage.creator = id;//set the damage objects creator to this
}

