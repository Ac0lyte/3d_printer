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
use <2020_bronze_bearing_holder.scad>;
use <2020_z_mount_spacer.scad>;
use <2020_mount_plate.scad>;
use <2020_x_pulley_mount.scad>;
use <rail_y_pulley_mount.scad>;
use <y_carriage_belt_clamp.scad>;
use <linear_bearings.scad>;
use <g2.scad>;
use <v6_j_type_hotend.scad>;


PART = "2020_x_axis_carriage_assembly";

if (PART == "2020_x_axis_carriage_assembly") {
  // Rotate the whole thing to make me sane
  rotate([90, 0, 180]){

    // X carriage base
    color(part_color, 0.25)
    translate([0, -1, 0]) rotate([180, 0, 0]) difference(){
        union(){
          translate([0, -7, 0]) 2020_x_axis_carriage_connector_center();
          difference(){
            union(){
              translate([ 38,-.5,00]) rotate([0, 0, 180]) 2020_x_axis_carriage_rail_mount(passthrough=true);
              translate([-38,-.5,00]) rotate([0, 0,   0]) 2020_x_axis_carriage_rail_mount(passthrough=true);
            }
            translate([0, 0, 40]) cube([100,20,40], center=true);
          }
          translate([ 20, -5, 0]) cube([10,5,40], center=true);
          translate([-20, -5, 0]) cube([10,5,40], center=true);
        }
        translate([0, -9.5, 0]) cube([100,4,100], center=true);
      }

    // Y pully mount
    translate([0, -3.5, 13]) rotate([90,0,180])
    color(part_color, 0.25)rail_y_pulley_mount();

    // far end
    // translate([0, -3.5, 13]) rotate([90,0,180])
    // color(part_color, 0.25) rail_y_pulley_mount(rail_end="far");

    // Y pulleys
    color("grey", 0.25) {
      // Toothed
      translate([-49,21,29]) rotate([90,0,0]) g2_smooth_pulley();
      //smooth
      translate([-9,21,43]) rotate([90,0,0]) g2_smooth_pulley();
      translate([-37,21,43]) rotate([90,0,0]) g2_smooth_pulley();
      // far end
      // translate([-23,21,30]) rotate([90,0,0]) g2_smooth_pulley();
    }

    // X axis bearing mounts
    color("green",0.25) {
      translate([ 21, 19.5, 0]) rotate([0,90,180]) scs10uu();
      translate([-21, 19.5, 0]) rotate([0,90,180]) scs10uu();
    }

    // Y axis bearing mounts
    color("red",0.25) {
      translate([ 40, -1, 75]) rotate([0, 0, 180]) scs10uu();
      translate([-40, -1, 75]) rotate([0, 0, 180]) scs10uu();
    }

    // Y axis belt clamp
    color(part_color, 0.25)
    translate([-25.5, 7, 75]) rotate([90, 180, 180]) y_carriage_belt_clamp();

    // Hotend
    color("yellow",0.25)
    translate([0, -17, 75]) rotate([270,0,0]) hotend();

  } // Close global rotation
}



if (PART == "2020_x_axis_carriage_connector_center") {
  color(part_color) {
    difference(){
      union(){
        translate([0, -7, 0]) 2020_x_axis_carriage_connector_center();
        difference(){
          union(){
            translate([ 38,-.5,00]) rotate([0, 0, 180]) 2020_x_axis_carriage_rail_mount(passthrough=true);
            translate([-38,-.5,00]) rotate([0, 0,   0]) 2020_x_axis_carriage_rail_mount(passthrough=true);
          }
          translate([0, 0, 40]) cube([100,20,40], center=true);
        }
        translate([ 20, -5, 0]) cube([10,5,40], center=true);
        translate([-20, -5, 0]) cube([10,5,40], center=true);
      }
      translate([0, -9.5, 0]) cube([100,4,100], center=true);
    }
  }
}

if (PART == "2020_x_axis_carriage_connector_left") {
  color(part_color) {
    difference(){
      union(){
        translate([0, -7, 0]) 2020_x_axis_carriage_connector_left();
        difference(){
          union(){
            translate([ 38,-.5,00]) rotate([0, 0, 180]) 2020_x_axis_carriage_rail_mount();
            translate([-38,-.5,00]) rotate([0, 0,   0]) 2020_x_axis_carriage_rail_mount();
          }
//          translate([0, 0, 40]) cube([100,20,40], center=true);
        }
        translate([ 20, -5, 0]) cube([10,5,40], center=true);
        translate([-20, -5, 0]) cube([10,5,40], center=true);
      }
      translate([0, -9.5, 0]) cube([100,4,100], center=true);
    }
  }
}

if (PART == "2020_x_axis_carriage_connector_right") {
  color(part_color)
  2020_x_axis_carriage_connector_right();
}

if (PART == "2020_x_axis_carriage_rail_mount") {
  color(part_color)
  2020_x_axis_carriage_rail_mount();
}

