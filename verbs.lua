luaIf.addVerb({"kill", "self"},
	function()
	   if(luaIf.current.turncount < maxturns-10) then
	      io.write("That seems a little drastic don't you think. There's still time left.\n");
	      return true;
	   else
	      io.write("You go to the kitchen and take the largest knife\nyou can find, and use it to commit sepuku.\n");
	      luaIf.current.living = false;
	      return true;
	   end
	end
);


luaIf.addVerb({"cook", luaIf.capture.Inventory},
	function(obj)
	   if(luaIf.current.room == rooms.kitchen) then
	      if(obj.points == nil) then
		 io.write("How do you intend to cook that?");
		 return true;
	      else
		 if(obj.cook) then
		    io.write("You put the ", obj:phrase(true, false), " in to cook.\n");
		 else
		    io.write("You prepare the ", obj:phrase(true, false), " for dinner.\n");
		 end
		 
		 luaIf.current.score = luaIf.current.score + obj.points;
		 obj:liberate();
	      end
	   else
	      io.write("How do you expect to do that when you're not in the kitchen?\n");
	   end
	   return true;
	end
);

luaIf.addVerb({{"drain", "empty"}, luaIf.capture.Thing},
	      function(obj)
		 if(obj.filled) then
		    obj.filled = false;
		    obj.open = true;
		    io.write(luaIf.capitalize(obj.pronoun), " ", obj.short, " drains\n");
		    obj:describeChildren(1, 0, "");
		    return true;
		 end
	      end
);