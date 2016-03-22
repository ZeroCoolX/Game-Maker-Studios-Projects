///attack_state
sprite_index = spr_ninja_attack;
image_speed = 0.5;
//frame 3 create damage object

if(image_index >= 2 && image_index < 5 && !attacked){
    if(sign(image_xscale < 0)){
        //attacking left
        xx = x-28;
        yy = y+2;
        face = -1;
    }else{
        //attacking right
        xx = x+28;
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
