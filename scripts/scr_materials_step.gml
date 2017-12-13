/// Step Event

draw_self();

// Deletes self if not moving

if (!place_meeting(x,y,obj_roller)) && (del = 0) {
    alarm[0] = 30;
    del = 1;
}

// Destroy if touching different starter

if place_meeting(x,y,obj_starter) {
    if (steps == 0) {
        instance_destroy()
    }
}

// Destroy if touching seller

if place_meeting(x,y,obj_seller) {
    if (steps == 2) {
        global.money += value;
        instance_destroy();
    
        // Create profit
    
        var inst = instance_create(x, y, obj_profit);
        inst.value = value;
    }
}

// Adds materials to the crafter
 
if place_meeting(x,y,obj_crafter) {
    if object_index = 1 {
        obj_crafter.wood += 1;
        instance_destroy();
    }
    if object_index = 2 {
        obj_crafter.stone += 1;
        instance_destroy();
    }
    if object_index = 3 {
        obj_crafter.iron += 1;
        instance_destroy();
    }
    if object_index = 4 {
        obj_crafter.copper += 1;
        instance_destroy();
    }
    if object_index = 5 {
        obj_crafter.ironingot += 1;
        instance_destroy();
    }
    if object_index = 6 {
        obj_crafter.copperingot += 1;
        instance_destroy();
    }
    if object_index = 7 {
        obj_crafter.sand += 1;
        instance_destroy();
    }
    if object_index = 8 {
        obj_crafter.glass += 1;
        instance_destroy();
    }
    if object_index = 9 {
        obj_crafter.ironwire += 1;
        instance_destroy();
    }
    if object_index = 10 {
        obj_crafter.copperwire += 1;
        instance_destroy();
    }
    if object_index = 11 {
        obj_crafter.silicon += 1;
        instance_destroy();
    }
}


// Destroy if touching Furnace

if object_exists(obj_furnace) {
    if place_meeting(x,y,obj_furnace) {
        if (steps == 2) {
            if object_index = 3 {
                instance_destroy();
                var inst = instance_create(x, y, obj_iron_ingot);
                inst.dir = other.dir;
            }
            if object_index = 4 {
                instance_destroy();
                var inst = instance_create(x, y, obj_copper_ingot);
                inst.dir = other.dir;
            }
            if object_index = 7 {
                instance_destroy();
                var inst = instance_create(x, y, obj_glass);
                inst.dir = other.dir;
            }
            
        }
    }
}
    
// Collision with crusher

if object_exists(obj_crusher) {
    if place_meeting(x,y,obj_crusher) {
        if (steps == 2) {
            if object_index = 2 {
                instance_destroy();
                var inst = instance_create(x, y, obj_sand);
                inst.dir = other.dir;
            }
        }
    }
}

// Destroy if touching Moulder

if place_meeting(x,y,obj_moulder) {
    if (steps == 2) {
    
    // Make iron wire
        
        if (obj_moulder.mould == 'wire') && object_index = 5 {
            var inst = instance_create(x, y, obj_iron_wire);
            inst.dir = other.dir;
            instance_destroy();
        }
        
        // Make copper wire
        
        if (obj_moulder.mould == 'wire') && object_index = 6 {
            var inst = instance_create(x, y, obj_copper_wire);
            inst.dir = other.dir;
            instance_destroy();
        }
    }
}

// Move on Rollers

// Go the way the roller is facing
    
if (steps != 0) {
    switch (dir) {
        case(0):
            x += spd;
            break;
            
        case(1):
            y -= spd;
            break;
            
        case(2):
            x -= spd;
            break;
            
        case(3):
            y += spd;
            break;
    } 
    
    steps -= 1;   
}

// Destroys if idle

if alarm[0] = 0 {
    instance_destroy();
}
