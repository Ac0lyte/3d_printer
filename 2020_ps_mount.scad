/*
 *
 * The parts in this file are:
 *
 *   - 2020_ps_mount()
 *     This connects the z carriage to the build plate frame
 *
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
include <2020_extrusion.scad>;


PART = "2020_ps_mount";
size=120;

if (PART == "2020_ps_mount") {
  color("skyblue")
  2020_ps_mount();
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_ps_mount() {
  difference() {
    union() {
      cube([10, 5, 49], center=true);
      translate([0, -10, 0]) cube(size=[10, 25, 5], center=true);
    }
    translate([0, 0, 11.5]) rotate([90, 0, 0]) cylinder(h=6, d=4.5, $fn=100, center=true);
    translate([0, 0,-12.5]) rotate([90, 0, 0]) cylinder(h=6, d=4.5, $fn=100, center=true);
    translate([0,-12.5, 0]) rotate([ 0, 0, 0]) cylinder(h=6, d=4.5, $fn=100, center=true);
  }
}
