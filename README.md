# svg2love

Proof of concept *perl* script to convert simple SVGs to [LÖVE](https://love2d.org/wiki/Main_Page) graphic drawing commands.

## Motivation

Take the output of [primitive](https://github.com/fogleman/primitive) and place it in LÖVE, to enable easy graphics for [Zomia](https://github.com/globalcitizen/zomia), a roguelike game I am writing to learn Lua.

## Approach

Simple line-oriented parser that converts one command at a time to LÖVE graphics environment directives. Does not respect unrecognized primitives.

## Status

Currently, the script only recognizes rectangles, arbitrary-point polygons, ellipses (and circles drawn as ellipses), and these are all assumed to be filled. Colours are opacity are respected, and SVG groups (including rotation, translation and scaling) are supported.

## Usage

You need *perl* installed. This is normal on any type of Unix-like, including MacOSX. On Windows you can install it easily enough as well.

Then, run the script as follows:

```
svg2love file.svg >>some.lua
```

This will read `file.svg`, show some debugging information, and add the translated LÖVE code output to the file `some.lua`. (You can shut the debug up by adding `2>/dev/null` before the `>>`.)

## Notes

SVGs can have data that goes beyond the border of their defined image boundary. Primitive generates SVGs of this type. In order to display these cleanly, take a look at [love.graphics.setScissor()](https://love2d.org/wiki/love.graphics.setScissor).

## Demo

A demonstration in the `demo` subdirectory includes loading the generated drawing commands from a lua source file, scaling them to an arbitrary window size and displaying them.

You will need to have [LÖVE](https://love2d.org/wiki/Main_Page) installed to run it.

To run it on Unix-like systems, enter the directory and type:
```
love .
```
