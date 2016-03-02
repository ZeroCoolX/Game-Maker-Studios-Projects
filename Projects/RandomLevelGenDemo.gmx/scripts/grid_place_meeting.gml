///grid_place_meeting(x, y)
var xx = argument[0];
var yy = argument[1];

//Remember our position
var xp = x;
var yp = y;

//Update the position for the bbox calculations
x = xx;
y = yy;

//check for x meeting - concert player bbox position, into cell position
                                        //checking the right top corner
var x_meeting = (Level.grid[# bbox_right div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR) || 
                (Level.grid[# bbox_left div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR);
        
//check for y meeting        
var y_meeting = (Level.grid[# bbox_right div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR) || 
                (Level.grid[# bbox_left div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR);
                
var center_meeting = Level.grid[# xx div CELL_WIDTH, yy div CELL_HEIGHT] != FLOOR;
           
//Move player back
x= xp;
y = yp;   

//return true or false
return (x_meeting || y_meeting || center_meeting); 

