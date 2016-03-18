///sushi_idle_state()
if(instance_exists(Player)){
    var dist = distance_to_object(Player);
    if(dist < sight && alarm[0] <= 0){//in the range of the player, and allowed to jump again
        image_speed = 0.5;
        
        //face the player
        if(Player.x != x){
            image_xscale = sign(Player.x-x);//transform baddie
        }
    }
}
