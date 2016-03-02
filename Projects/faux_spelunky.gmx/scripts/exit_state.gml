 ///exit_state

if(image_alpha > 0){
    image_alpha -= 0.25;
}else{
    if(room != room_last){//there is a next room
        room_goto_next();
    }else{
        //Calculate score
        score = (PlayerStats.sapphires);
        
        //Open the highscores
        ini_open("Settings.ini");//file       section     key    default value
        PlayerStats.highscore = ini_read_real("Score", "Highscore", 0);
        
        //A new highscore
        if(score > PlayerStats.highscore){
            PlayerStats.highscore = score;
            ini_write_real("Score", "Highscore", PlayerStats.highscore);
        }
        
        //close the ini file
        ini_close();
        
        room_goto(rm_highscore);
    }
}

