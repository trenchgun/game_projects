/// state_e_dead();
if (state_new) {
    visible = false;
    // create particle effect
    dx = x + lengthdir_x(16,global.UPRIGHT+90);
    dy = y + lengthdir_y(16,global.UPRIGHT+90);
    with instance_create(dx, dy, obj_bullet_impact) {
        //part_system_depth(sparks, depth);
        part_emitter_burst(sparks, spark_emitter, part_spark, 100);
    }
    
    // draw a image of the dead enemy on ground
    with instance_create(x,y,obj_dead_body) {
        sprite_index = other.spr_dead;
        image_index = irandom(1);
        image_angle = other.body_dir;
        depth = 999998;
    }
    
    instance_destroy();
}
