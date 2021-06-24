// Units are mm.

use <common.scad>;
use <hub-gusset.scad>;
use <tube.scad>;

// Hub gussets.
translate([0, 0, tube_height() / 2])
    hub_gusset();
translate([0, 0, -tube_height() / 2])
    hub_gusset();

// Forward-aligned tube.
len = tube_width() + center_to_motor() * 2 + bolt_radial_position() * 2;
h0 = tube_width() / 2;
h1 = h0 + center_to_motor();
h2 = h1 + 2 * bolt_radial_position();
center = h2 - bolt_radial_position();
h3 = h2 + center_to_motor();
h4 = center - web_dx();
h5 = center + web_dx();
tube(length = len, top_bolts = [h0, h1, h2, h3, h4, h5]);
