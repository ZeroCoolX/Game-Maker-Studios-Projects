///scr_get_face(dir)
var dir = argument0;

face = round(dir/90);//split up 360 degrees into 4 main quadrants (if doing 8 direction div by 45 and face == 8)

if (face == 4){
    face = RIGHT;//0
}
