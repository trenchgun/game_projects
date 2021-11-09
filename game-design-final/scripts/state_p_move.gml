///state_p_move()
// movement state for player
if (state_new) {
    anim_frame = 0;
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
    state_switch("Idle");
} else {
    len = spd;
}

// get hspd & vspd
hspd = lengthdir_x(len, dir + global.UPRIGHT);
vspd = lengthdir_y(len, dir + global.UPRIGHT);



if (hspd != 0) || (vspd != 0) {
    new_dir = dir + global.UPRIGHT;
    phy_rotation += angle_difference(new_dir, phy_rotation)/rspd;
    //phy_rotation = dir;
}

// animate
spr_legs = anim_legs_walk[anim_frame];
//spr_body = anim_arms_walk[anim_frame];

// point head towards mouse
var mx = mouse_x;
var my = mouse_y;
var aim_dir = point_direction(x,y,mx,my);



/*
// handle FOV
with (wall_hider) {
    image_angle = obj_player.head_dir;
    direction = obj_player.head_dir;
}
*/

// handle shooting
if (right_click) {
    ads = true;
    legs_dir = phy_rotation;
    head_dir = aim_dir;
    body_dir = aim_dir;
    spr_body = spr_p_body_hg_up;
    hspd *= ads_move_penalty;
    vspd *= ads_move_penalty;
    if left_clicked && !firing && (ammo_loaded > 0) {
    // rate of fire
        //firing = true;
        //alarm[0] = gun_rof;
        // create bullet
        gx = x + lengthdir_x(16,aim_dir);
        gy = y + lengthdir_y(16,aim_dir);
        with instance_create(gx, gy, obj_bullet) {
            phy_rotation = -aim_dir;
            physics_apply_local_force(0,0,175,0);
        }
        // manage ammo
        ammo_loaded --;
    }
} else {
    ads = false;
    legs_dir = phy_rotation;
    head_dir = phy_rotation;
    body_dir = phy_rotation;
    spr_body = spr_p_body_hg_down;
}

// handle reloading
if reload_key && (ammo_total > 0) && !reloading {
    ammo_total += ammo_loaded;
    ammo_loaded = 0;
    alarm[1] = gun_reload_time;
}

if (state_timer % 2 == 0) {
    anim_frame++;
}

// reset count
if (anim_frame == 8) {
    anim_frame = 0;
}

phy_position_x += hspd;   
phy_position_y += vspd;

// check if dead
if (hp <= 0) {
    state_switch("Dead");
}

//phy_rotation = lerp(phy_rotation, new_dir, lerp_amt);

// set depth for the object
scr_get_depth_phy();
