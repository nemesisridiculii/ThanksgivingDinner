rooms = {}
things = {}
hidingContainers = {};
hidingSupporters = {};
function addHidingContainer(obj)
   hidingContainers[#hidingContainers+1] = obj;
end

function addHidingSupporter(obj)
   hidingSupporters[#hidingSupporters+1] = obj;
end
----------------------------------------
rooms.livingroom = luaIf.Room:new{
   short = "living room";
   desc = [[
The main living space on the first floor.

The dining room lies to the south. The bonus room to the north. The
front door leading to the pourch is to the west. The kitchen is
east. You can take the stairs up to the second floor.
]];

}

things.couch = luaIf.Thing:new{
   short = "couch";
   desc = [[
A brown leather couch.
]];
   name = {"brown", "leather", "couch"};
   supports = {};
   fixed = true;
};
rooms.livingroom:placeIn(things.couch);
addHidingSupporter(things.couch);

things.chest = luaIf.Thing:new{
   short = "plastic chest";
   desc = [[
A beige plastic chest with a green lid.
]];
   name = {"beige", "plastic", "chest"};
   openable = true;
   contains = {};
   supports = {};
   fixed = true;

   before_open = function(self)
      if(#self.supports > 0) then
	 io.write("You can't open it without knocking the stuff on top of it on the floor.\n");
	 return true;
      end
   end;

   before_place_on = function(self, obj)
      if(self.open) then
	 io.write("It falls in\n");
	 self:placeIn(obj);
	 return true;
      end
   end;
};
rooms.livingroom:placeIn(things.chest);
addHidingContainer(things.chest);

----------------------------------------
rooms.diningroom = luaIf.Room:new{
   short = "dining room";
   desc = [[
This room might be better described as the game room, since board
games is it's main purpose. Today, however, is an exception. The table
is set and ready for the meal.

The kitchen is east of here. The living room is to the north.
]]; --'
};

rooms.livingroom.south = rooms.diningroom;
rooms.diningroom.north = rooms.livingroom;

things.table = luaIf.Thing:new{
   short = "dining room table";
   desc = [[
A large wooden table.
]];
   name={"diningroom", "dining", "wooden", "table"};
   supports = {};
   fixed = true;
};
rooms.diningroom:placeIn(things.table);
addHidingSupporter(things.table);

--------------------------------------
rooms.kitchen = luaIf.Room:new{
   short = "kitchen";
   desc = [[
The kitchen is where you should be cooking the big meal, but where is the food?

The dining room is to the west. The living room is north. You can go upstairs from here.
]];
};

rooms.livingroom.east = rooms.kitchen;
rooms.kitchen.north = rooms.livingroom;
rooms.diningroom.east = rooms.kitchen;
rooms.kitchen.west = rooms.diningroom;

things.cabinets = luaIf.Thing:new{
   short = "cabinets";
   desc = [[
The kitchen cabinets.
]];
   name = {"kitchen", "cabinets"};
   contians = {};
   open = false;
   openable = true;
   fixed = true;
   plural = true;
};
rooms.kitchen:placeIn(things.cabinets);
addHidingContainer(things.cabinets);

things.fridge = luaIf.Thing:new{
   short = "refridgerator";
   desc = [[
The good old fridge. Why isn't the food in here?
]];
   name = {"refridgerator", "fridge"};
   fixed = true;
   contains = {};
   open = false;
   openable = true;
};
rooms.kitchen:placeIn(things.fridge);

things.sink = luaIf.Thing:new{
   short = "kitchen sink";
   desc = [[
It has a deep basin and a tap.
]];
   name = {"kitchen", "sink"};
   fixed = true;
   contains = {};
   open = true;
   openable = false;
};
rooms.kitchen:placeIn(things.sink);
addHidingContainer(things.sink);

------------------------------------
rooms.bonus = luaIf.Room:new{ 
   short = "bonus room"; 
   desc = [[ 
The realater listed this room as a "bonus room." You've never quite
been sure what to do with it, so it's become a dumping ground for
all half-finished projects.

The living room is west of here. The bathroom is south of here.
]];
};

rooms.bonus.west = rooms.livingroom;
rooms.livingroom.north = rooms.bonus;

things.bonusTable = luaIf.Thing:new{
   short = "table";
   desc = [[
A small wooden table.
]];
   name = {"small", "wooden", "table"};
   fixed = true;
   supports = {};
};
rooms.bonus:placeIn(things.bonusTable);

things.printer = luaIf.Thing:new{
   short = "3d printer";
   desc = [[
A 3d printer that can produce things out of plastic.
]];
   name = {"3d", "printer"};
};
things.bonusTable:placeOn(things.printer);

--------------------------------
rooms.ffbathroom = luaIf.Room:new{
   short = "first floor bathroom";
   desc = [[
A small bathroom with a shower.

The bonus room is north of here.
]];
};

rooms.ffbathroom.north = rooms.bonus;
rooms.bonus.south = rooms.ffbathroom;

things.fftoilet = luaIf.Thing:new{
   short = "toilet";
   desc = [[
The porcalin goddess.
]];
   name = {"toilet"};
   contains = {};
   open = true;
   openable = true;
   fixed = true;
};
rooms.ffbathroom:placeIn(things.fftoilet);
addHidingContainer(things.fftoilet);

things.ffsink = luaIf.Thing:new{
   short = "sink";
   desc = [[
The sink sits in a cabinet with a door on the front.
]];
   name = {"cabinet", "sink"};
   openable = true;
   contains = {};
   fixed = true;
};
rooms.ffbathroom:placeIn(things.ffsink);
addHidingContainer(things.ffsink);

-------------------------------
rooms.frontpourch = luaIf.Room:new{
   short="front pourch";
   desc = [[
A covered pourch adorns the front of the house.

The front yard is to the west. You can enter the house to the east.
]];

   alert_go = function(self, dir)
      if(dir == "west") then 
	 io.write("Where do you think you're going? There's food to cook!\n");
	 return true;
      end
   end;
};

rooms.livingroom.west = rooms.frontpourch;
rooms.frontpourch.east = rooms.livingroom;


things.package = luaIf.Thing:new{
   short = "package";
   pronoun = "a";
   desc = [[
A package from Amazon addressed to you.
]];
   name = {"amazon", "package"};
   open = false;
   openable = true;
   contains = {};
};
rooms.frontpourch:placeIn(things.package);
addHidingContainer(things.package);

things.book = luaIf.Thing:new{
   short = "cookbook";
   desc = [[
The Way to Cook by Julia Child..
]];
   name = {"cookbook", "book"};
   after_take = function(self)
      if(not self.taken) then
	 self.taken = true;
	 luaIf.current.score = luaIf.current.score + 5;
	 io.write("That should come in handy\n");
	 return true;
      end
   end
}
things.package:placeIn(things.book);
   


--------------------------------
rooms.upstairshall = luaIf.Room:new{
   short="upstairs hall";
   desc = [[
A small hallway connecting the rooms of the second floor.

A bathroom is to the south. The master bedroom is to the
west. Nathan's room is to the north. The office is to the east. you
can take the stairs down to the first floor.
]]; --'
};

rooms.upstairshall.down = rooms.livingroom;
rooms.livingroom.up = rooms.upstairshall;
rooms.kitchen.up = rooms.upstairshall;


---------------------------------
rooms.upstairsbathroom = luaIf.Room:new{
   short = "upstairs bathroom";
   desc = [[
The upstairs bathroom is larger than the downstairs bathroom.

You can exit the bathroom to the north.
]];
};

rooms.upstairsbathroom.north = rooms.upstairshall;
rooms.upstairshall.south = rooms.upstairsbathroom;

things.bathtub = luaIf.Thing:new{
   short="bathtub";
   name = {"bathtub", "tub"};
   details = function(self)
      if(self.filled) then
	 return "It apears to be filled ready for a bubble bath.";
      else
	 return "An empty bathtub.\n";
      end
   end;

   phrase = function(self, pronoun, cap)
      local res = self:parent().phrase(self, pronoun, cap);
      if(self.filled) then
	 res = res.." (full)";
      else
	 res = res.." (drained)";
      end

      return res;
   end;
   
   fixed = true;
   filled = true;
   openable = false;
   open = false;
   contains = {};

};
rooms.upstairsbathroom:placeIn(things.bathtub);
addHidingContainer(things.bathtub);

things.uptoilet = luaIf.Thing:new{
   short = "toilet";
   desc = [[
The porcalin goddess.
]];
   name = {"toilet"};
   contains = {};
   open = false;
   openable = true;
   fixed = true;
   after_open = function(self)
      io.write("You take the lid off the tank.\n");
      return true;
   end
};
rooms.upstairsbathroom:placeIn(things.uptoilet);
addHidingContainer(things.uptoilet);

things.upsink = luaIf.Thing:new{
   short = "sink";
   desc = [[
The sink sits in a cabinet with a door on the front.
]];
   name = {"cabinet", "sink"};
   openable = true;
   contains = {};
   fixed = true;
};
rooms.upstairsbathroom:placeIn(things.upsink);
addHidingContainer(things.upsink);

---------------------------------
rooms.masterbedroom = luaIf.Room:new{
   short = "master bedroom";
   desc = [[
The room is dominated by a large bed in the center.

You can exit to the east.
]];
};

rooms.masterbedroom.east = rooms.upstairshall;
rooms.upstairshall.west = rooms.masterbedroom;


things.masterbed = luaIf.Thing:new{
   short = "bed";
   desc = [[
A large bed sits in the middle of the room.
]];
   name = {"bed"};
   fixed = true;
   supports = {};
};
rooms.masterbedroom:placeIn(things.masterbed);
addHidingSupporter(things.masterbed);

things.dresser = luaIf.Thing:new{
   short = "dresser";
   desc = [[
A lovely antique dresser.
]];
   name = {"dresser", "antique"};
   fixed = true;
   contains = {};
   open = false;
   openable = true;
}
rooms.masterbedroom:placeIn(things.dresser);
addHidingContainer(things.dresser);

------------------------------------
rooms.nathansroom = luaIf.Room:new{
   short = "nathan's room";
   desc = [[
A bed is pushed in the corner. Stuff is piled here and there.

You can exit to the south.
]];
};

rooms.nathansroom.south = rooms.upstairshall;
rooms.upstairshall.north = rooms.nathansroom;

things.natbed = luaIf.Thing:new{
   short = "bed";
   desc = [[
Nathan's bed is in the corner of the room.
]];
   name = {"nathan's", "bed"};
   supports = {};
   fixed = true;
};
rooms.nathansroom:placeIn(things.natbed);
addHidingSupporter(things.natbed);

things.bookshelf = luaIf.Thing:new{
   short = "bookshelf";
   desc = "A tall bookshelf.\n";
   name = {"tall", "bookshelf"};
   fixed = true;
   supports = {};
}
rooms.nathansroom:placeIn(things.bookshelf);
addHidingSupporter(things.bookshelf);

-----------------------------
rooms.office = luaIf.Room:new{
   short = "Stacy's office";
   desc = [[
This room is dedicated to Stacy's computer and all of the pets that
the cats want to eat.

You can exit to the west.
]];
};

rooms.office.west = rooms.upstairshall;
rooms.upstairshall.east = rooms.office;


things.ratcage = luaIf.Thing:new{
   short = "rat cage";
   desc = [[
A large rat cage containing Barack.
]];
   name = {"rat", "cage"};
   fixed = true;
   openable = true;
   open = false;
   before_open = function()
      io.write("You wouldn't want to let Barack out would you?\n");
      return true;
   end
};
rooms.office:placeIn(things.ratcage);

things.desk = luaIf.Thing:new{
   short = "desk";
   desc = [[
A desk with a computer.
]];
   name={"computer", "desk"};
   fixed = true;
   supports = {};
}
rooms.office:placeIn(things.desk);
addHidingSupporter(things.desk);
