/*
 * This is my attempt at creating a z axiz carriage.
 * I suspect that it may be fairly over built, but it is
 * intended for a moving z-axis and I am printing it in PLA
 * so the material is not asstron as I would like.
 *
 * The size variable anlong with the left/right/center parts
 * were created for use when splitting the print into 3 pieces
 * because my DiVinci Jr 1.0w could not print the full thing.
 *
 * The parts in this file are:
 *
 *   - 2020_z_mount_spacer()
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
use <2020_mount_plate.scad>;


PART = "2020_z_mount_spacer";
size=120;

if (PART == "2020_z_mount_spacer") {
  color("blue")
  2020_z_mount_spacer();
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */


module 2020_z_mount_spacer(w=25, d=40, h=28) {
  cube([w, d, h], center=true);
  translate([(w/2)+9,0,(h/2)-2]) rotate([90,0,0]) 2020_mount_plate(height=4);
  translate([(w/2)+9,0,-((h/2)-2)]) rotate([90,0,0]) 2020_mount_plate(height=4);
  translate([-((w/2)+9),0,(h/2)-2]) rotate([90,0,0]) 2020_mount_plate(height=4);
  translate([-((w/2)+9),0,-((h/2)-2)]) rotate([90,0,0]) 2020_mount_plate(height=4);
}
