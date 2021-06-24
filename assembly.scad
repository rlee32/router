// Units are mm.

use <common.scad>;
use <hub-gusset.scad>;

translate([0, 0, tube_height() / 2])
    hub_gusset();
translate([0, 0, -tube_height() / 2])
    hub_gusset();
