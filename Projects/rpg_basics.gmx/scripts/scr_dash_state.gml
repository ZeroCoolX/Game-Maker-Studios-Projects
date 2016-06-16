///scr_move_state
movement = MOVE;
if(len == 0){//if we're not moving only
    dir = face * 90;//gets current facing direction in actual degrees
}

//set the length
len = spd*4;

//Get the speeds of the player
//function to convert a length and direction into a speed
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

//Move 
phy_position_x += hspd;
phy_position_y += vspd;

//Create an instance of the dash effect
var dash = instance_create(x, y, obj_dash_effect);//returns the ID for the object created
dash.sprite_index = sprite_index;//changes the dash sprite index to the current sprite index, so dash is the same as the direction dashing...
dash.image_index = image_index;



