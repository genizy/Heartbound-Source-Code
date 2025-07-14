traveler_x = argument0;
traveler_y = argument1;
skip_height = 2;
skip_width = 2;
rand_timer = 0;
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
            spawn_x = realx + xx;
            spawn_y = realy + yy;
            pixel = instance_create(spawn_x, spawn_y, obj_swiftmove);
            target_x = (traveler_x + xx) - (sprite_width / 2);
            target_y = (traveler_y + yy) - (sprite_height / 2);
            
            with (pixel)
            {
                sprite_index = other.sprite_index;
                image_index = other.image_index;
                image_blend = c_white;
                xx = other.xx;
                yy = other.yy;
                skip_width = other.skip_width;
                skip_height = other.skip_height;
                target_x = other.target_x;
                target_y = other.target_y;
                depth = other.depth - 1;
                rand_timer = round(random(room_speed / 2)) + 1;
                alarm[0] = rand_timer;
                
                if (rand_timer > other.rand_timer)
                    other.rand_timer = rand_timer;
                
                jump_steps = round(random_range(3, 5));
            }
        }
    }
}

alarm[0] = rand_timer * 1.1;
