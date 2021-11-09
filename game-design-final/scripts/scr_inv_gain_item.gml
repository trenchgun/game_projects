/// scr_inv_gain_item(item_ID, amount);

// will have to add stack limit

var iid = argument[0];
var amount = argument[1];

var slot = 0;  
var inventory_width = ds_grid_width(global.inventory);
var stack_limit = global.item_index[# iid, item_stat.stack];

while (slot < inventory_width) { // checking for mathing slots
    // if testing slot has matching item
    if (global.inventory[# slot, 0] == iid) {
        global.inventory[# slot, 0] = iid; // make that slot hold the test item
        while (global.inventory[# slot, 1] < stack_limit && amount > 0) {
            global.inventory[# slot, 1] ++;
            amount --;
        }
        
        if (amount == 0) {
            return true;
            exit;
        }
    }
    slot += 1;
}

slot = 0;

// checking for empty slots
while (slot < inventory_width) {
    if (global.inventory[# slot, 0] == item.none) { // if testing slot is empty
        global.inventory[# slot, 0] = iid;  // make that slot hold the test item
        global.inventory[# slot, 1] += amount;    // add amount to match
        
        return true;
        exit;
    }
    slot += 1;
}

return false;   // slot was not set

/*
while (slot < inventory_width) {
    // if checked slot in inventory is either empty or contains a matching item ID
    if (global.inventory[# slot, 0] == iid) {
        global.inventory[# slot, 0] = iid;
        global.inventory[# slot, 1] += amount;
        return true;    // slot set correctly
        exit;           // exit function, slot has been set 
    }
    slot ++;    // move to next slot
}

slot = 0;
while (slot < inventory_width) {
    // if checked slot in inventory is either empty or contains a matching item ID
    if (global.inventory[# slot, 0] == item.none) {
        global.inventory[# slot, 0] = iid;
        global.inventory[# slot, 1] += amount;
        return true;    // slot set correctly
        exit;           // exit function, slot has been set
    }
    slot ++;    // move to next slot
}
return false;   // slot was not set
*/
