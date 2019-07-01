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

PART = "2020_dual_connector";

if (PART == "2020_dual_connector") {
    2020_dual_connector();
}
module 2020_dual_connector() {
  difference() {
    cube([80,40,5], center=true);
    translate([ 10, 10,0]) cylinder(h=6, d=5, center=true);
    translate([ 30, 10,0]) cylinder(h=6, d=5, center=true);
    translate([-10, 10,0]) cylinder(h=6, d=5, center=true);
    translate([-30, 10,0]) cylinder(h=6, d=5, center=true);
    translate([ 10,-10,0]) cylinder(h=6, d=5, center=true);
    translate([ 30,-10,0]) cylinder(h=6, d=5, center=true);
    translate([-10,-10,0]) cylinder(h=6, d=5, center=true);
    translate([-30,-10,0]) cylinder(h=6, d=5, center=true);
  }
}
