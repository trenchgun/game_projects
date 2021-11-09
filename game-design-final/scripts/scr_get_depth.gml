///scr_get_depth();
_x = argument[0];
_y = argument[1];

var newy = 0-(lengthdir_y(_x, view_angle) + lengthdir_y(_y, view_angle - 90));

depth = newy;
