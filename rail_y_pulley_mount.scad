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
include <linear_bearings.scad>;
use <M5.scad>;
use <g2.scad>;

PART = "rail_y_pulley_mount_assembly";
brace_thickness = 0;
/***************************************************************/

if (PART == "rail_y_pulley_mount_assembly") {
  rotate([0,0,90]) {
    color(part_color) rail_y_pulley_mount();
    translate([9, 30, 16]) pulley_assembly();
    translate([37, 30, 16]) pulley_assembly();
    translate([49, 16, 16]) pulley_assembly();

  }

  rotate([0,0,90]) {
    translate([0, 80, 0]) rotate([0, 0, 180]) {
      color(part_color) rail_y_pulley_mount(rail_end="far");
      translate([-23, 22, 16]) pulley_assembly();
    }
  }

}

if (PART == "rail_y_pulley_mount") {
  rotate([0,0,90]) {
    color(part_color)
    rail_y_pulley_mount();
  }
}

if (PART == "rail_y_pulley_mount_far") {
  rotate([0,0,90]) {
    color(part_color)
    rail_y_pulley_mount(rail_end="far");
  }
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module pulley_assembly() {
  pully_height = 5;
  pully_width=6.5;
  washer_height = (brace_thickness + 1)/2;
  nut_height = 0 - (brace_thickness + M5_nut_height)/2;
  bolt_length = 25;
  bolt_height = (M5_bolt_head_height)/2;

  color("black", 0.25) {
    translate([0, 0, bolt_height]) M5_bolt(l=bolt_length);
    translate([0, 0, washer_height+pully_width+3]) M5_washer();
    translate([0, 0, nut_height]) M5_nut();
    //translate([0, 0, washer_height]) M5_washer();
  }
  color("red", 0.5) {
    translate([0, 0, pully_height]) g2_smooth_pulley(h=pully_width);
  }
}

/***************************************************************/
// diff
//    translate([0, 0, 5]) cube([10, 5, 24], center=true);
//    translate([3, 0, 3.5]) cube([6, 6, 7], center=true);

module rail_y_pulley_mount(rail_end="near") {
  tounge_width = 48;
  tounge_depth = 14;
  toung_height = 7;

  riser_width = 48;
  riser_depth = 7;
  riser_height = 24;

  shelf_width = 94;
  shelf_depth = 18;
  shelf_height = 5;

  base_width = 94;
  base_depth = tounge_depth + shelf_depth;
  base_height = 7;

  riser_offset = (riser_height-base_height)/2;
  shelf_offset = riser_height - ((base_height + shelf_height)/2);

  union() {
    // bolt on tounge
    difference(){
      cube([tounge_width, tounge_depth, toung_height], center=true);
      translate([0, tounge_depth+1, 0])  rotate([90, 0, 90]) scs10uu_holes();
    }

    // riser
    translate([0, tounge_depth-(riser_depth/2), riser_offset]) cube([riser_width, riser_depth, riser_height], center=true);

    // shelf
    if (rail_end == "far") {
      difference() {
        union(){
          hull(){
            translate([0, tounge_depth-(riser_depth/2), shelf_offset]) cube([riser_width, riser_depth, shelf_height], center=true);

            translate([-23, 22, shelf_offset]) cylinder(h=shelf_height, d=18, $fn=100, center=true);
            // only needed for printing
            // translate([15, 17, shelf_offset]) cylinder(h=shelf_height, d=18, $fn=100, center=true);
          }
          translate([-23, 22, shelf_offset+(shelf_height/2)]) cylinder(h=1, d=M5_bolt_hole+2, $fn=100, center=true);
        }
        // bolt hole
        translate([-23, 22, shelf_offset]) cylinder(h=shelf_height+2, d=M5_bolt_hole, $fn=100, center=true);
      }
    } else {
      difference() {
        union(){
          hull(){
            translate([0, tounge_depth-(riser_depth/2), shelf_offset]) cube([riser_width, riser_depth, shelf_height], center=true);

            translate([9, 30, shelf_offset]) cylinder(h=shelf_height, d=18, $fn=100, center=true);
            translate([37, 30, shelf_offset]) cylinder(h=shelf_height, d=18, $fn=100, center=true);
            translate([49, 16, shelf_offset]) cylinder(h=shelf_height, d=18, $fn=100, center=true);
            // only needed for printing
            // translate([-15, 30, 1shelf_offset3]) cylinder(h=5, d=18, $fn=100, center=true);
          }
          translate([9, 30, shelf_offset+(shelf_height/2)]) cylinder(h=1, d=M5_bolt_hole+2, $fn=100, center=true);
          translate([37, 30, shelf_offset+(shelf_height/2)]) cylinder(h=1, d=M5_bolt_hole+2, $fn=100, center=true);
          translate([49, 16, shelf_offset+(shelf_height/2)]) cylinder(h=1, d=M5_bolt_hole+2, $fn=100, center=true);
        }
        // bolt holes
        translate([9, 30, shelf_offset]) cylinder(h=shelf_height+2, d=M5_bolt_hole, $fn=100, center=true);
        translate([37, 30, shelf_offset]) cylinder(h=shelf_height+2, d=M5_bolt_hole, $fn=100, center=true);
        translate([49, 16, shelf_offset]) cylinder(h=shelf_height+2, d=M5_bolt_hole, $fn=100, center=true);
      }
    }
  }
}
