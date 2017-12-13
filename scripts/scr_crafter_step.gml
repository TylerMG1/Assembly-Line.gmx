/// Step event

draw_self();

// Sets variable to trigger draw event

if point_in_rectangle(mouse_x,mouse_y,x+16,y-16,x-16,y+16) {
    if mouse_check_button_released(mb_right) {
        if global.gui != 3 {
            global.gui = 3;
            gui = 1;
            }
    }
}
    
    // Checks what product has been clicked
    
if mouse_check_button_pressed(mb_left) {
    if gui = 1 {
    
        // Checks if circuit is clicked
        
        if point_in_rectangle(mouse_x,mouse_y,16,400,96,464) {
            product = obj_stone;
            global.gui = 0;
        }
        
        // Checks if copper is clicked
        
        if point_in_rectangle(mouse_x,mouse_y,96,400,176,464) {
            if global.copperlocked = 0 {
                product = obj_copper_ore;
                global.gui = 0;
            } else {
                if global.money >= 1000 {
                    global.money -= 1000;
                    global.copperlocked = 0;
                    product = obj_copper_ore;
                }
            }
        }
        
        // Checks is iron is clicked
        
        if point_in_rectangle(mouse_x,mouse_y,176,400,256,464) {
            if global.ironlocked = 0 {
                product = obj_iron_ore;
                global.gui = 0;
            } else {
                if global.money >= 10000 {
                    global.money -= 10000;
                    global.ironlocked = 0;
                    product = obj_iron_ore;
                }
            }
        }
        
        // Checks if cross is clicked
        
        if point_in_rectangle(mouse_x,mouse_y,576,384,592,400) {
            global.gui = 0;
        }
        
    }
}

// Rotate

if keyboard_check_pressed(ord("R")) {
    if (position_meeting(mouse_x, mouse_y, self)) {
    
        if (image_angle < 270) {
            image_angle += 90;
        } else {
            image_angle = 0;
        }
    }
}

dir = image_angle / 90;



/// Draw event

// Draw the product on the crafter

draw_self();
draw_set_alpha(1);
draw_sprite(object_get_sprite(product), 0, x, y);

// Deletes the crafter

if place_meeting(x,y,obj_delete) {
    instance_destroy();
    instance_destroy(obj_delete);
}

if global.gui != 3 {
    gui = 0;
}

// Checks if it contains the right ingredients

if product = obj_silicon {
    if copperwire >= 2 && silicon >= 1 {
        alarm[0] = delay;
        copperwire -= 2;
        silicon -= 1;
    }
}

/// Draw Gui

// Draw the menu for starter

if gui = 1 {
    
    draw_set_font(ft_pixel);
    draw_set_colour(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    // Draws box and cross
    
    draw_rectangle_colour(16,400,592,464,c_dkgray,c_dkgray,c_dkgray,c_dkgray,c_black);
    draw_rectangle_colour(576,384,592,400,c_dkgray,c_dkgray,c_dkgray,c_dkgray,c_black);
    draw_sprite(spr_cross,1,584,392)
    
    // Draws Circuit Board
    
    if product = obj_circuit_board {
        draw_rectangle(16,400,96,464,c_white);
    }   
    draw_sprite_ext(spr_circuit_board,1,56,432,2,2,0,c_white,1);
    draw_text(56,400,"Circuit")
    draw_text(56,440,"Value:$246")
    
    // Draws copper
    
    if product = obj_copper_ore {
        draw_rectangle(96,400,176,464,c_white);
    }  
    if global.copperlocked = 0 {
        draw_sprite(spr_copper_icon,1,136,432);
        draw_text(136,400,"Copper");
        draw_text(136,440,"Value:$25");
    } else {
        draw_set_alpha(0.25);
        if global.money >= 1000 {
            draw_set_color(c_green);
        } else {
            draw_set_color(c_red);
        }
        draw_sprite(spr_iron_icon,1,136,432);
        draw_set_alpha(1);
        draw_text(136,400,"Copper");
        draw_text(136,440,"Cost:$1k");
        draw_set_color(c_white)
    }
    
    // Draw Iron
    
    if product = obj_iron_ore {
        draw_rectangle(176,400,256,464,c_white);
    }  
    if global.ironlocked = 0 {
        draw_sprite(spr_iron_icon,1,216,432);
        draw_text(216,400,"Iron");
        draw_text(216,440,"Value:$50");
    } else {
        draw_set_alpha(0.25);
    if global.money >= 10000 {
        draw_set_color(c_green);
    } else {
        draw_set_color(c_red);
    }
        draw_sprite(spr_iron_icon,1,216,432);
        draw_set_alpha(1);
        draw_text(216,400,"Iron");
        draw_text(216,440,"Cost:$10k");
    }
}
