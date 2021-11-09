/// state_e_zombie_idle();
if (state_new) {
    spr_legs = spr_p_legs_idle;
    spr_body = spr_e_zombie_body_idle;
}

var aggro_player = (point_distance(x,y,obj_player.x, obj_player.y) < 128);
var aggro_bullet = (distance_to_object(obj_bullet) < 128);
var los_player = (!collision_line(x,y,obj_player.phy_position_x,obj_player.phy_position_y,obj_wall,false,true));

if ((aggro_player && los_player) || aggro_bullet) {
    state_switch("Aggro");
}

// check if dead
if (hp <= 0) {
    state_switch("Dead");
}

// get depth
scr_get_depth_phy();
