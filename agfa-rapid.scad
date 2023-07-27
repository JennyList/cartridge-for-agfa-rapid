/*
A cartridge for Agfa Rapid cameras
Jenny List 2023
CC-BY-SA 4.0

At the bottom of the file you'll find the commands to render the parts you'll need.

RapidCartridge(iso) is the cartridge shell. Look at the code for ISOtab() for values of iso.

RapidCartridgeLid() is the cartridge end. You'll need two of these mirrored.

These two functions are internal.
FilmSlideRing() is the ring inside the cartridge to reduce friction
ISOtab(iso=25) is the tab component
*/


module FilmSlideRing(){ //thin ring for film to slide on
    difference(){
        cylinder(2,13.05,13.05,$fn=120,true);
        //translate([0,0,1]) cylinder(1,11.05,12.05,$fn=120,true); //upper bevel
        translate([0,0,0.5])cylinder(1,11.05,11.05,$fn=120,true); //main ring
        translate([0,0,-0.5]) cylinder(1,12.05,11.05,$fn=120,true); //lower bevel for 3d printing
    }
}

module ISOtab(iso=25){
    if(iso==25){
        //tabLength is 0;
        //render nothing
    }
    if(iso==32){
        translate([0,-0.25,0]) cube([1,0.5,3.2],true);
    }
    if(iso==40){
        translate([0,-0.5,0]) cube([1,1,3.2],true);
    }
    if(iso==50){
        translate([0,-0.75,0]) cube([1,1.5,3.2],true);
    }
    if(iso==65){
        translate([0,-1,0]) cube([1,2,3.2],true);
    }
    if(iso==80){
        translate([0,-1.25,0]) cube([1,2.5,3.2],true);
    }
    if(iso==100){
        translate([0,-1.5,0]) cube([1,3,3.2],true);
    }
    if(iso==125){
        translate([0,-1.75,0]) cube([1,3.5,3.2],true);
    }
    if(iso==160){
        translate([0,-2,0]) cube([1,4,3.2],true);
    }
    if(iso==200){
        translate([0,-2.25,0]) cube([1,4.5,3.2],true);
    }
    if(iso==250){
        translate([0,-2.5,0]) cube([1,5,3.2],true);
    }
    if(iso==320){
        translate([0,-2.75,0]) cube([1,5.5,3.2],true);
    }
    if(iso==400){
        translate([0,-3,0]) cube([1,6,3.2],true);
    }
}

module RapidCartridgeLid(){
    difference(){
        union(){
            cylinder(1,13.05,13.05,$fn=120,true); //flat lid
            translate([12.55,7,0])cube([1,14,1],true); //tangent at right angles
            rotate([0,0,4.3]) translate([7,12.55,0])cube([13,1,1],true); //tangent at a slight angle.
            translate([6.5,6.5,0]) cube([13,13,1],true); //Cube to fill in the hole
            translate([0,0,1.5]) cylinder(2,12.05,12.05,$fn=120,true);// protrusion
        }
        translate([0,0,1.5]) cylinder(2,11.25,11.25,$fn=120,true); //carve out the middle.
        rotate([0,0,7]) translate([7,8.5,1.5])cube([13,5.5,2],true); //tangent at a slight angle.
    }
}

module RapidCartridge(iso=25){
    difference(){
        union(){
            difference(){
                union(){
                    cylinder(37,13.05,13.05,$fn=120,true); //main cylinder
                    translate([12.55,7,0])cube([1,14,37],true); //tangent at right angles
                    rotate([0,0,4.3]) translate([7,12.55,0])cube([13,1,37],true); //tangent at a slight angle.
                    translate([6.5,6.5,0]) cube([13,13,37],true); //Cube to fill in the hole
                }
                cylinder(37,12.05,12.05,$fn=120,true);  //Carve out space for film
                translate([13.2,-1.3,0])cube([1.4,10,14],true); //iso space
            }
            // Rings to reduce friction on film
            translate([0,0,15]) FilmSlideRing();
            translate([0,0,-15]) FilmSlideRing();
            translate([12.6,3.7,0]) ISOtab(iso); //ISO tab
        }
        rotate([0,0,9]) translate([7,10.25,0])cube([16,1.5,37],true); //film guide
        translate([5,10,0])cube([2,2,37],true);//remove pointed ends on rings
    }
}

translate([0,0,18.5]) RapidCartridge(100);
translate([28,0,0.5]) RapidCartridgeLid();
mirror ([0,1,0]) translate([0,28,0.5]) RapidCartridgeLid();

