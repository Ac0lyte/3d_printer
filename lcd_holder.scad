/*
 *
 * Copyright 2019 Tim Schaller
 * All rights reserved
 * Released under the GPL3
 * No claims are made as to the fitness and/or corectness of
 * this work. Use at your own risk. If you create useless things,
 * or if the parts fail it is on you NOT ME. As far as I know
 * this might make your printer burst into flames or print
 * little pink bunnies. You call. };->
 *
 *
 *
 * This is an arm for attaching an LCD screen to 2020 extrusion.
 * You will need two
*/

include <vars.scad>;

bottom_off = 35;
top_off = 100;
screw_size = 2;


PART = "lcd_mount";

if (PART == "lcd_mount") {
    lcd_mount(bottom_off, top_off, screw_size);
}


module lcd_mount(bottom_off, top_off, screw_size) {
    mount_screw_size = 4;
    width = screw_size+6;
    depth = 20;
    height = 20;

    standoff = 7;
    thickness = 5;
    angle = 10;


    difference() {
        union() {
            // rail mount
            translate([0, thickness/2, thickness/2]) cube([width, depth + thickness, height + thickness], center=true);

            // mount legs
            translate([0, depth/2, 0]) rotate([angle, 0, 0]) {
                hull() {
                  translate([0, 0, 0]) cube([width, thickness, 1], center=true);
                  translate([0, 0, bottom_off]) rotate([90,0,0]) cylinder(h=thickness, d=width, $fn=360, center=true);
                  translate([0, 0, top_off]) rotate([90,0,0]) cylinder(h=thickness, d=width, $fn=360, center=true);
                }
                translate([0, thickness, bottom_off]) rotate([90, 0, 0]) cylinder(h=thickness + standoff, d=width, $fn=360, center=true);
                translate([0, thickness, top_off]) rotate([90, 0, 0]) cylinder(h=thickness + standoff, d=width, $fn=360, center=true);
            }
        }
        // rail notch
        cube([width+1, depth+.1, height+.1], center=true);

        // rail monut screws
        translate([0, 10, 0]) rotate([90, 0, 0]) cylinder(h=depth, d=mount_screw_size, $fn=360, center=true);
        translate([0, 0, 10]) rotate([0, 0, 0]) cylinder(h=depth, d=mount_screw_size, $fn=360, center=true);

        // LCD mount screw holes
        translate([0, depth/2, 0]) rotate([angle, 0, 0]) {
            translate([0, 0, bottom_off]) rotate([90, 0, 0]) cylinder(h=thickness * 10, $fn=360, d=screw_size, center=true);
            translate([0, 0, top_off]) rotate([90, 0, 0]) cylinder(h=thickness * 10, $fn=360, d=screw_size, center=true);
        }

    }
}
