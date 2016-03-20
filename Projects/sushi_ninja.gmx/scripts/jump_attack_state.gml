///jump_attack_state
vspd += grav;//appply gravity
sprite_index = spr_ninja_jump_attack;
image_speed = 0.5;

if(image_index >= 2 && !attacked){
    if(sign(image_xscale < 0)){
        //attacking left
        xx = x-24;
        yy = y+2;
    }else{
        //attacking right
        xx = x+24;
        yy = y+2;
    }
    var damage = instance_create(xx, y, Damage);
    damage.image_xscale = sign(image_xscale);
    damage.creator = id;//set the damage objects creator to this
    attacked = true;
}
if(image_index >= 5){
    attacked = false;
}

move(Solid);
