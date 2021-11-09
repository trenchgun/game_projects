/// scr_draw_silhouette()
surface_set_target(surface);

// make surface black
draw_clear(c_black);

// draw player white
d3d_set_fog(true, c_white, 0, 1);
with (obj_player) {
    //draw_self();
    // draw legs
    scr_draw_slices(spr_legs, phy_rotation, 0)
    // draw body
    scr_draw_slices(spr_body, body_dir, -8);
    // draw head
    scr_draw_slices(spr_head, head_dir, -16);
}
d3d_set_fog(false, c_white, 0, 0);

// draw object black with alpha of .5
with (obj_wall) {
    scr_draw_slices(sprite_index, phy_rotation, 0, c_black, .5);
    //draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, .5);
}
with (obj_void) {
    image_alpha = 0.5;
    draw_self()
}

surface_reset_target();

// draw the surface
shader_set(shd_silhouette);
draw_surface(surface, 0, 0);
shader_reset();




