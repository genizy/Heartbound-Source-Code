skip_width = argument0;
skip_height = argument1;
row_speed = argument2;
realx = 0;
realy = 0;
xx = 0;
yy = 0;
realx = floor(x - sprite_get_xoffset(sprite_index));
realy = floor(y - sprite_get_yoffset(sprite_index));

for (yy = 0; yy < sprite_height; yy += skip_height)
{
    for (xx = 0; xx < sprite_width; xx += skip_width)
    {
        if (collision_point(realx + xx, realy + yy, object_index, 1, 0))
        {
            pixel = instance_create(realx + xx, realy + yy, obj_dissolve);
            
            with (pixel)
            {
                sprite_index = other.sprite_index;
                image_index = other.image_index;
                xx = other.xx;
                yy = other.yy;
                skip_width = other.skip_width;
                skip_height = other.skip_height;
                row_speed = other.row_speed;
                alarm[0] = ((room_speed * yy) / row_speed) + 1;
                depth = -other.y;
            }
        }
    }
}
