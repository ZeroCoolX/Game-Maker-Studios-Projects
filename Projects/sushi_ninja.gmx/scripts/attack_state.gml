///attack_state
sprite_index = spr_ninja_attack;
image_speed = 0.5;

//frame 3 create damage object

if(image_index >= 2 && !attacked){
    var damage = instance_create(x, y, Damage);
    damage.creator = id;//set the damage objects creator to this
    attacked = true;
}
