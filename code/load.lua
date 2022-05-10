function math.round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function table.toString(o)
  if type(o) == 'table' then
     local s = '{ '
     for k,v in pairs(o) do
        if type(k) ~= 'number' then k = '"'..k..'"' end
        s = s .. '['..k..'] = ' .. table.toString(v) .. ','
     end
     return s .. '} '
  else
     if type(o) == "string" then return '"'..tostring(o)..'"' else return tostring(o) end
  end
end

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

function trunc(num, digits)
  if type(digits) ~= "number" then digits = 0 end
  local mult = 10^(digits)
  return math.modf(num*mult)/mult
end
-- print(trunc(89.3,0));
-- print(trunc(89.5,0));

function Vector(x, y)
  local vct = (x or 0) + (y or 0);
  return { vct = vct/2, _x = x or 0, _y = y or 0 };
end


-- font
local fontToLoad = {
  { path=FONT_PATH, size=FONT_SIZE, name="DEFAULT_FONT" },
  { path=FONT_PATH, size=23, name="MENU_DEFAULT_FONT" },
}

-- images
local assetsToLoad = {
  { path = "design/menu/menu.jpg", key = "background" },
  { path = "design/menu/reload.png", key = "RELOAD" },
  { path = "design/game/test/1.png", key = "GRASS1"},
  { path = "design/game/test/2.png", key = "GRASS2"},
  { path = "design/game/test/3.png", key = "GRASS3"},
  { path = "design/game/test/4.png", key = "GRASS4"},
  { path = "design/game/test/5.png", key = "GRASS5"},
}



-- love load
function love.load()
  print("load");
  -- window settings
  local screen_width, screen_height = love.graphics.getWidth(), love.graphics.getHeight()
  love.window.setMode(math.floor(screen_width), math.floor(screen_height), { resizable = false, vsync = true })
  love.window.setTitle(WINDOW_TITLE);

  -- set load screen
  love.graphics.clear();
  LOAD_IMG = love.graphics.newImage("design/load.png", {});
  local w, h = love.graphics.getDimensions();
  local x = (w - LOAD_IMG:getWidth()) / 2;
  local y = (h - LOAD_IMG:getHeight()) / 2;
  love.graphics.draw(LOAD_IMG, x, y);
  love.graphics.present();


  for _, asset in pairs(assetsToLoad) do
    assets[asset.key] = love.graphics.newImage(asset.path, {});
  end


  for _, font in pairs(fontToLoad) do
    fonts[font.name] = love.graphics.newFont(font.path, font.size);
  end
  love.graphics.setFont(fonts.DEFAULT_FONT)


  rng = love.math.newRandomGenerator()

  -- last
  love.window.setMode(DEFAULT_WIDTH, DEFAULT_HEIGHT, WINDOW_OPTIONS);
end