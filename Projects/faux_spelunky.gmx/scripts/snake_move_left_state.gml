///snake_move_left_state

var wall_at_left = place_meeting(x-1, y, Solid);//true if Solid is one pixel right

//NOTE: the functions bbox_bottom, _top, _left, _right all allow for exact pixel edge of the boundary box 
var ledge_at_left = !position_meeting(bbox_left-1, bbox_bottom+1, Solid)//1 px down, 1 px right. True IF not a ledge

if(wall_at_left || ledge_at_left){
    state = snake_move_right_state;
}

//Control the snake sprite
image_xscale = -1;

//Move the snake
x -= 1;
