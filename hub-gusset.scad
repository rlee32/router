// Units are mm.

use <common.scad>;

edge_radius = i2mm(1);
bolt_radius = i2mm(0.75);

module hub_gusset() {
    difference() {
        circle(r = edge_radius, $fn = 50);
        for (i = [0: 1: arm_count()])
            rotate([0, 0, i * 360 / arm_count()])
                translate([bolt_radius, 0, 0])
                    circle(r = bolt_diam() / 2, $fn = 20);
    }
}

hub_gusset();
