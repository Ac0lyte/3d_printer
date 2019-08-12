include <vars.scad>;
use <linear_bearings.scad>;



PART = "y_carriage_belt_clamp";

if (PART == "y_carriage_belt_clamp") {
    color(part_color)
    y_carriage_belt_clamp();
}

module y_carriage_belt_clamp() {
    tab_height = 9;
    base_width = 13.75;

    difference() {
        union() {
            hull(){
                cube([7, 34, 0.01], center=true);
                translate([-((base_width-7)/2), 0, 5]) cube([base_width, 34, 0.01], center=true);
            }
                translate([0, 0, tab_height/2 + 5]) cube([7 ,10 ,tab_height], center=true);        
        }
       translate([-14.5, 0, 0]) rotate([90, 180, 0]) scs10uu_holes();
       translate([0, 0, tab_height/2 + 5]) rotate([0, 90, 0]) cylinder(h=8, d=4, $fn=100, center=true);
    }
}