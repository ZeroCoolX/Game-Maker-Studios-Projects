///create_bits(repeat_min, repeat_max,  range_x1, range_x2 ,range_y1, range_y2, bits_object, colour_off)

var rep_low = argument[0];
var rep_max = argument[1];
var range_x1 = argument[2];
var range_x2 = argument[3];
var range_y1 = argument[4];
var range_y2 = argument[5];
var bit_object = argument[6];
var colour_off = argument[7];

repeat(irandom_range(rep_low, rep_max)){//repeats code specific number of times
    //Create wihtin an area
    var rand_x = irandom_range(-range_x1, range_x2);
    var rand_y = irandom_range(-range_y1, range_y2);
    
    var bits = instance_create(x+rand_x, y+rand_y, bit_object);
    if(colour_off){
        bits.image_blend = c_black;
    }
}
