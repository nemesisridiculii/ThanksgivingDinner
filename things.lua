items = {};

items.turkey = luaIf.Thing:new{
   short = "turkey";
   desc = "A raw thawed turkey.\n";
   name = {"turkey"};
   points = 50;
   cook = true;
};

items.greenbeens = luaIf.Thing:new{
   short = "green beans";
   desc = "A bag of frozen green beens.\n";
   name = {"green", "beans"};
   points = 10;
   cook = true;
};

items.rolls = luaIf.Thing:new{
   short = "rolls";
   desc = "A bag of frozen rolls.\n";
   name = {"rolls"};
   points = 10;
   cook = true;
};

items.stuffing = luaIf.Thing:new{
   short = "stuffing";
   desc = "Stuffing for the turkey.\n";
   name = {"stuffing"};
   points = 20;
   cook = true;
};

items.tomatoes = luaIf.Thing:new{
   short = "stuffed tomatoes";
   desc = "Stuffed tomatoes prepared and ready to cook.\n";
   name = {"stuffed", "tomatoes"};
   points = 10;
   cook = true;
};

items.spinach = luaIf.Thing:new{
   short = "spinach";
   desc = "Frozen spinach";
   name = {"frozen", "spinach"};
   points = 10;
   cook = true;
};

items.sweetpotatoes = luaIf.Thing:new{
   short = "sweet potato casserole";
   desc = "A baking dish of sweet potatoes covered in marshmallows. Yum.\n";
   name = {"sweet", "potato", "potatoes", "casserole"};
   points = 10;
   cook = true;
};

items.potatoes = luaIf.Thing:new{
   short = "potatoes";
   desc = "Potatoes for mashing";
   name = {"potatoes"};
   points = 10;
   cook = true;
};

items.cranberry = luaIf.Thing:new{
   short = "cranberry sauce";
   desc = [[
A can of jellied cranberry sauce. You got the right
kind this time.
]];
   name = {"can", "cranberry", "sauce"};
   points = 10;
   cook = false;
};

menu = luaIf.Thing:new{
   short = "menu";
   desc = [[
The menu for tonights meal:
* Turkey
* Stuffing
* Mashed potatoes
* Green beans
* Creamed spinach
* Rolls
* Sweet potato caserole
* Cranberry sauce
]];
   name = {"menu"};
};
luaIf.current.inventory:placeIn(menu);


