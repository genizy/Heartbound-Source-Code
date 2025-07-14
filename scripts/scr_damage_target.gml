var damage_amount = argument0;
var damage_target = argument1;
var spawn_x = argument2;
var spawn_y = argument3;

repeat (damage_amount)
{
    var damage_bit = instance_create(spawn_x, spawn_y, obj_damage_bit);
    damage_bit.damage_target = damage_target;
    
    with (damage_bit)
    {
        if (damage_target == 22)
        {
            global.storyline_array[95] = 1;
            image_blend = #9677BB;
        }
        else
        {
            image_blend = #FDC571;
        }
    }
}
