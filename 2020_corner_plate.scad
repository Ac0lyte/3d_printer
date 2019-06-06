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

 /* ========================================================= */
 /* MODULES                                                   */
 /* ========================================================= */

include <vars.scad>;

PART = "2020_corner_plate";

if (PART == "2020_corner_plate") {
    2020_corner_plate();
}


module 2020_corner_plate(x=4, y=4, wide=false) {
  difference(){
    hull(){
        for ( i = [0:x-1]) {
          translate([10 * i, 0, 0]) cylinder(h=5, d=20, center=true, $fn=200);
        }
        for ( i = [0:y-1]) {
          translate([0, 10 * i, 0]) cylinder(h=5, d=20, center=true, $fn=200);
        }
        if(wide == true) {
            translate([x*5-7.5,-12.5,0]) cube([x*10+15,5,5], center=true);
            translate([-12.5,y*5-7.5,0]) cube([5,y*10+15,5], center=true);
        }
    }
    for ( i = [0:x-1]) {
        translate([10 * i, 0, 0]) cylinder(h=6, d=5, center=true, $fn=200);
    }
    for ( i = [0:y-1]) {
        translate([0, 10 * i, 0]) cylinder(h=6, d=5, center=true, $fn=200);
    }
  }
}
