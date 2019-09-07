/* This files is just for creating images and stl for the different parts.
 * It is called from make and is not intended for direct usage. That said
 * it can be useful to preview only one part, and this is good for that.
 * Just set the PART variable to the name of the part you want to view.
 */

include <vars.scad>;

include <printer_parts.scad>;
include <M5.scad>;
include <g2.scad>;
include <glass_holder_corner.scad>;
include <bronze_bearing.scad>;
include <linear_bearings.scad>;
include <pivot_nut_holder.scad>;
include <height_lever.scad>;
include <608zz_bearing.scad>;
include <v6_j_type_hotend.scad>;

include <y_carriage_hotend.scad>;
include <rail_y_pulley_mount.scad>;
include <y_carriage_belt_clamp.scad>
include <2020_y_pulley_mount.scad>
include <2020_y_pulley_tensioner.scad>;
include <tension_knob.scad>;
include <rail_end_stop.scad>;

include <2020_extrusion.scad>;
include <2020_corner_plate.scad>;
include <2020_rail_mount.scad>;
include <2020_bronze_bearing_holder.scad>;
include <2020_mount_plate.scad>;
include <2020_ps_mount.scad>;
include <2020_AC_Socket_IEC320_C14.scad>;
include <2020_dual_connector.scad>;

include <2020_x_axis_carriage.scad>;
include <2020_x_pulley_mount.scad>;

include <2020_z_pulley_mount.scad>;
include <2020_z_carriage.scad>;
include <2020_z_carriage_belt_clamp.scad>;
include <2020_z_tensioner_carriage.scad>;
include <2020_z_mount_spacer.scad>;

/* What to print */
PART = "pivot_nut_holder";
SHOW = "part";

z = $t + 0;

if (PART == "2020_inside_l") {
    rotate([0,0,180 + z]) 2020_inside_l();
}

if (PART == "2020_inside_3_way") {
    rotate([0,0,z]) 2020_inside_3_way();
}

if (PART == "2020_3_way_corner_plate") {
    rotate([0,0,180 + z]) 2020_3_way_corner_plate();
}

if (PART == "2020_rail_carriage_lift") {
    rotate([0,0,180 + z]) 2020_rail_carriage_lift();
}

if (PART == "height_lever") {
    rotate([0,0,180 + z]) height_lever();
}

if (PART == "platform_corner") {
    rotate([0,0,z]) platform_corner();
}

if (PART == "2020_rail_lift") {
    rotate([0,0,180 + z]) 2020_rail_lift();
}

if (PART == "2020_dual_rail_lift") {
    rotate([0,0,180] + z) 2020_dual_rail_lift();
}
