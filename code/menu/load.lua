local boxHeight, boxWidth = 600, 800;

local function getAllSaves()
  local files = love.filesystem.getDirectoryItems("save");
  local arr = {}
  for i,v in ipairs(files) do
    print(v)
    if string.find(v, ".lmay") then
      local data = save:loadGameFile(string.gsub(v, ".lmay", ""));
      if data.header and data.body and type(data.header) == "table" and type(data.body) == "table" and type(data.header.id) == "string" then
        table.insert(arr, i, data)
      end
    end
  end
  return arr;
end

local files = nil;

function loadGame()
  if files == nil then files = getAllSaves(); end
  local middleHeight, middleWidth = math.floor(HEIGHT / 2), math.floor(WIDTH / 2);
  local x, y = middleWidth-(boxWidth/2), middleHeight-(boxHeight/2);
  love.graphics.setColor(0, 0, 0, 1);
  love.graphics.rectangle("fill", x, y, boxWidth, boxHeight);
  love.graphics.setColor(255, 255, 255, 1);
  --love.graphics.printf("Cette fonctionnalitée n'est pas encore accessible.", 0, middleHeight, WIDTH, "center", 0);
  --love.graphics.printf("[exit]", 0, middleHeight+23, WIDTH, "center", 0);
end;


