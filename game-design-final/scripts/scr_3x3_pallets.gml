/// scr_3x3_pallets()

angle = irandom(3) * 90;
choice = irandom(array_length_1d(pallets)-1);
with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT, pallets[choice]) {
    phy_rotation = obj_level.angle;
}
angle = irandom(3) * 90;
choice = irandom(array_length_1d(pallets)-1);
with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+32, pallets[choice]) {
    phy_rotation = obj_level.angle;
}
angle = irandom(3) * 90;
choice = irandom(array_length_1d(pallets)-1);
with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT, pallets[choice]) {
    phy_rotation = obj_level.angle;
}
angle = irandom(3) * 90;
choice = irandom(array_length_1d(pallets)-1);
with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+32, pallets[choice]) {
    phy_rotation = obj_level.angle;
}
