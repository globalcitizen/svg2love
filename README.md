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
