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
use <linear_bearings.scad>;


PART = "2020_z_mount_spacer";
size=120;

if (PART == "2020_z_mount_spacer") {
  color("skyblue", 1) 2020_z_mount_spacer_a();

  color("green", 1) 2020_z_mount_spacer_b();


  color("green",0.25)
  translate([0, 19.5, 0]) rotate([0,0,180]) scs10uu();

  color("lightgrey",0.35) translate([0,19.5, 0]) cylinder(h=50, d=10, $fn=100, center=true);

}

if (PART == "2020_z_mount_spacer_a") {
  color("skyblue")
  2020_z_mount_spacer_a();
}

if (PART == "2020_z_mount_spacer_b") {
  color("green")
  2020_z_mount_spacer_b();
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_z_mount_spacer_a(width=40, depth=13, height=35, x_wall=3.5, z_wall=4.5) {
  h_diam = 5;
  x_off = (width/2) - (h_diam/2) - x_wall;
  z_off = (height/2) - (h_diam/2) - z_wall;
  ridge = 17;

  difference() {
    union(){
      cube([width, depth, height], center=true);
      translate([0, -6, 0]) cube([40, 21, 13], center=true);
    }
    translate([ x_off, 0 , z_off]) rotate([90,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
    translate([-x_off, 0 , z_off]) rotate([90,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
    translate([ x_off, 0 ,-z_off]) rotate([90,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
    translate([-x_off, 0 ,-z_off]) rotate([90,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);

    translate([ 5, -(depth) ,0]) rotate([0,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
    translate([-5, -(depth) ,0]) rotate([0,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
  }

}

module 2020_z_mount_spacer_b(width=40, depth=13, height=35, x_wall=3.5, z_wall=4.5) {
  h_diam = 5;
  x_off = (width/2) - (h_diam/2) - x_wall;
  z_off = (height/2) - (h_diam/2) - z_wall;
  ridge = 17;

  difference() {
    union(){
      translate([0, -12.5, 0]) cube([20, 12, 28], center=true);
      translate([0,-28.5, 12]) rotate([90,0,90]) 2020_mount_plate_2(height=4);
      translate([0,-28.5,-12]) rotate([90,0,90]) 2020_mount_plate_2(height=4);
    }
    translate([0, -11.4, 0]) cube([21, 10, 13], center=true);
    translate([ 5, -(depth) ,0]) rotate([0,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
    translate([-5, -(depth) ,0]) rotate([0,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
  }

}

module 2020_z_mount_spacer_v2(width=40, depth=13, height=35, x_wall=3.5, z_wall=4.5) {
  h_diam = 5;
  x_off = (width/2) - (h_diam/2) - x_wall;
  z_off = (height/2) - (h_diam/2) - z_wall;
  ridge = 17;

  difference() {
    union(){
      cube([width, depth, height], center=true);
      //translate([0, (depth+1)/2, 0]) cube([ridge, 1, height], center=true);

      translate([0, -6, 0]) cube([20, 25, 28], center=true);
      translate([0, -6, 0]) cube([40, 25, 13], center=true);

    }
    translate([ x_off, 0 , z_off]) rotate([90,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
    translate([-x_off, 0 , z_off]) rotate([90,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
    translate([ x_off, 0 ,-z_off]) rotate([90,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
    translate([-x_off, 0 ,-z_off]) rotate([90,0,0]) cylinder(h=height+1, d=h_diam+.5, $fn=100, center=true);
  }

  translate([0,-28.5, 12]) rotate([90,0,90]) 2020_mount_plate_2(height=4);
  translate([0,-28.5,-12]) rotate([90,0,90]) 2020_mount_plate_2(height=4);
}

module 2020_z_mount_spacer_v1(w=25, d=40, h=28) {
  cube([w, d, h], center=true);
  translate([(w/2)+9,0,(h/2)-2]) rotate([90,0,0]) 2020_mount_plate(height=4);
  translate([(w/2)+9,0,-((h/2)-2)]) rotate([90,0,0]) 2020_mount_plate(height=4);
  translate([-((w/2)+9),0,(h/2)-2]) rotate([90,0,0]) 2020_mount_plate(height=4);
  translate([-((w/2)+9),0,-((h/2)-2)]) rotate([90,0,0]) 2020_mount_plate(height=4);
}
