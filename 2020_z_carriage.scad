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
 use <2020_z_carriage>;
 use <2020_extrusion.scad>;
 use <height_lever.scad>;
 use <608zz_bearing.scad>;
 use <linear_bearings.scad>;
 use <pivot_nut_holder.scad>;

PART = "2020_z_carriage";
size=120;

if (PART == "2020_z_carriage") {
    2020_z_carriage();
    translate([95,0,0]) rotate([0,90,0]) color("skyblue",0.25)  2020_extrusion(190);
    translate([ 30, -26, 0]) color("green",0.25) scs10uu();

    translate([0,-16.5,0]) {
      color("orange", 0.25) height_lever();
      translate([170,35,0]) rotate([90,0,0]) 608zz_bearing();
      translate([200,40,0]) rotate([90,0,0]) 608zz_bearing();
    }
}

if (PART == "scs10uu_mount") {
   scs10uu_mount();
}

if (PART == "608zz_mount") {
    rotate([0,0,90]) 608zz_mount();
}

if (PART == "pivot_mount") {
    rotate([0,0,90]) pivot_mount();
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_z_carriage() {
  // Platform base dimentions
  platfom_width = 160;
  platfom_height = 5;
  platfom_depth = 30;

  //
  linear_bearing_height=29;
  linear_bearing_od=19;
  linear_bearing_id=10;

  //608zz
  bearing_height=7;
  bearing_od=22;
  bearing_id=8;
  bearing_race=11;

  // M5 Nut
  M5_height = 4;
  M5_diam = 9;

  translate([30, -12.9, 0]) scs10uu_mount();
  translate([170,16.5,0]) 608zz_mount();
  translate([10,18.5,0]) pivot_mount();
}


module pivot_mount(){
  difference(){
    union(){
      translate([0,-((pivot_diam+3.0)/2), 0]) cube([30,2,18], center=true);
      hull() {
        cylinder(h=6, d=pivot_diam,  $fn=100, center=true);
        translate([0,-((pivot_diam+2)/2), 0]) cube([29,2,6], center=true);
      }
    }
    translate([ 10, -(pivot_diam/2), 0]) rotate([90,0,0]) cylinder(h=pivot_diam, d=M4_bolt_hole+0.2, $fn=100, center=true);
    translate([-10, -(pivot_diam/2), 0]) rotate([90,0,0]) cylinder(h=pivot_diam, d=M4_bolt_hole+0.2, $fn=100, center=true);
    translate([ 10, 1, 0]) rotate([90,0,0]) cylinder(h=pivot_diam/2, d=8, $fn=100, center=true);
    translate([-10, 1, 0]) rotate([90,0,0]) cylinder(h=pivot_diam/2, d=8, $fn=100, center=true);

    // height adjustment bolt hole
    translate([0,0,0])
    hull(){
      rotate([0, 10,0]) cylinder(h=10, d=height_bolt_diam+1, center=true, $fn=100);
      rotate([0,-10,0]) cylinder(h=10, d=height_bolt_diam+1, center=true, $fn=100);
    }

    // height adjustment pivot hole
    translate([0,0,-5]) sphere(d=pivot_diam+0.2, $fn=100);
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

module scs10uu_mount() {
  difference() {
    union(){
      hull() {
        translate([0,18,12]) rotate([0,90,0]) cylinder(h=13, d=1, center=true);
        translate([0, 5,12]) rotate([0,90,0]) cylinder(h=13, d=1, center=true);
        translate([0, 5,19]) rotate([0,90,0]) cylinder(h=13, d=1, center=true);
      }
      hull() {
        translate([0,18,-12]) rotate([0,90,0]) cylinder(h=13, d=1, center=true);
        translate([0, 5,-12]) rotate([0,90,0]) cylinder(h=13, d=1, center=true);
        translate([0, 5,-19]) rotate([0,90,0]) cylinder(h=13, d=1, center=true);
      }
      translate([0, 0, 0]) cube([45,10,40], $fn=100, center=true);
      translate([0, 12, 11]) cube([45,15,2], center=true);
      translate([0, 12,-11]) cube([45,15,2], center=true);
    }
    translate([0,-2, 0]) cube([41,10,36], center=true);
    translate([0, 4, 0]) cube([46,2.1,20], center=true);

    translate([0, 0, 0]) scs10uu_holes();
    translate([12,6.51, 0]) cube([8,3,50], center=true);
    translate([-12,6.51, 0]) cube([8,3,50], center=true);

    translate([12,12.5, 0]) cylinder(h=50, d=M4_bolt_hole, $fn=100);
    translate([-12,12.5, 0]) cylinder(h=50, d=M4_bolt_hole, $fn=100);
  }
}
