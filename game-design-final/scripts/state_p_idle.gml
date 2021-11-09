///state_p_idle()
// idle state for player
if (state_new) {
    //obj_foot_r.x = r_leg_x_offset;
    //obj_foot_r.y = r_leg_y_offset + 8;

    //obj_foot_l.x = l_leg_x_offset;
    //obj_foot_l.y = l_leg_y_offset + 8;
    spr_legs = spr_p_legs_idle;
    //spr_body = spr_p_body_idle;
}

// get axis
var xAxis = (right_key - left_key);
var yAxis = (down_key - up_key);

// get direction
var dir = point_direction(0, 0, xAxis, yAxis);

// get length
if (xAxis == 0 && yAxis == 0)
{
    len = 0;
} else {
    len = spd;
}

// get hspd & vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

if (hspd != 0) || (vspd != 0) {
    state_switch("Move");
    //new_dir = dir;
    //phy_rotation += angle_difference(new_dir, phy_rotation)/rspd;
    //phy_rotation = dir;
}


// point head towards mouse
var mx = mouse_x;
var my = mouse_y;
var aim_dir = point_direction(x,y,mx,my);



// handle shooting
if (right_click) {
    ads = true;
    legs_dir = aim_dir;
    head_dir = aim_dir;
    body_dir = aim_dir;
    phy_rotation = aim_dir;
    spr_body = spr_p_body_hg_up;
    hspd *= ads_move_penalty;
    vspd *= ads_move_penalty;
    if left_clicked && !firing && (ammo_loaded > 0) {
        // rate of fire
        //firing = true;
        //alarm[0] = gun_rof;
        // create bullet
        var gx = x + lengthdir_x(16,aim_dir);
        var gy = y + lengthdir_y(16,aim_dir);
        with instance_create(gx, gy, obj_bullet) {
            phy_rotation = -aim_dir;
            physics_apply_local_force(0,0,175,0);
        }
        // manage ammo
        ammo_loaded --;
    }
} else {
    ads = false;
    spr_body = spr_p_body_hg_down;
}

// handle reloading
if reload_key && (ammo_total > 0) && !reloading {
    ammo_total += ammo_loaded;
    ammo_loaded = 0;
    alarm[1] = gun_reload_time;
}

// check if dead
if (hp <= 0) {
    state_switch("Dead");
}

/*
// handle FOV
with (wall_hider) {
    image_angle = obj_player.head_dir;
    direction = obj_player.head_dir;
}
*/

// set depth for the object
scr_get_depth_phy();
