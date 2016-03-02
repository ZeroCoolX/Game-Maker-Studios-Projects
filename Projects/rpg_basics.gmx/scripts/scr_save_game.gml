///scr_save_game()

if(!instance_exists(obj_player_stats)){
    exit;//don't save if the player is dead
}

//Create the save data struc
var save_data = ds_map_create();

with(obj_player_stats){//save all the info into the data struct
      //[accessor "name"] = value
    save_data[? "room"] = previous_room;
    save_data[? "x"] = 0;
    save_data[? "y"] = 0;
    save_data[? "hp"] = hp;
    save_data[? "maxhp"] = maxhp;
    save_data[? "stamina"] = stamina;
    save_data[? "maxstamina"] = maxstamina;
    save_data[? "expr"] = expr;
    save_data[? "maxexpr"] = maxexpr;
    save_data[? "level"] = level;
    save_data[? "attack"] = attack;
}
//human readible save string
var save_string = json_encode(save_data);
ds_map_destroy(save_data);

//encrypt
save_string = base64_encode(save_string);

//open file                   destination          filename
var file = file_text_open_write(working_directory + "save_file.txt");

//write save_data contents to file
file_text_write_string(file, save_string);
//close file
file_text_close(file);

show_message("Save file created successfully");
