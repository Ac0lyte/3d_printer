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

 PART = "2020_ac_socket";

 if (PART == "2020_ac_socket") {
   color("skyblue")
   2020_ac_socket();
 }

 if (PART == "2020_ac_socket_cover") {
   color("skyblue")
   2020_ac_socket_cover();
 }

 /* ========================================================= */
 /* MODULES                                                   */
 /* ========================================================= */

 module 2020_ac_socket_cover() {
   difference() {
     union() {
       translate([0,41,0]) cube([65,2,65], center=true);
       translate([ 28,36, 24]) cube([5,10,7], center=true);
       translate([-28,36, 24]) cube([5,10,7], center=true);
       translate([ 28,36,-24]) cube([5,10,7], center=true);
       translate([-28,36,-24]) cube([5,10,7], center=true);
     }
     // side screw holes
     translate([0,35, 24]) rotate([0,90,0]) cylinder(h=70,d=3.5,$fn=100, center=true);
     translate([0,35,-24]) rotate([0,90,0]) cylinder(h=70,d=3.5,$fn=100, center=true);
   }
}

module 2020_ac_socket() {
  difference() {
    union() {
      cube([65,4,65], center=true);
      translate([ 31.5,20,0]) cube([2,40,65], center=true);
      translate([-31.5,20,0]) cube([2,40,65], center=true);
      translate([0,20, 31.5]) cube([61,40,2], center=true);
      translate([0,20,-31.5]) cube([61,40,2], center=true);
    }
    // front cutout
    cube([28,5,48], center=true);
    translate([20,0,0]) rotate([90,0,0]) cylinder(h=5,d=5,$fn=100, center=true);
    translate([-20,0,0]) rotate([90,0,0]) cylinder(h=5,d=5,$fn=100, center=true);

    // Bottom wire pass through
    translate([0,29,-31.5]) cylinder(h=3, d=15, center=true);

    // side screw holes
    translate([0,35, 24]) rotate([0,90,0]) cylinder(h=70,d=5,$fn=100, center=true);
    translate([0,35,-24]) rotate([0,90,0]) cylinder(h=70,d=5,$fn=100, center=true);

    // rail screw holes
    translate([ 20,12,-30]) rotate([0,0,0]) cylinder(h=7,d=5,$fn=100, center=true);
    translate([-20,12,-30]) rotate([0,0,0]) cylinder(h=7,d=5,$fn=100, center=true);
  }
}