if (PART == "2020_x_axis_carriage_half") {
  color(part_color)
  difference(){
    2020_x_axis_carriage();
    translate([0,0,50]) cube([100,100,100], center=true);
  }
}

if (PART == "2020_x_axis_carriage_left") {
  color(part_color)
  difference(){
    2020_x_axis_carriage();
    translate([50,0,0]) cube([100,100,100], center=true);
  }
}

if (PART == "2020_x_axis_carriage_right") {
  color(part_color)
  difference(){
    2020_x_axis_carriage();
    translate([-50,0,0]) cube([100,100,100], center=true);
  }
}

if (PART == "10mm_rail_clamp") {
  color(part_color) 10mm_rail_clamp();
}
/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_x_axis_carriage_assembly_left(){
  difference(){
    union(){
      translate([0, -7, 0]) 2020_x_axis_carriage_connector_left();
      difference(){
        union(){
          translate([ 38,-.5,00]) rotate([0, 0, 180]) 2020_x_axis_carriage_rail_mount();
          translate([-38,-.5,00]) rotate([0, 0,   0]) 2020_x_axis_carriage_rail_mount();
        }
          translate([0, 0, 40]) cube([100,20,40], center=true);
      }
      translate([ 20, -5, 0]) cube([10,5,40], center=true);
      translate([-20, -5, 0]) cube([10,5,40], center=true);
    }
    translate([0, -9.5, 0]) cube([100,4,100], center=true);
  }
}

module 2020_x_axis_carriage_assembly_right(){
  difference(){
    union(){
      translate([0, -7, 0]) 2020_x_axis_carriage_connector_right();
      difference(){
        union(){
          translate([ 38,-.5,00]) rotate([0, 0, 180]) 2020_x_axis_carriage_rail_mount();
          translate([-38,-.5,00]) rotate([0, 0,   0]) 2020_x_axis_carriage_rail_mount();
        }
          translate([0, 0, 40]) cube([100,20,40], center=true);
      }
      translate([ 20, -5, 0]) cube([10,5,40], center=true);
      translate([-20, -5, 0]) cube([10,5,40], center=true);
    }
    translate([0, -9.5, 0]) cube([100,4,100], center=true);
  }
}


// This provides a dual rail carrage that the belt clamp bolts onto.
// This allows for smaller prints and faster itterations of the whole
// assembly.
module 2020_x_axis_carriage_connector_center() {
  // Carriage plate
  difference() {
    translate([0, 2.75, 0]) rotate([0,90,0]) scale([1, .5, 1]) 2020_z_mount_spacer_a(tab = false);
    translate([ 17, 0, 0]) cube([3,15,41], center=true);
    translate([-17, 0, 0]) cube([3,15,41], center=true);
  }
  // mounting block
  block_height = 25;
  block_depth = 8;
  block_width = 40;
  block_offset = 0;

  difference(){
    translate([0, block_height/2, block_offset]) cube([block_width,block_height,block_depth], center=true);
    translate([  0, block_height-5, block_offset]) rotate([0,0,0]) cylinder(h=block_depth+1, d=4.5, $fn=100, center=true);
    translate([ 10, block_height-5, block_offset]) rotate([0,0,0]) cylinder(h=block_depth+1, d=4.5, $fn=100, center=true);
    translate([-10, block_height-5, block_offset]) rotate([0,0,0]) cylinder(h=block_depth+1, d=4.5, $fn=100, center=true);
  }
}

module 2020_x_axis_carriage_connector_left() {
  // Carriage plate
  difference() {
    translate([0, 2.75, 0]) rotate([0,90,0]) scale([1, .5, 1]) 2020_z_mount_spacer_a(tab = false);
    translate([ 17, 0, 0]) cube([3,15,41], center=true);
    translate([-17, 0, 0]) cube([3,15,41], center=true);
  }
  // Neck connecting clamp block to carriage plate
  difference(){
    translate([0,4,37.75]) cube([40,9,35.5], center=true);
    translate([ 10,0,41]) rotate([90,0,0]) cylinder(h=20,d=4.5, $fn=100, center=true);
    translate([-10,0,41]) rotate([90,0,0]) cylinder(h=20,d=4.5, $fn=100, center=true);
  }
  // block below belt clamp
  translate([0,12,50.5]) cube([40,15,10], center=true);
  // Belt clamps here
  translate([0, 10, 0]) {
    difference(){
      translate([0,14.5,50.5]) cube([40,12,10], center=true);
      translate([0,14.5,50]) rotate([0,0,0]) cylinder(h=22, d=M4_bolt_hole, $fn=100, center=true);
      translate([0,14.5,53.51]) rotate([0,0,30]) cylinder(h=M5_nut_height, d=M5_nut_diam, $fn=6, center=true);
    }
    translate([0,20,45]) cube([40,1,1], center=true);
    translate([0,9,45]) cube([40,1,1], center=true);
  }
}

