/* TODO
  - Put all models in a lib and import that
  - Makefile that creates
    - all the STL files
    - Full printer images
    - animations
      - Z lift
      - X movement
      - Y movement
    - Zip file with everything

  - Models
    - Motors
      - NEMA 17
      - NEMA 23
    - Belt drive
      - Drive shaft
      - Drive gears
      - Pully gears
      - Lift connectors
    - DW-G system
      - Pullyss
      - Spools
      - wire
    - Extruder
    - Hotend
    - Spool Holder
    - Camera Mount
    - Wiring
    - Wire Holder
*/
/* Global */
include <vars.scad>;
//use <printer_parts.scad>;
include <parts.scad>;

/* What to print */
PART = "2020_mount_plate";
//PART = "bronze_bearing";
SHOW = "part";


/*  FRAME */
if (SHOW == "full") {
  color("Grey") {
      // uprights
      translate([frame_half,frame_half,height/2]) 2020_extrusion(height);
      translate([width+30,frame_half,height/2]) 2020_extrusion(height);
      translate([frame_half,depth+30,height/2]) 2020_extrusion(height);
      translate([width+30,depth+30,height/2]) 2020_extrusion(height);

      // bottom
      translate([frame_half,(depth/2)+frame_size,frame_half]) rotate([90,0,0]) 2020_extrusion(depth);
      translate([width+30,depth/2+frame_size,frame_half]) rotate([90,0,0]) 2020_extrusion(depth);
      translate([width/2+frame_size,frame_half,frame_half]) rotate([0,90,0]) 2020_extrusion(width);
      translate([width/2+frame_size,depth+30,frame_half]) rotate([0,90,0]) 2020_extrusion(width);

      // top
      translate([frame_half,(depth/2)+frame_size,height-frame_half]) rotate([90,0,0]) 2020_extrusion(depth);
      translate([width+30,depth/2+frame_size,height-frame_half]) rotate([90,0,0]) 2020_extrusion(depth);
      translate([width/2+frame_size,frame_half,height-frame_half]) rotate([0,90,0]) 2020_extrusion(width);
      translate([width/2+frame_size,depth+30,height-frame_half]) rotate([0,90,0]) 2020_extrusion(width);
  }


  // bottom corners
  color("DimGray") {
      translate([0, 0, 0]) rotate([0, 0, 0]) 2020_inside_3_way();
      translate([width+40, 0, 0]) rotate([0, 0, 90]) 2020_inside_3_way();
      translate([width+40, depth+40, 0]) rotate([0, 0, 180]) 2020_inside_3_way();
      translate([0, depth+40, 0]) rotate([0, 0, 270]) 2020_inside_3_way();

      translate([0, 0, 0]) rotate([0, 0, 0]) 2020_3_way_corner_plate();
      translate([width+40, 0, 0]) rotate([0, 0, 90]) 2020_3_way_corner_plate();
      translate([width+40, depth+40, 0]) rotate([0, 0, 180]) 2020_3_way_corner_plate();
      translate([0, depth+40, 0]) rotate([0, 0, 270]) 2020_3_way_corner_plate();
  }

  // top corners
  color("DimGray") {
      translate([0, 0, height]) rotate([180, 0, 90]) 2020_inside_3_way();
      translate([width+40, 0, height]) rotate([180, 0, 180]) 2020_inside_3_way();
      translate([width+40, depth+40, height]) rotate([180, 0, 270]) 2020_inside_3_way();
      translate([0, depth+40, height]) rotate([180, 0, 0]) 2020_inside_3_way();

      translate([0, 0, height]) rotate([180, 0, 90]) 2020_3_way_corner_plate();
      translate([width+40, 0, height]) rotate([180, 0, 180]) 2020_3_way_corner_plate();
      translate([width+40, depth+40, height]) rotate([180, 0, 270]) 2020_3_way_corner_plate();
      translate([0, depth+40, height]) rotate([180, 0, 0]) 2020_3_way_corner_plate();
  }


  /* X rails */
  translate([depth-35, width/2+frame_size ,height-frame_half]) rotate([90, 0, 0]) cylinder(h=depth, d=rail_diam, center=true);
  translate([75, width/2+frame_size ,height-frame_half]) rotate([90, 0, 0]) cylinder(h=depth, d=rail_diam, center=true);


  /* Y rails */



  /* Z rails */
  translate([frame_half, frame_size + (depth/2) - (z_rail_width/2) ,height/2]) cylinder(h=height-40, d=rail_diam, center=true);
  translate([frame_half, frame_size + (depth/2) + (z_rail_width/2) ,height/2]) cylinder(h=height-40, d=rail_diam, center=true);

  translate([width + frame_size + frame_half, frame_size + (depth/2) - (z_rail_width/2) ,height/2]) cylinder(h=height-40, d=rail_diam, center=true);
  translate([width + frame_size + frame_half, frame_size + (depth/2) + (z_rail_width/2) ,height/2]) cylinder(h=height-40, d=rail_diam, center=true);


  /* X rail frame mounts */
  color("SlateGray") {
      translate([75, frame_size, height - frame_half]) rotate([270, 0, 0]) 2020_rail_mount();
      translate([depth - 35, frame_size, height - frame_half]) rotate([270, 0, 0]) 2020_rail_mount();

      translate([75, width + frame_size, height - frame_half]) rotate([90, 0, 0]) 2020_rail_mount();
      translate([depth - 35, width + frame_size, height - frame_half]) rotate([90, 0, 0]) 2020_rail_mount();
  }


  /* Y rail frame mounts */


  /* Z rail frame mounts */
  color("SlateGray") {
      translate([frame_half, frame_size + width/2, frame_size]) rotate([0,0,90]) 2020_dual_rail_mount();
      translate([depth + 30, frame_size + width/2, frame_size]) rotate([0,0,90]) 2020_dual_rail_mount();
      translate([frame_half, frame_size + width/2, height-frame_size]) rotate([0,180,90]) 2020_dual_rail_mount();
      translate([depth + 30, frame_size + width/2, height-frame_size]) rotate([0,180,90]) 2020_dual_rail_mount();
  }


  /* X rail carriage mounts */


  /* Y rail carriage mounts */


  /* Z rail carriage mounts */
  animi=($t * 300) + 30;
  translate([0,0,animi]) {
    translate([frame_half, frame_size + width/2, 37.5]) rotate([0,0,270]) {
        color("green") {
            2020_rail_carriage_lift();
        }
        // 4 platform levelers/connectors
        height_lever();
        mirror([1,0,0]) height_lever();

        translate([200,45,0]) platform_corner();
        mirror([1,0,0]) translate([200,45,0]) platform_corner();

        color("white") {
            // 608zz bearings
            translate([170,36+0.1,0]) rotate([90,0,0]) 608zz_bearing();
            translate([-170,36+0.1,0]) rotate([90,0,0]) 608zz_bearing();
            // 608zz bearings
            translate([200,40,0]) rotate([90,0,0]) 608zz_bearing();
            translate([-200,40,0]) rotate([90,0,0]) 608zz_bearing();
        }
    }

    translate([frame_size + frame_half + width, frame_size + width/2 , 37.5]) rotate([0,0,90]) {
        color("green") {
            2020_rail_carriage_lift();
        }
        // 4 platform levelers/connectors
        height_lever();
        mirror([1,0,0]) height_lever();

        translate([200,45,0]) platform_corner();
        mirror([1,0,0]) translate([200,45,0]) platform_corner();

        color("white") {
            // 608zz bearings
            translate([170,36+0.1,0]) rotate([90,0,0]) 608zz_bearing();
            translate([-170,36+0.1,0]) rotate([90,0,0]) 608zz_bearing();
            // 608zz bearings
            translate([200,40,0]) rotate([90,0,0]) 608zz_bearing();
            translate([-200,40,0]) rotate([90,0,0]) 608zz_bearing();
        }
    }



    // glass frame
    glass_offset=5;
    color("Grey") {
        translate([frame_size+(width - glass_width)/2 - glass_offset,(depth/2)+frame_size,50]) rotate([90,0,0]) 2020_extrusion(glass_depth-(2*glass_offset));
        translate([frame_size+width-((width - glass_width)/2) + glass_offset,(depth/2)+frame_size,50]) rotate([90,0,0]) 2020_extrusion(glass_depth-(2*glass_offset));
        translate([(width/2)+frame_size,frame_size+(depth - glass_depth)/2 - glass_offset,50]) rotate([0,90,0]) 2020_extrusion(glass_width -(2*glass_offset)+ 40);
        translate([(width/2)+frame_size,frame_size+depth-((depth - glass_depth)/2) + glass_offset ,50]) rotate([0,90,0]) 2020_extrusion(glass_width -(2*glass_offset)+ 40);
    }

    // 4 inside connectors
    color("DimGray") {
        translate([
            frame_size + (width - glass_width)/2 + frame_half - glass_offset,
            frame_size+(depth - glass_depth)/2 + frame_half - glass_offset,
            50
        ]) rotate([0, 90, 0]) 2020_inside_l();

        translate([
            frame_size + width - (width - glass_width)/2 - frame_half + glass_offset,
            frame_size+(depth - glass_depth)/2 + frame_half - glass_offset,
            50
        ]) rotate([0, 90, 90]) 2020_inside_l();

        translate([
            frame_size + width - (width - glass_width)/2 - frame_half + glass_offset,
            frame_size + depth - (depth - glass_depth)/2 - frame_half + glass_offset,
            50
        ]) rotate([0, 90, 180]) 2020_inside_l();

        translate([
            frame_size + (width - glass_width)/2 + frame_half - glass_offset,
            frame_size + depth - (depth - glass_depth)/2 - frame_half + glass_offset,
            50
        ]) rotate([0, 90, 270]) 2020_inside_l();
    }

    // glass
    color("white") translate([frame_size + (depth - glass_depth)/2, frame_size + (width - glass_width)/2, 60])
    cube([glass_depth, glass_width, glass_height]);

    // 4 glass hold downs
    // 4 magnets
   }
}
