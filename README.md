# Collisionator - Filter Generator

[LIVE VERSION](http://labs.zanuka.com/collisionator3000XL/index.html)

[CoronaLabs[zanuka]](http://web-b1.anscamobile.com/code/zanuka)

I've created a tool to generate collision filters quickly for use in apps & games:
http://labs.zanuka.com/collisionator3000XL/index.html

* UPDATE: New version uploaded April 2, 2012. This version automatically selects the reciprocal object collision so you no longer have to tick both manually. For example if you want object 2 to collide with object 1, just select one collision in the grid and the other will be auto-selected and filter also generated.
I've also added a 'copy all to clipboard' button... but you can still copy line by line if needed.

It's a very easy tool to use. Simply type your physics object/body names into the left coloum, then you'll see them repeated in the top columns. Note that the top column names serve only as reference so that you can make connections between your objects (visually)

So you then use the check boxes to select the object collisions (i.e. can it collide with itself -- in the case of a bunch of spawned green boxes for example -- or can it collide with other objects.

Once you've got all your collisions ticked, simply click in the right field for that row and the text string will auto-highlight... then copy/paste into your lua file. Viola! Quick and easy collision filters and this allows for rapid testing, tinkering and prototyping as well.

I have done the collision filter calculation process manually (on paper) and using excel spreadsheets in the past, but thought there must be a better and faster way. So I hope you enjoy this tool.
