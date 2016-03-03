///get_path_to_player()

if(instance_exists(Player)){
    //coordinates of player
    var xx = (Player.x div CELL_WIDTH) * CELL_WIDTH + CELL_WIDTH/2;//center of the tile the player is on
    var yy = (Player.y div CELL_HEIGHT) * CELL_HEIGHT + CELL_HEIGHT/2;
    
    //              grid to use   , path to use , start coord, x goal,  ygoal, diagonal allowed
    if(mp_grid_path(Level.grid_path, path, x, y, xx, yy, true)){//creating path the enemy will use to get to the player
        //       path   speed    end action    absolute
        path_start(path, 2, path_action_stop, false);
    }
}
