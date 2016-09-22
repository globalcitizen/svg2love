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

SVGs can have data that goes beyond the border of their defined image boundary. Primitive generates SVGs of this type. In order to display these cleanly, take a look at the demo code, which uses [love.graphics.setScissor()](https://love2d.org/wiki/love.graphics.setScissor) to draw to a specific area of the screen, and coordinate system manipulation to properly scale and crop the image.

## Demo

A demonstration in the `demo` subdirectory includes loading the generated drawing commands from a lua source file, scaling them to an arbitrary window size and displaying them.

You will need to have [LÖVE](https://love2d.org/wiki/Main_Page) installed to run it.

To run it on Unix-like systems, enter the directory and type:
```
love .
```

What it does is take the following SVG input file from primitive...

![Demo source SVG](https://raw.githubusercontent.com/globalcitizen/svg2love/master/demo/demo-source.jpg)

... load the `svg2love`-converted form (ie. LÖVE draw commands) from a file, and turn the resulting image in to a scaled and cropped form to fit a specified region of the window...

![Demo screenshot](https://raw.githubusercontent.com/globalcitizen/svg2love/master/demo/screenshot.jpg)

It may not look like much, but there seemed to be no other lua libraries out there to read SVGs and I'm not much of a graphics programmer, so I'm very glad it works!

## To Do

* Turn it in to a proper library written in Lua that is capable of loading files on the fly. (There's no sense in storing the converted commands really, SVG is smaller on disk and this reduces filesystem and programmer headache/complexity.)
