///scr_chance(percentage)
var percent = argument[0]; // range of [0,1]
percent = clamp(percent, 0,1);//just in case someone tries passing in something > 1
return (random(1) < percent); //random(1) will return anthing 0-0.99999999999999999
