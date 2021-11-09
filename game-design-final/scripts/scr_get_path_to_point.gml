/// scr_get_path_to_point()
var xx = (argument[0] div CELL_WIDTH)*CELL_WIDTH+CELL_WIDTH/2;
var yy = (argument[1] div CELL_HEIGHT)*CELL_HEIGHT+CELL_HEIGHT/2;
 
if (mp_grid_path(obj_level.grid_path, t_path, x, y, xx, yy, true)) {
    //path_start(path, spd*2, path_action_stop, false);
    path_assign(path, t_path);
}
