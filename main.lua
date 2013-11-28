require "luaIf"

maxturns = 70;

dofile("rooms.lua");
dofile("things.lua");
dofile("verbs.lua");

math.randomseed(os.time());

for k,v in pairs(items) do
   if(#hidingContainers > 0 and #hidingSupporters > 0) then
      if(math.random() >= 0.5) then
	 local i = math.random(#hidingContainers);
	 hidingContainers[i]:placeIn(v);
	 table.remove(hidingContainers, i);
      else
	 local i = math.random(#hidingSupporters);
	 hidingSupporters[i]:placeOn(v);
	 table.remove(hidingSupporters, i);
      end
   elseif(#hidingContainers > 0) then
      local i = math.random(#hidingContainers);
      hidingContainers[i]:placeIn(v);
      table.remove(hidingContainers, i);
   else
      local i = math.random(#hidingSupporters);
      hidingSupporters[i]:placeOn(v);
      table.remove(hidingSupporters, i);
   end
end

io.write([[

It's thanksgiving day, the guests are on their way. You need to put
the turkey in the oven, but where is all the food!?

A game by Jeffrey Adair
-----------------------

]]);

function mealquality()
   if(luaIf.current.score < 50) then return "non-existant";
   elseif(luaIf.current.score < 100) then return "abismil";
   elseif(luaIf.current.score < 120) then return "acceptable";
   else return "wonderful";
   end
end

luaIf.current.score = 0;
luaIf.current.room = rooms.livingroom;
function luaIf.current.prompt() 
   io.write("\n");
   if(luaIf.current.room and luaIf.current.room.short) then io.write("~", luaIf.capitalize(luaIf.current.room.short), "~\n"); end

   local remaining = maxturns - luaIf.current.turncount;
   
   io.write("The guests will be here in ", remaining, " turns, and the meal is ", mealquality(), ".\n");

   io.write("}>");
end

function luaIf.current.eachTurn()
   if(luaIf.current.turncount >= maxturns) then luaIf.current.running = false; end
end


luaIf.mainloop();

if(luaIf.current.living) then
   io.write([[
----------------------------------------------------
The guests arrive and the meal is ]], mealquality(), [[. Hopefully next 
year you can remember to put the food in the right place.
]]);
else
   io.write([[
Your guests arrive to find your bloody corpse.
]]);
end