module 2020_x_axis_carriage_connector_right() {
  // Carriage plate
  difference() {
    translate([0, 2.75, 0]) rotate([0,90,0]) scale([1, .5, 1]) 2020_z_mount_spacer_a(tab = false);
    translate([ 17, 0, 0]) cube([3,15,41], center=true);
    translate([-17, 0, 0]) cube([3,15,41], center=true);
  }
  // Neck connecting clamp block to carriage plate
  difference() {
    translate([0,4,27.75]) cube([60,9,15.5], center=true);
    translate([ 23,0,30]) rotate([90,0,0]) cylinder(h=20,d=4.5, $fn=100, center=true);
    translate([-23,0,30]) rotate([90,0,0]) cylinder(h=20,d=4.5, $fn=100, center=true);
  }
  // block below belt clamp
  translate([0,12,27.25]) cube([40,15,14.5], center=true);
  // Belt clamps here
  translate([0, 10, 0]) {
    difference(){
      translate([0,14.5,27.25]) cube([40,12,14.5], center=true);
      translate([0,14.5,27]) rotate([0,0,0]) cylinder(h=22, d=M4_bolt_hole, $fn=100, center=true);
      translate([0,14.5,21.49]) rotate([0,0,30]) cylinder(h=M5_nut_height, d=M5_nut_diam, $fn=6, center=true);
    }
    translate([0,20,35]) cube([40,1,1], center=true);
    translate([0,9,35]) cube([40,1,1], center=true);
  }
}

module 2020_x_axis_carriage_rail_mount(passthrough=false) {
  difference() {
    union (){
      translate([2,0, 0]) cube([22,14,40], center=true);
      translate([-2, 0, 20]) rotate([0,0,270]) 10mm_rail_clamp(d=10.75, w=40, passthrough=passthrough);
    }
    translate([-4, 0, 0]) rotate([0,90,0]) scs10uu_holes();
    translate([-2, 0, 20]) rotate([0,0,270]) 10mm_rail_clamp_holes(d=10.75, w=40, extend=true, h1=false,, passthrough=passthrough);
  }
}

module 2020_x_axis_carriage() {
  rotate([0,90,0]) 2020_z_mount_spacer_a(tab = false);
  translate([ 32,-.5,0]) rotate([0,0,180]) 10mm_rail_clamp(d=10, w=40);
  translate([-32,-.5,0]) rotate([0,180,180]) 10mm_rail_clamp(d=10, w=40);
  difference() {
    translate([ 24,0,0]) rotate([0,0,180]) cube([16,13,40], center=true);
    translate([ 32,-.5,0]) rotate([0,0,180]) 10mm_rail_clamp_holes(d=10, w=40);
  }
  difference() {
    translate([-24,0,0]) rotate([0,0,180]) cube([16,13,40], center=true);
    translate([-32,-.5,0]) rotate([0,0,180]) 10mm_rail_clamp_holes(d=10, w=40);
  }
}

module 10mm_rail_clamp(d=11, w=40, passthrough=false) {
  wall=2;

  difference(){
    translate([0,0,0]) cylinder(h=w, d=d+(wall), $fn=200, center=true);
    10mm_rail_clamp_holes(d=d, w=w, passthrough=passthrough);
  }
}

module 10mm_rail_clamp_holes(d=11, w=40, h1=true, h2=true, extend=false, passthrough=false) {
  wall=2;
  // Remove space for the rod
  if (passthrough == true) {
    hole_depth = 2 * w;
    translate([0,0,0]) cylinder(h=hole_depth+1, d=d, $fn=200, center=true);
  } else {
    hole_depth = w;
    translate([0,0,0]) cylinder(h=hole_depth+1, d=d, $fn=200, center=true);
  }

  // Create the slit
  translate([0,d,0]) cube([1,d+1,w+1], center=true);
  if (extend == true) {
    translate([0, 1, w]) cube([1,d+1,w+1], center=true);
    translate([0, 1,-w]) cube([1,d+1,w+1], center=true);
    translate([0, d, w]) cube([1,d+1,w+1], center=true);
    translate([0, d,-w]) cube([1,d+1,w+1], center=true);
  }

  // create the bolt holes
  if (h1 == true) {
    translate([ 0, d*1.10,-10]) rotate([0,90,0]) cylinder(h=20, d=M4_bolt_hole, $fn=200, center=true);
    translate([ 6, d*1.10,-10]) rotate([0,90,0]) cylinder(h=4, d=M4_nut_diam*1.1, $fn=6, center=true);
    translate([-7, d*1.10,-10]) rotate([0,90,0]) cylinder(h=4, d=M4_nut_diam*1.1, $fn=200, center=true);
  }
  if (h2 == true) {
    translate([ 0, d*1.10, 10]) rotate([0,90,0]) cylinder(h=20, d=M4_bolt_hole, $fn=200, center=true);
    translate([ 6, d*1.10, 10]) rotate([0,90,0]) cylinder(h=4, d=M4_nut_diam*1.1, $fn=6, center=true);
    translate([-7, d*1.10, 10]) rotate([0,90,0]) cylinder(h=4, d=M4_nut_diam*1.1, $fn=200, center=true);
  }
}
