///create_bits(repeat_min, repeat_max,  range_x ,range_y, bits_object, colour_off)

var rep_low = argument[0];
var rep_max = argument[1];
var range_x = argument[2];
var range_y = argument[3];
var bit_object = argument[4];
var colour_off = argument[5];

repeat(irandom_range(rep_low, rep_max)){//repeats code specific number of times
    //Create wihtin an area
    var rand_x = irandom_range(-range_x, range_y);
    var rand_y = irandom_range(-range_x, range_x);
    
    var bits = instance_create(x+rand_x, y+rand_y, bit_object);
    if(colour_off){
        bits.image_blend = c_black;
    }
}
