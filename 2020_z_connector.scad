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
 *   - 2020_z_connector()
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
include <2020_mount_plate.scad>;

PART = "2020_z_connector";
size=120;

if (PART == "2020_z_connector") {
    2020_z_connector();
}


module 2020_z_connector() {
  carriage_nut_od=10;
  carriage_nut_height=9;
  carriage_nut_flange=22;
  space=1.5;
  wall=4;
  plate_width=20;

  carriage_nut_mount_hole_diam=8;
  carriage_nut_mount_hole_size=3;
  carriage_nut_mount_hole_depth=10;


  difference(){
    union() {
      // mount cylinder and mount plate
      translate([0, 0, -(plate_width/2)+(carriage_nut_height/2)]) cylinder(h=carriage_nut_height, d=carriage_nut_flange, $fn=360, center=true);
      translate([0,(carriage_nut_od/2)-(wall/2)+space, 0]) rotate([0, 90, 0]) 2020_mount_plate(height=wall, width=plate_width);
    }
    // remove ball screw and exreusion
    cylinder(h=100, d=carriage_nut_od, $fn=360, center=true);
    translate([0, 10 + space + (carriage_nut_od/2), 0]) cube([100,20,20.1], center=true);

    // flange mount holes
    for (ROT =[0,90,180,270]) {
      rotate([0, 0, ROT]) translate([carriage_nut_mount_hole_diam, 0 ,-(plate_width/2)])
      cylinder(h=carriage_nut_mount_hole_depth, d=carriage_nut_mount_hole_size, $fn=360, center=true);
    }
  }
}
