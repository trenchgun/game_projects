/// scr_3x3_center_locker_shelves()

choice = irandom(array_length_1d(shelves)-1);
angle = irandom(3) * 90;
                        
switch (angle) {
    case 0: // back to back lockers & shelves
        // place shelves
        with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+11, shelves[choice]) {
            phy_rotation = 180;
        }
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+11, shelves[choice]) {
            phy_rotation = 180;
        }
        // place lockers
        with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+21, prop_locker_x3) {
            phy_rotation = 0;
        }
        with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+21, prop_locker_x3) {
            phy_rotation = 0;
        }
        break;
    case 90:
        // place shelves
        with instance_create(ix*CELL_WIDTH+11, iy*CELL_HEIGHT, shelves[choice]) {
            phy_rotation = 270;
        }
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH+11, iy*CELL_HEIGHT+32, shelves[choice]) {
            phy_rotation = 270;
        }
        // place lockers
        with instance_create(ix*CELL_WIDTH+21, iy*CELL_HEIGHT, prop_locker_x3) {
            phy_rotation = 90;
        }
        with instance_create(ix*CELL_WIDTH+21, iy*CELL_HEIGHT+32, prop_locker_x3) {
            phy_rotation = 90;
        }
        break;
    case 180:
        // place shelves
        with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+21, shelves[choice]) {
            phy_rotation = 0;
        }
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+21, shelves[choice]) {
            phy_rotation = 0;
        }
        // place lockers
        with instance_create(ix*CELL_WIDTH, iy*CELL_HEIGHT+11, prop_locker_x3) {
            phy_rotation = 180;
        }
        with instance_create(ix*CELL_WIDTH+32, iy*CELL_HEIGHT+11, prop_locker_x3) {
            phy_rotation = 180;
        }
        break;
    case 270:
        // place shelves
        with instance_create(ix*CELL_WIDTH+21, iy*CELL_HEIGHT, shelves[choice]) {
            phy_rotation = 90;
        }
        choice = irandom(array_length_1d(shelves)-1);
        with instance_create(ix*CELL_WIDTH+21, iy*CELL_HEIGHT+32, shelves[choice]) {
            phy_rotation = 90;
        }
        // place lockers
        with instance_create(ix*CELL_WIDTH+11, iy*CELL_HEIGHT, prop_locker_x3) {
            phy_rotation = 270;
        }
        with instance_create(ix*CELL_WIDTH+11, iy*CELL_HEIGHT+32, prop_locker_x3) {
            phy_rotation = 270;
        }
        break;
    default:
        break; 
}
