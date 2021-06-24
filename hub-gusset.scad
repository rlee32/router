// Units are mm.

use <common.scad>;

arm_count = 8;

module hub_gusset() {
    difference() {
        circle(r = edge_radius(), $fn = 50);
        for (i = [0: 1: arm_count])
            rotate([0, 0, i * 360 / arm_count])
                translate([bolt_radial_position(), 0, 0])
                    circle(r = bolt_diam() / 2, $fn = 20);
    }
}

hub_gusset();
