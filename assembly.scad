// Units are mm.

use <common.scad>;
use <hub-gusset.scad>;
use <long-web.scad>;
use <lat-web.scad>;
use <tube.scad>;

module hub_gussets() {
    translate([0, 0, tube_height() / 2])
        linear_extrude(height = gusset_thickness())
            hub_gusset();
    translate([0, 0, -tube_height() / 2 - gusset_thickness()])
        linear_extrude(height = gusset_thickness())
            hub_gusset();
}
hub_gussets();

module forward_tube() {
    len = tube_width() + center_to_motor() * 2 + bolt_radial_position() * 2;
    h0 = tube_width() / 2;
    h1 = h0 + center_to_motor();
    h2 = h1 + 2 * bolt_radial_position();
    center = h2 - bolt_radial_position();
    h3 = h2 + center_to_motor();
    h4 = center - web_dx();
    h5 = center + web_dx();
    tube(length = len, top_bolts = [h0, h1, h2, h3, h4, h5]);
}
forward_tube();

lateral_tube_len = tube_width() + center_to_motor() - bolt_radial_position();
module lateral_tube() {
    h0 = tube_width() / 2;
    h1 = h0 + web_dx() - bolt_radial_position();
    h2 = lateral_tube_len - tube_width() / 2;
    tube(length = lateral_tube_len, top_bolts = [h0, h1, h2]);
}
rotate([0, 0, 90])
    translate([0, lateral_tube_len / 2 - tube_width() / 2 + bolt_radial_position(), 0])
        lateral_tube();
rotate([0, 0, -90])
    translate([0, lateral_tube_len / 2 - tube_width() / 2 + bolt_radial_position(), 0])
        lateral_tube();

module diagonal_tube() {
    h0 = tube_width() / 2;
    h1 = h0 + web_dx() * sqrt(2) - bolt_radial_position();
    h2 = lateral_tube_len - tube_width() / 2;
    tube(length = lateral_tube_len, top_bolts = [h0, h1, h2]);
}
for (i = [0:3])
    rotate([0, 0, 45 + 90 * i])
        translate([0, lateral_tube_len / 2 - tube_width() / 2 + bolt_radial_position(), 0])
            diagonal_tube();

module rotor() {
    cylinder(h = i2mm(1/16), d = rotor_diam(), center = true);
}
for (i = [0:7])
    rotate([0, 0, 45 + 45 * i]) {
        nominal_height = i2mm(1);
        if (i % 2 == 0) {
            translate([0, center_to_motor(), -nominal_height])
                rotor();
        } else {
            translate([0, center_to_motor(), nominal_height])
                rotor();
        }
    }

module long_webs() {
    translate([-web_dx(), 0, tube_height() / 2])
        linear_extrude(height = gusset_thickness())
            long_web();
    translate([-web_dx(), 0, -tube_height() / 2 - gusset_thickness()])
        linear_extrude(height = gusset_thickness())
            long_web();
    translate([web_dx(), 0, tube_height() / 2])
        linear_extrude(height = gusset_thickness())
            long_web();
    translate([web_dx(), 0, -tube_height() / 2 - gusset_thickness()])
        linear_extrude(height = gusset_thickness())
            long_web();
}
long_webs();

module lat_webs() {
    translate([0, -web_dx(), tube_height() / 2 + gusset_thickness()])
        linear_extrude(height = gusset_thickness())
            rotate([0, 0, 90])
                lat_web();
    translate([0, -web_dx(), -tube_height() / 2 - 2 * gusset_thickness()])
        linear_extrude(height = gusset_thickness())
            rotate([0, 0, 90])
                lat_web();
    translate([0, web_dx(), tube_height() / 2 + gusset_thickness()])
        linear_extrude(height = gusset_thickness())
            rotate([0, 0, 90])
                lat_web();
    translate([0, web_dx(), -tube_height() / 2 - 2 * gusset_thickness()])
        linear_extrude(height = gusset_thickness())
            rotate([0, 0, 90])
                lat_web();
}
lat_webs();
