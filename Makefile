DIR ?= .
tgiving_dir := $(DIR)

$(tgiving_dir)/luaIf.lua : $(tgiving_dir)/luaIf/luaIf.lua
	cp $(tgiving_dir)/luaIf/luaIf.lua $(tgiving_dir)/luaIf.lua

clean ::
	rm -f $(tgiving_dir)/luaIf.lua

#include sub-projects
DIR := $(tgiving_dir)/luaIf
include $(DIR)/Makefile
