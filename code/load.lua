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

-- love load
function love.load()
  print("load");
  assets.background = love.graphics.newImage("design/menu/menu.jpg");

  -- window settings
  love.window.setMode(DEFAULT_WIDTH, DEFAULT_HEIGHT, WINDOW_OPTIONS);
  love.window.setTitle(WINDOW_TITLE);

  -- load fonts
  DEFAULT_FONT = love.graphics.newFont(FONT_PATH, FONT_SIZE);
  MENU_DEFAULT_FONT = love.graphics.newFont(FONT_PATH, 23);
  love.graphics.setFont(DEFAULT_FONT);
end