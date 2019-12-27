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
 *   - 2020_z_carriage()
 *
 *   - scs10uu_mount()
 *
 *   - 608zz_mount()
 *
 *   - pivot_mount()
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
use <2020_extrusion.scad>;
use <2020_corner_plate.scad>;
use <linear_bearings.scad>;
use <pivot_nut_holder.scad>;

PART = "2020_z_carriage";
size=120;

if (PART == "2020_z_carriage_assembly") {
    plate_thickness = 4;
    rail_offset = 47 + plate_thickness;

    translate([105,10+rail_offset,0]) rotate([0,90,0]) color("black",0.25)  2020_extrusion(190);
    translate([0,95+rail_offset,0]) rotate([0,90,90]) color("black",0.25)  2020_extrusion(190);
    translate([0, -13, 0]) color("green",0.25) scs10uu();

    color(part_color)
    2020_z_carriage(plate_thickness);
}

if (PART == "2020_z_carriage") {
    plate_thickness = 4;
    color(part_color)
    2020_z_carriage(plate_thickness);
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_z_carriage(plate_thickness = 4) {
  difference() {
    union(){
      scs10uu_plate(plate_thickness = plate_thickness);
      translate([0,41+plate_thickness,-3]) 2020_corner_plate(4,3,true,22);

      hull(){
        translate([0,plate_thickness,0]) cube([18,1,40], center=true);
        translate([0,25.5+plate_thickness,-3]) cube([18,1,22], center=true);
      }
      hull(){
        translate([0,plate_thickness,0]) cube([45,1,10], center=true);
        translate([12.5,15.5+plate_thickness,0]) cube([55,1,16], center=true);
      }
      hull(){
        translate([12.5,15.5+plate_thickness,0]) cube([55,1,16], center=true);
        translate([12.5,25.5+plate_thickness,-3]) cube([55,1,22], center=true);
      }
    }
    translate([20,45.5,5]) cube([60,21,31], center=true);
    translate([0,60,5]) cube([21,50,31], center=true);
    translate([25,60,10]) cube([50,50,31], center=true);
  }
}



module scs10uu_plate(plate_thickness = 4) {
    difference() {
      // mount plate
      translate([0, 0, 0]) cube([45,plate_thickness*2,40], $fn=100, center=true);

      translate([0,-(plate_thickness/2), 0]) cube([41,plate_thickness+1,36], center=true);
      translate([0, 0, 0]) scs10uu_holes();
    }

}
