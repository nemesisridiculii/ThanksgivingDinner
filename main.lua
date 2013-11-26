require "luaIf"

dofile("rooms.lua");

io.write("It's thanksgiving day, the guests are on their way. You need to put the turkey in the oven, but where is all the food!?\n\n");
io.write("A game by Jeffrey Adair\n--------------------\n\n");

luaIf.current.score = 0;
luaIf.current.maxScore = 100;
luaIf.current.room = rooms.livingroom;

luaIf.mainloop();
