// https://www.applied-motion.com/news/2015/10/what-do-nema-sizes-mean
// http://blog.inventables.com/p/stepper-motors.html
// http://www.massmind.org/techref/io/stepper/nemasizes.htm

// A = motor width
// B = mount screw spacing
// C = mount screw diam
// D = Shaft diam
// E = Pilot diam (round part on moter face)
// F = Pilot height

PART = "NEMA17";

if (PART == "NEMA17") {
  nema_stepper(nema_size = 17, height = 30);
}
if (PART == "NEMA17_HOLES") {
  nema_stepper_holes(17,15);
}

/* ========================================================= */
/* FUNCTIONS                                                 */
/* ========================================================= */

function NEMA_A(nema_size) = nema_size == 11 ? 28.2 : (
                             nema_size == 14 ? 35.2 : (
                             nema_size == 17 ? 42.3 : (
                             nema_size == 23 ? 56.4 : (
                             nema_size == 34 ? 86   : (
                             nema_size == 42 ? 110  : 0
                            )))));

function NEMA_B(nema_size) = nema_size == 11 ? 23   : (
                             nema_size == 14 ? 26   : (
                             nema_size == 17 ? 31   : (
                             nema_size == 23 ? 47.1 : (
                             nema_size == 34 ? 69.6 : (
                             nema_size == 42 ? 89   : 0
                            )))));

function NEMA_C(nema_size) = nema_size == 11 ? 2.5 : (
                             nema_size == 14 ? 3   : (
                             nema_size == 17 ? 3   : (
                             nema_size == 23 ? 5.5 : (
                             nema_size == 34 ? 5.5  : (
                             nema_size == 42 ? 8.5  : 0
                            )))));

function NEMA_D(nema_size) = nema_size == 11 ? 5    : (
                             nema_size == 14 ? 5    : (
                             nema_size == 17 ? 5    : (
                             nema_size == 23 ? 6.35 : (
                             nema_size == 34 ? 14   : (
                             nema_size == 42 ? 19   : 0
                            )))));

function NEMA_E(nema_size) = nema_size == 11 ? 22   : (
                             nema_size == 14 ? 22   : (
                             nema_size == 17 ? 22   : (
                             nema_size == 23 ? 38.1 : (
                             nema_size == 34 ? 73   : (
                             nema_size == 42 ? 55.5 : 0
                            )))));

function NEMA_F(nema_size) = nema_size == 11 ? 2   : (
                             nema_size == 14 ? 2   : (
                             nema_size == 17 ? 2   : (
                             nema_size == 23 ? 1.6 : (
                             nema_size == 34 ? 1.6 : (
                             nema_size == 42 ? 1.6 : 0
                            )))));

// nema size is a parameter for the next fuctions incase
// I can find good documentation for these dimentions.
function nema_shaft_length(nema_size) = 25;
function nema_shaft_cut_length(nema_size) = 20;

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module nema_stepper(nema_size, height, mount_hole_depth = 5) {
  A = NEMA_A(nema_size);
  B = NEMA_B(nema_size);
  C = NEMA_C(nema_size);
  shaft_diam = NEMA_D(nema_size);
  E = NEMA_E(nema_size);
  F = NEMA_F(nema_size);

  shaft_length = nema_shaft_length(nema_size);
  shaft_cut_length = nema_shaft_cut_length(nema_size);

  a = A/2;
  b = B/2;

  // main body
  corner_diam = (A - B);
  corner_offset = a - (corner_diam/2);
  difference() {
    union(){
      hull(){
        translate([-corner_offset, -corner_offset, 0]) cylinder(h=height, d=corner_diam, $fn=60, center=true);
        translate([-corner_offset,  corner_offset, 0]) cylinder(h=height, d=corner_diam, $fn=60, center=true);
        translate([ corner_offset, -corner_offset, 0]) cylinder(h=height, d=corner_diam, $fn=60, center=true);
        translate([ corner_offset,  corner_offset, 0]) cylinder(h=height, d=corner_diam, $fn=60, center=true);
      }

      // Pilot
      translate([0,0,(height/2)+(F/2)]) cylinder(h=F, d=E, $fn=60, center=true);

      // Shaft
      translate([0,0,(height/2)+(shaft_length/2)])
      difference() {
        cylinder(h=shaft_length, d=shaft_diam, $fn=60, center=true);
        translate([shaft_diam/1.33, 0, shaft_length - shaft_cut_length])
          cube([shaft_diam, shaft_diam, shaft_cut_length], center=true);
      }
    }
    // mount screw holes
    mount_hole_offset = (height/2) - (mount_hole_depth/2);
    translate([-b, -b, mount_hole_offset]) cylinder(h=mount_hole_depth + .1, d=C, $fn=60, center=true);
    translate([-b,  b, mount_hole_offset]) cylinder(h=mount_hole_depth + .1, d=C, $fn=60, center=true);
    translate([ b, -b, mount_hole_offset]) cylinder(h=mount_hole_depth + .1, d=C, $fn=60, center=true);
    translate([ b,  b, mount_hole_offset]) cylinder(h=mount_hole_depth + .1, d=C, $fn=60, center=true);

    // corner indents
    indent_height = height - 10;
    translate([-a, -a, 0]) cylinder(h=indent_height, d=corner_diam * 2, $fn=60, center=true);
    translate([-a,  a, 0]) cylinder(h=indent_height, d=corner_diam * 2, $fn=60, center=true);
    translate([ a, -a, 0]) cylinder(h=indent_height, d=corner_diam * 2, $fn=60, center=true);
    translate([ a,  a, 0]) cylinder(h=indent_height, d=corner_diam * 2, $fn=60, center=true);
  }

}

// remove this for nema stepper mounting holes
// nema_size  = NEMA moror size
// hole_depth = depth of screw holes in mm
// extra = extra space added to all hole diameters
//         to offset printer overflow

module nema_stepper_holes(nema_size, hole_depth=10, extra=1, pilot_extra=0.1) {
  B = NEMA_B(nema_size);
  C = NEMA_C(nema_size);
  E = NEMA_E(nema_size);
  F = NEMA_F(nema_size);

  shaft_diam = NEMA_D(nema_size);
  shaft_length = nema_shaft_length(nema_size);

  b = B/2;

  // mount screw holes
  translate([-b, -b, hole_depth/2]) cylinder(h=hole_depth+0.1, d=C + extra, $fn=60, center=true);
  translate([-b,  b, hole_depth/2]) cylinder(h=hole_depth+0.1, d=C + extra, $fn=60, center=true);
  translate([ b, -b, hole_depth/2]) cylinder(h=hole_depth+0.1, d=C + extra, $fn=60, center=true);
  translate([ b,  b, hole_depth/2]) cylinder(h=hole_depth+0.1, d=C + extra, $fn=60, center=true);

  // pilot hole
  translate([0,0,F/2]) cylinder(h=F+pilot_extra, d=E + extra, $fn=60, center=true);

  // shaft hole
  translate([0,0,shaft_length/2]) cylinder(h=shaft_length, d=shaft_diam + extra, $fn=60, center=true);

}
