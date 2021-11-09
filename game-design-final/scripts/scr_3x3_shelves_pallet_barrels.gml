/// scr_3x3_shelves_pallet_barrels()

angle = irandom(3) * 90;
                        
switch (angle) {
    case 0:
        // place shelves
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+21, shelves[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+21, shelves[choice]) {
            phy_rotation = obj_level.angle;
        }
        // place pallet
        choice = irandom(array_length_1d(pallets)-1);
        with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT, pallets[choice]) {
            phy_rotation = obj_level.angle;
        }
        // place barrels
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create((ix+1)*CELL_WIDTH-8, iy*CELL_HEIGHT-8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create((ix+1)*CELL_WIDTH+-8, iy*CELL_HEIGHT+8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create((ix+1)*CELL_WIDTH+8, iy*CELL_HEIGHT-8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create((ix+1)*CELL_WIDTH+8, iy*CELL_HEIGHT+8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        break;
    case 90:
        // place shelves
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH+21, iy*CELL_HEIGHT, shelves[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH+21, iy*CELL_HEIGHT+32, shelves[choice]) {
            phy_rotation = obj_level.angle;
        }
        // place pallet
        choice = irandom(array_length_1d(pallets)-1);
        with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+32, pallets[choice]) {
            phy_rotation = obj_level.angle;
        }
        // place barrels
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create(ix*CELL_WIDTH-8, iy*CELL_HEIGHT-8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create(ix*CELL_WIDTH-8, iy*CELL_HEIGHT+8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create(ix*CELL_WIDTH+8, iy*CELL_HEIGHT-8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create(ix*CELL_WIDTH+8, iy*CELL_HEIGHT+8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        break;
    case 180:
        // place shelves
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+11, shelves[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+11, shelves[choice]) {
            phy_rotation = obj_level.angle;
        }
        // place pallet
        choice = irandom(array_length_1d(pallets)-1);
        with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+32, pallets[choice]) {
            phy_rotation = obj_level.angle;
        }
        // place barrels
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create(ix*CELL_WIDTH-8, (iy+1)*CELL_HEIGHT-8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create(ix*CELL_WIDTH+8, (iy+1)*CELL_HEIGHT-8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create(ix*CELL_WIDTH-8, (iy+1)*CELL_HEIGHT+8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create(ix*CELL_WIDTH+8, (iy+1)*CELL_HEIGHT+8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        break;
    case 270:
        // place shelves
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH+11, iy*CELL_HEIGHT, shelves[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH+11, iy*CELL_HEIGHT+32, shelves[choice]) {
            phy_rotation = obj_level.angle;
        }
        // place pallet
        choice = irandom(array_length_1d(pallets)-1);
        with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+32, pallets[choice]) {
            phy_rotation = obj_level.angle;
        }
        // place barrels
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create((ix+1)*CELL_WIDTH-8, (iy+1)*CELL_HEIGHT-8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create((ix+1)*CELL_WIDTH-8, (iy+1)*CELL_HEIGHT+8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create((ix+1)*CELL_WIDTH+8, (iy+1)*CELL_HEIGHT-8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        choice = irandom(array_length_1d(barrels)-1);
        angle = irandom(3) * 90;
        with instance_create((ix+1)*CELL_WIDTH+8, (iy+1)*CELL_HEIGHT+8, barrels[choice]) {
            phy_rotation = obj_level.angle;
        }
        break;
}
