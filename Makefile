.PHONY : luaIf.lua

luaIf.lua :
	$(MAKE) -C luaIf
	cp luaIf/luaIf.lua .
