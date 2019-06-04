/* Makefile needs */
PART = "none";
IMAGE = "none";

/* frame */
height = 690;
width = 500;
depth = 500;

frame_size = 20;
frame_half = frame_size / 2;

glass_height = 3;
glass_width = 400;
glass_depth = 400;

rail_diam = 10;
z_rail_width = 60;
z_carriage_width = z_rail_width + frame_size;

// Sources for Metric fastener dimensions
// http://www.carbidedepot.com/formulas-tap-metric.htm
// http://www.roymech.co.uk/Useful_Tables/Screws/cap_screws.htm
// https://www.fairburyfastener.com/xdims_metric_nuts.htm

// M5
M5_bolt_diam = 5;
M5_bolt_hole = 5.5;
M5_nut_height = 4;
M5_nut_width = 7.9;
M5_nut_diam = 9;

// M4
M4_bolt_diam = 4;
M4_bolt_hole = 4.5;
M4_nut_height = 3.5;
M4_nut_width = 6.9;
M4_nut_diam = 8;


//608zz
608zz_height=7;
608zz_od=22;
608zz_id=8;
608zz_race=11;



// Height adjustment
pivot_diam=12;
height_bolt_diam=M4_bolt_diam;
