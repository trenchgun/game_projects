/// scr_inv_add_loot(item_ID, name, description, value, stack)

var iid = argument[0];
global.item_index[# iid, item_stat.name] = argument[1];
global.item_index[# iid, item_stat.description] = argument[2];
global.item_index[# iid, item_stat.value] = argument[3];
global.item_index[# iid, item_stat.stack] = argument[4];

global.item_index[# iid, item_stat.type] = item_type.loot;
