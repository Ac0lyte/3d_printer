/*
* The parts in this file are:
*
*   - 608zz_bearing()
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

PART = "608zz_bearing";

if (PART == "608zz_bearing") {
    rotate([0,0,90]) 608zz_mount();
}

if (PART == "608zz_mount") {
    rotate([0,0,90]) 608zz_mount();
}


/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */


module 608zz_bearing() {
    bearing_height=7;
    bearing_od=22;
    bearing_id=8;

    color("white")
    difference() {
      cylinder(h=bearing_height, d=bearing_od, $fn=100, center=true);
      cylinder(h=bearing_height+1, d=bearing_id, $fn=100, center=true);
    }
}


module 608zz_mount(){
  // 608zz bearing peg
  difference(){
    union(){
      rotate([90,0,0]) cylinder(h=608zz_height+4, d=608zz_id-0.2, $fn=100, center=true);
      translate([0,-3,0]) rotate([90,0,0]) cylinder(h=4, d=608zz_id+5, $fn=100, center=true);
      translate([0,-(608zz_height+4)/2 ,0])
      cube([30,2,18], center=true);
    }
    translate([10,-(608zz_height+4)/2 ,0]) rotate([90,0,0]) cylinder(h=5, d=M4_bolt_hole, $fn=100, center=true);
    translate([-10,-(608zz_height+4)/2 ,0]) rotate([90,0,0]) cylinder(h=5, d=M4_bolt_hole, $fn=100, center=true);
  }
}
