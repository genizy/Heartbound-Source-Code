target_x = argument0;
target_y = argument1;
target_obj = argument2;
target_num = argument3;
target_list = ds_priority_create();
target_nearest = -4;
target_num = min(max(1, target_num), instance_number(target_obj));

with (target_obj)
    ds_priority_add(other.target_list, id, distance_to_point(other.target_x, other.target_y));

repeat (target_num)
    target_nearest = ds_priority_delete_min(target_list);

ds_priority_destroy(target_list);
return target_nearest;
