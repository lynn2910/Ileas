local boxHeight, boxWidth = BOX_LOAD_BOX_HEIGHT, BOX_LOAD_BOX_WIDTH;

function getAllSaves()
  local files = love.filesystem.getDirectoryItems("save");
  local arr = {}
  for i,v in ipairs(files) do
    if string.find(v, ".lmay") then
      local data = save:loadGameFile(string.gsub(v, ".lmay", ""));
      if data.header and data.body and type(data.header) == "table" and type(data.body) == "table" and type(data.header.id) == "string" then
        table.insert(arr, i, data)
      end
    end
  end
  return arr;
end

files = nil;

function loadGame()
  if files == nil then files = getAllSaves(); end
  local middleHeight, middleWidth = math.floor(HEIGHT / 2), math.floor(WIDTH / 2);
  local x, y = middleWidth-(boxWidth/2), middleHeight-(boxHeight/2);

  -- get x and y position of top left corner of the box
  local minX, minY = middleWidth-(boxWidth/2), middleHeight-(boxHeight/2);
  local maxX, maxY = middleWidth+(boxWidth/2), middleHeight+(boxHeight/2);

  love.graphics.setColor(0, 0, 0, 1);
  love.graphics.rectangle("fill", x, y, boxWidth, boxHeight);
  love.graphics.setColor(255, 255, 255, 1);

  love.graphics.draw(assets.RELOAD, minX+30, minY+40, 0);
  love.graphics.printf("Recharger les sauvegardes...", minX-100, minY+50, boxWidth-50, "center");

  love.graphics.printf("Liste des sauvegardes", minX-200, minY+125, boxWidth-50, "center");

  if #files < 1 then
    love.graphics.printf("Aucune sauvegarde.", minX-200, math.floor(boxWidth/2+minY/2), boxWidth-50, "center");
  else
    local xY, xDecal = 40, 10;
    for i=0, #files do
      local data = files[i+1];
      if data and i < MAX_GAMES then
        love.graphics.printf(data.header.name, minX+50, minY+150+xY+xDecal, boxWidth-50, "left");
        love.graphics.printf("Temps de jeux: "..data.header.playTime, minX+75, minY+175+xY+xDecal, boxWidth-50, "left");
        xY = xY + 50;
        xDecal = xDecal + 50;
      end
    end
  end
end;


