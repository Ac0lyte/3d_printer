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

PART = "2020_corner_plate";

if (PART == "2020_corner_plate_4x4") {
    2020_corner_plate(4,4,false);
}

if (PART == "2020_corner_plate_4x4_wide") {
    2020_corner_plate(4,4,true);
}

if (PART == "2020_corner_plate_3x4") {
    2020_corner_plate(3,4,false);
}

if (PART == "2020_corner_plate_3x4_wide") {
    2020_corner_plate(3,4,true);
}

if (PART == "2020_corner_plate_2x4") {
    2020_corner_plate(2,4,false);
}

if (PART == "2020_corner_plate_2x4_wide") {
    2020_corner_plate(2,4,true);
}

if (PART == "2020_corner_plate_3x3") {
    2020_corner_plate(3,3,false);
}

if (PART == "2020_corner_plate_3x3_wide") {
    2020_corner_plate(3,3,true);
}

if (PART == "2020_corner_plate_2x3") {
    2020_corner_plate(2,3,false);
}

if (PART == "2020_corner_plate_2x3_wide") {
    2020_corner_plate(2,3,true);
}

if (PART == "2020_corner_plate_2x2") {
    2020_corner_plate(2,2,false);
}

if (PART == "2020_corner_plate_2x2_wide") {
    2020_corner_plate(2,2,true);
}


/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */


module 2020_corner_plate(x=4, y=4, wide=false, height=5) {
  difference(){
    hull(){
        for ( i = [0:x-1]) {
          translate([10 * i, 0, 0]) cylinder(h=height, d=20, center=true, $fn=60);
        }
        for ( i = [0:y-1]) {
          translate([0, 10 * i, 0]) cylinder(h=height, d=20, center=true, $fn=60);
        }
        if(wide == true) {
            translate([x*5-7.5,-12.5,0]) cube([x*10+15,5,height], center=true);
            translate([-12.5,y*5-7.5,0]) cube([5,y*10+15,height], center=true);
        }
    }
    for ( i = [0:x-1]) {
        translate([10 * i, 0, 0]) cylinder(h=height+1, d=5, center=true, $fn=60);
    }
    for ( i = [0:y-1]) {
        translate([0, 10 * i, 0]) cylinder(h=height+1, d=5, center=true, $fn=60);
    }
  }
}
