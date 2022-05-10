-- class
class_mt = {}
function class_mt:__index(key)
    return self.__baseclass[key]
end
Class = setmetatable({}, class_mt)
function Class:new(base)
    local c = base or {}
    c.__baseclass = self
    setmetatable(c, getmetatable(self))
    return c
end

dofile("config.lua"); ---> configuration

-- load assets
dofile("code/load.lua");
dofile("code/save.lua");
dofile("code/game/init.lua");

-- import draw and update
dofile("code/draw.lua");
dofile("code/update.lua");
dofile("code/keyboard.lua");
dofile("code/mouse.lua");
