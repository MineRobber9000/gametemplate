# gametemplate

This is a LOVE2D game template. It contains:

 - A "fixed" framerate setup
 - A sprite system
 - A palette system (comes loaded with [DB-16](http://pixeljoint.com/forum/forum_posts.asp?TID=12795))
 - A resource system
 - A basic logging function
 - An 8-bit color-depth patch ([CINDY](https://github.com/megagrump/cindy)))
 - A pixel-like font (Pixellari by Zacchary Dempsey-Plante)

I made it for a Work-In-Progress workshop I'm working on based around making retro-esque games using [LOVE2D](https://love2d.org) and [Piskel](https://github.com/piskelapp/piskel).

To add code, edit `src/code.lua`.

 - `code.init` -> `love.load`
 - `code.update` -> `love.update`
 - `code.draw` -> `love.draw`

To adjust the framerate, edit `t.framerate` in `src/conf.lua`. (Default is 30FPS)

## Helper Functions

### Global Functions

 - `seconds(x)` - gives the amount of update frames that fill x seconds
 - `drawCentered(drawable,x,y,scale,xCentered=true,yCentered=false)` - Draws drawable at (x,y), but centered in the x (`xCentered`) and/or y (`yCentered`) dimensions
 - `prepForImage()` - sets foreground color to pure white, so as not to distort the colors in the image
 - `log(message,prefix="")` - logs `message` as coming from the function. (if function should have a prefix (i.e; `code.init`), supply `prefix`.)

### `res` - Resources

#### `res/index.lua`

To add resources to the list, edit `res/index.lua`. The format:

```
index["resource_name"]={["type"]="{font|image}",["location"]="res/<filename>"}
```
For an example, see the included `font` listing.

#### Functions

 - `res.get(resource_name,arg=nil)` - Gets `resource_name`, with secondary argument `arg`.

For `font` resources, `arg` defaults to 16.

### `palette` - Palette library

 - `palette.register(name,colors)` - Registers palette `name`, with colors `colors`. For example, this is the included DB-16 registration:

```
palette.register("DB16",{{20,12,28},{68,36,52},{48,52,109},{78,74,78},{133,76,48},{52,101,36},{208,70,72},{117,113,97},{89,125,206},{210,125,44},{133,149,161},{109,170,44},{210,170,153},{109,194,202},{218,212,94},{222,238,214}})
```

 - `palette.getPalette(name)` - Gets pre-registered palette `name`.

Config variable `t.palette` chooses which of the pre-registered palettes will be used on startup.
