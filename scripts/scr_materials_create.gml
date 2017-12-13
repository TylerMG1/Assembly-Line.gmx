/// Create Event

// Initalize Varibles
    
dir = 0;
steps = 16;
spd = 2;
del = 0;
material = self;
str = object_get_name(object_index);
global.create += 1;

// Initalize value

// Index values
// 1 = obj_material_parent
// 2 = obj_stone
// 3 = obj_iron_ore
// 4 = obj_copper_ore
// 5 = obj_iron_ingot
// 6 = obj_copper_ingot
// 7 = obj_sand
// 8 = obj_glass
// 9 = obj_iron_wire
// 10 = obj_copper_wire
// 11 = obj_silicon
// 12 = obj_circuit_board

if object_index = 1 {
    value = 5;
}
if object_index = 2 {
    value = 10;
}
if object_index = 3 {
    value = 50;
}
if object_index = 4 {
    value = 25;
}
if object_index = 5 {
    value = 75;
}
if object_index = 6 {
    value = 38;
}
if object_index = 7 {
    value = 75
}
if object_index = 8  {
    value = 50;
}
if object_index = 9 {
    value = 113;
}
if object_index = 10 {
    value = 57;
}
if object_index = 11 {
    value = 50;
}
if object_index = 12 {
    value = 246;
}


