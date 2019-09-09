
include <vars.scad>;
use <2020_mount_plate.scad>;
use <g2.scad>;
use <nema_stepper.scad>;

PART = "2020_nema_mount_assembly";

if (PART == "2020_nema_mount_assembly"){
  motor_offset = 30;
  motor_height = 30;
  mount_depth = 5;
  nema_size = 17;
  pully_height = 6.5;
  pully_x = 9.5;
  pully_y = 27;

  translate([0, 0, motor_offset + (motor_height/2) + mount_depth]) rotate([180,0,0])
  color("orange", 0.25) nema_stepper(17, motor_height);

  color("red", 0.25) {
    // main pully
    translate([0, 0, motor_offset - pully_height - 3]) g2_smooth_pulley();
    // guide pullys
    translate([ pully_x, pully_y, motor_offset - pully_height - 3]) g2_smooth_pulley();
    translate([-pully_x, pully_y, motor_offset - pully_height - 3]) g2_smooth_pulley();
  }

  // motor mount
  color(part_color)
  2020_nema_mount(
    nema_size = nema_size,
    mount_depth = mount_depth,
    motor_offset = motor_offset,
    pully_x = pully_x,
    pully_y = pully_y
  );
}

if (PART == "2020_nema_mount"){
  color(part_color)
  2020_nema_mount();
}


/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

// A = NEMA moter sides (x and y)
// 30 == motor face height above 20202 rail.
//       motor facin down


module 2020_nema_mount(
  nema_size = 17,
  mount_depth=4,
  motor_offset=30,
  pully_x = undef,
  pully_y = undef
) {

  A = NEMA_A(nema_size);
  a = A/2;
  plate_width = 20;

  translate([0,0,motor_offset + (mount_depth/2)])
  difference(){
    union() {
      nema_mount_plate(
        nema_size = nema_size,
        mount_depth = mount_depth,
        pilot_extra=5,
        pully_x = pully_x,
        pully_y = pully_y
      );
      hull(){
        translate([0, a, 0]) cube([A, 1, mount_depth], center=true);
        translate([ pully_x, pully_y, 0])
            cylinder(h=mount_depth, d=M5_nut_diam+4, $fn=60, center=true);
        translate([-pully_x, pully_y, 0])
            cylinder(h=mount_depth, d=M5_nut_diam+4, $fn=60, center=true);
      }
    }

    // nut holes
    nut_offset = 0;
    translate([ pully_x, pully_y, nut_offset]) {
      cylinder(h=M5_nut_height + 0.1, d=M5_nut_diam, $fn=6, center=true);
      cylinder(h=mount_depth * 2, d=M4_bolt_hole, $fn=60, center=true);
    }
    translate([-pully_x, pully_y, nut_offset]) {
      cylinder(h=M5_nut_height + 0.1, d=M5_nut_diam, $fn=6, center=true);
      cylinder(h=mount_depth * 2, d=M4_bolt_hole, $fn=60, center=true);
    }
  }

  // 2020 mount plate
  translate([a + (plate_width/2), 0, 0]) difference() {
    cube([plate_width, plate_width, mount_depth], center=true);
    cylinder(h=mount_depth+0.1, d=M4_bolt_hole, $fn=60, center=true);
  }
  // riser
  hull() {
    translate([a, 0, motor_offset + (mount_depth/2)])
        cube([4, A, mount_depth], center=true);
    translate([a + 2, 0, 0])
      cube([4,plate_width , mount_depth], center=true);
  }

  // 2020 mount plate
  translate([0-(a + (plate_width/2)), 0, 0]) difference() {
    cube([plate_width, plate_width, mount_depth], center=true);
    cylinder(h=mount_depth+0.1, d=M4_bolt_hole, $fn=60, center=true);
  }
  // riser
  hull() {
    translate([-a, 0, motor_offset + (mount_depth/2)])
        cube([4, A, mount_depth], center=true);
    translate([-(a + 2), 0, 0])
      cube([4,plate_width , mount_depth], center=true);
  }
}

module nema_mount_plate(
  nema_size = 17,
  mount_depth=4,
  pilot_extra=0.1,
  pully_x,
  pully_y
) {

  A = NEMA_A(nema_size);
  difference(){
    cube([A, A, mount_depth], center=true);

    // pilot
    translate([0, 0, -(mount_depth/2)])
        nema_stepper_holes(nema_size, pilot_extra = pilot_extra);
  }
}
