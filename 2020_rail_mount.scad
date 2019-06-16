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
 */

 include <vars.scad>;

 PART = "2020_rail_mount";

 if (PART == "2020_rail_mount") {
     2020_rail_mount();
 }

 /* ========================================================= */
 /* MODULES                                                   */
 /* ========================================================= */


module 2020_rail_mount(rail_d=10) {
    height=5;

    translate([0,0,2.5])
    difference() {
        union() {
            hull() {
                cylinder(h=height, d=20, center=true, $fn=200);
                translate([15,0,0]) cylinder(h=height, d=20, center=true, $fn=200);
                translate([-15,0,0]) cylinder(h=height, d=20, center=true, $fn=200);
            }
            translate([0, 0, height/2]) cylinder(h=height*.5, d=20, center=true, $fn=200);
        }
        translate([0, 0, height]) cylinder(h=(height*4)+1, d=rail_d, center=true, $fn=200);
        translate([15,0,0]) cylinder(h=height+1, d=6, center=true, $fn=200);
        translate([-15,0,0]) cylinder(h=height+1, d=6, center=true, $fn=200);
    }

}
