# svg2love

Proof of concept *perl* script to convert simple SVGs to [LÖVE](https://love2d.org/wiki/Main_Page) graphic drawing commands.

## Motivation

Take the output of [primitive](https://github.com/fogleman/primitive) and place it in LÖVE, to enable easy graphics for [Zomia](https://github.com/globalcitizen/zomia), a roguelike game I am writing to learn Lua.

## Approach

Simple line-oriented parser that converts one command at a time to LÖVE graphics environment directives. Does not respect unrecognized primitives.

## Status

Currently, the script only recognizes rectangles, arbitrary-point polygons, ellipses (and circles drawn as ellipses), and these are all assumed to be filled. Colours are opacity are respected, and SVG groups (including rotation, translation and scaling) are supported.

Primitive has the following output modes:

 * 0: Combo mode: a combination of all shapes. __Not working__.
 * 1: __Triangle mode: use only triangles (three point polygons).__
 * 2: Rectangle mode: use only axis-aligned rectangles. __Not working__.
 * 3: __Ellipse mode: use only ellipses.__
 * 4: __Circle mode: use only regular circules.__
 * 5: Rotated rectangle mode: use rotated rectangles. __Not working__.
