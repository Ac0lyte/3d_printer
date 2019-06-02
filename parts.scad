/* This files is just for creating images and stl for the different parts.
 * It is called from make and is not intended for direct usage. That said
 * it can be useful to preview only one part, and this is good for that.
 * Just set the PART variable to the name of the part you want to view.
 */

include <vars.scad>;

/* What to print */
PART = "height_lever";
SHOW = "part";

use <printer_parts.scad>;
use <2020_z_carriage.scad>;
use <pivot_nut_holder.scad>;

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

if (PART == "2020_rail_mount") {
    rotate([0,0,z]) 2020_rail_mount();
}

