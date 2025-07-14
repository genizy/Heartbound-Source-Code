var temp_array = argument[0];
var find_value = argument[1];
var min_index = argument[2];
var max_index = argument[3];

for (var xx = min_index; xx < max_index; xx++)
{
    if (temp_array[xx] == find_value)
        return xx;
}

return -1;
