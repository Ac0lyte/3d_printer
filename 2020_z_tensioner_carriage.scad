
include <vars.scad>;
use <M5.scad>;

PART = "2020_z_tensioner_carriage_assembly";

if (PART == "2020_z_tensioner_carriage_assembly") {
  color("black",0.25)
    translate([0, 31.5, 0,]) rotate([90, 0, 0])
  M5_bolt(length=40, hex=true);
  color("orange",0.25) 2020_z_tensioner_carriage_axle();
  color("grey", 0,25)     40_2gt_10_drive();
  color(part_color,0.25) 2020_z_tensioner_carriage();
  color(part_color,0.25) translate([0,0,-15.5]) 2020_z_tensioner_slide();
}

if (PART == "2020_z_tensioner_carriage") {
  color(part_color) 2020_z_tensioner_carriage();
}


if (PART == "2020_z_tensioner_carriage_axle") {
  color(part_color) 2020_z_tensioner_carriage_axle();
}

if (PART == "2020_z_tensioner_slide") {
  color(part_color) 2020_z_tensioner_slide();
}


module 2020_z_tensioner_slide() {
  X_SIZE = 40;
  Y_SIZE = 50;
  Z_SIZE = 5;

  difference(){
    union(){
      // front
      translate([0, 0, 37]) cube([X_SIZE, Y_SIZE, 5], center=true);
      // side rails
      hull() {
        translate([ 17.75, 25, 3]) cube([4.5, 1, 1], center=true);
        translate([ 17.75, 0, 35]) cube([4.5, Y_SIZE, 1], center=true);
      }
      hull(){
        translate([-17.75, 25, 3]) cube([4.5, 1, 1], center=true);
        translate([-17.75, 0, 35]) cube([4.5, Y_SIZE, 1], center=true);

      }
      // top
      translate([0, 27.5, 21]) cube([X_SIZE, 5, 37], center=true);
    }
    // adjustment bolt hole
    translate([0, 27.5, 15.5]) rotate([90, 0, 0]) cylinder(h=10, d=M5_bolt_hole, $fn=100, center=true);

    // mounting holes
    translate([ 10, 20.5, 37]) rotate([0, 0, 90]) cylinder(h=6, d=M4_bolt_hole, $fn=100, center=true);
    translate([-10, 20.5, 37]) rotate([0, 0, 90]) cylinder(h=6, d=M4_bolt_hole, $fn=100, center=true);
  }
}

module 2020_z_tensioner_carriage() {
  X_SIZE = 30;
  Y_SIZE = 30;
  Z_SIZE = 5;

  difference(){
    union(){
      // flange side
      translate([0,0, -10]) cube([X_SIZE, Y_SIZE, Z_SIZE], center=true);
      translate([0, 0, 13]) cylinder(h=11, d=30, center=true);
      // non-flange side
      translate([0,0, 10]) cube([X_SIZE, Y_SIZE, Z_SIZE], center=true);
      // top
      hull(){
        translate([0, 17.5, 0]) cube([X_SIZE, 5, 25], center=true);
        translate([0, 20, 0]) sphere(d=10, center=true);
      }
    }

    // flange space
    hull() {
      translate([0, 0, 11]) cylinder(h=8, d=19, center=true);
      translate([0, -15, 11]) cylinder(h=8, d=19, center=true);
    }
    // axle space
    translate([0, 0, 3.5]) cylinder(h=33, d=9.8, $fn=100, center=true);
    // tension bolt hole
    translate([0, 20, 0]) rotate([90, 0, 0]) cylinder(h=13, d=M5_bolt_hole, $fn=100, center=true);
    translate([0, 16, 0]) rotate([90, 0, 0]) cylinder(h=M5_bolt_head_height+.5, d=M5_bolt_head_diam, $fn=6, center=true);
  }
}

module 2020_z_tensioner_carriage_axle(){
  translate([0, 0, 3]) cylinder(h=31, d=9.8, $fn=100, center=true);
}


module 40_2gt_10_drive(){
  gear_diam = 25.4648;
  gear_width = 11;

  edge_diam = 29;
  edge_width = 1.5;
  edge_offset = (gear_width + edge_width) /2;

  flange_diam = 18;
  flange_width = 7;
  flange_offset = (gear_width + flange_width) / 2 + edge_width;

  set_screw = 4;

  bore_diam = 10;
  bore_width = gear_width + flange_width + (2 * edge_width) + 1;

  teeth = (gear_diam * pi) / 2;
  t_ang = 360 / teeth;

  difference() {
    union(){
      // gear
      cylinder(d=gear_diam, h=gear_width, $fn=teeth*2, center=true);

      // sides/edges
      translate([0, 0, edge_offset]) cylinder(d=edge_diam, h=edge_width, $fn=200, center=true);
      translate([0, 0,-edge_offset]) cylinder(d=edge_diam, h=edge_width, $fn=200, center=true);

      // flange
      translate([0, 0, flange_offset]) cylinder(d=flange_diam, h=flange_width, $fn=200, center=true);
    }

    // bore
    translate([0, 0, flange_width/2]) cylinder(d=bore_diam, h=bore_width, $fn=200, center=true);

    // set screw holes
    translate([flange_diam/2, 0, flange_offset]) rotate([0, 90 ,0])
        cylinder(h=flange_diam/2, d=set_screw, $fn=100, center=true);
    translate([0, flange_diam/2, flange_offset]) rotate([90, 90 ,0])
        cylinder(h=flange_diam/2, d=set_screw, $fn=100, center=true);

    // teeth
    for (i=[1:teeth]) {
      x = sin(i * t_ang) * (gear_diam / 2);
      y = cos(i * t_ang) * (gear_diam / 2);
      translate([x, y, 0]) cylinder(d=1, h=gear_width, $fn=6, center=true);
    }

  }

}
