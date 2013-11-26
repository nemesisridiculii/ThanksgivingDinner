rooms = {}

rooms.livingroom = luaIf.Room:new{
   short = "living room";
   desc = [[
The main living space on the first floor.

The dining room lies to the south. The bonus room to the north. The
front door leading to the pourch is to the west. The kitchen is
east. You can take the stairs up to the second floor.
]];

}

rooms.diningroom = luaIf.Room:new{
   short = "dining room";
   desc = [[
This room might be better described as the game room, since board games is it's main purpose. Today, however, is an exception. The table is set and ready for the meal.

The kitchen is east of here. The living room is to the north.
]]; --'
};

rooms.livingroom.south = rooms.diningroom;
rooms.diningroom.north = rooms.livingroom;


rooms.kitchen = luaIf.Room:new{
   short = "kitchen";
   desc = [[
The kitchen is where you should be cooking the big meal, but where is the food?

The dining room is to the west. The living room is north.
]];
};

rooms.livingroom.east = rooms.kitchen;
rooms.kitchen.north = rooms.livingroom;
rooms.diningroom.east = rooms.kitchen;
rooms.kitchen.west = rooms.diningroom;

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

rooms.ffbathroom = luaIf.Room:new{
   short = "first floor bathroom";
   desc = [[
A small bathroom with a shower.

The bonus room is north of here.
]];
};

rooms.ffbathroom.north = rooms.bonus;
rooms.bonus.south = rooms.ffbathroom;


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


rooms.upstairsbathroom = luaIf.Room:new{
   short = "upstairs bathroom";
   desc = [[
The upstairs bathroom is larger than the downstairs bathroom.

You can exit the bathroom to the north.
]];
};

rooms.upstairsbathroom.north = rooms.upstairshall;
rooms.upstairshall.south = rooms.upstairsbathroom;

rooms.masterbedroom = luaIf.Room:new{
   short = "master bedroom";
   desc = [[
The room is dominated by a large bed in the center.

You can exit to the east.
]];
};

rooms.masterbedroom.east = rooms.upstairshall;
rooms.upstairshall.west = rooms.masterbedroom;


rooms.nathansroom = luaIf.Room:new{
   short = "nathan's room";
   desc = [[
A bed is pushed in the corner. Stuff is piled here and there.

You can exit to the south.
]];
};

rooms.nathansroom.south = rooms.upstairshall;
rooms.upstairshall.north = rooms.nathansroom;


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
