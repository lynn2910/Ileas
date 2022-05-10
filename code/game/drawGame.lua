-- x is horizontal
-- y is vertical

math.randomseed(os.time());
local RANDOM_CASE_SEED = math.random(1,5);
math.randomseed(os.time());

function Game:draw()
  local playerCoords = Player:getCoords();
  local xDiff, yDiff = playerCoords.x - playerCoords.realX, playerCoords.y - playerCoords.realY;

  -- draw terrain
  for a = playerCoords.realY - (32+64), playerCoords.realY + HEIGHT + (32+64) do
    for b = playerCoords.realX - (32+64), playerCoords.realX + WIDTH + (32+64) do
      if a%64 == 0 and b%64 == 0 then
        -- new case 
        local y, x = a-32 + yDiff, b-32 + xDiff;
        local CASE_RND = 0;
        if Game.map[a] ~= nil and Game.map[a][b] ~= nil and type(Game.map[a][b].rnd) == "number" then
          CASE_RND = Game.map[a][b].rnd;
        else
          createCase(b, a);
          CASE_RND = Game.map[a][b].rnd;
        end
        
        if CASE_RND == 0 then
          love.graphics.draw(assets.GRASS1, b + xDiff , a + yDiff);
        elseif CASE_RND == 1 then
          love.graphics.draw(assets.GRASS2, b + xDiff , a + yDiff);
        elseif CASE_RND == 2 then
          love.graphics.draw(assets.GRASS3, b + xDiff , a + yDiff);
        elseif CASE_RND == 3 then
          love.graphics.draw(assets.GRASS4, b + xDiff , a + yDiff);
        elseif CASE_RND == 4 then
          love.graphics.draw(assets.GRASS5, b + xDiff , a + yDiff);
        else
          love.graphics.draw(assets.GRASS1, b + xDiff , a + yDiff);
        end
      end
    end
  end

  -- draw sprites
  for _a, a in pairs(Game.map) do
    _a = _a + 1;
    if ((_a*64) > (playerCoords.realY - 64)) and ((_a*64) < (playerCoords.realY + HEIGHT + 64)) then
      for _b, b in pairs(a) do
        _b = _b + 1;
        if ((_b*64) > (playerCoords.realX - 64)) and ((_b*64) < (playerCoords.realX + WIDTH + 64)) then
          local y, x = (_a*64)-32 + yDiff, (_b*64)-32 + xDiff;
          -- the fun
          if b.id == 1 then
            print(x,y)
            love.graphics.draw(assets.ROCK, x, y);
          end

        end
      end
    end
  end

  -- draw player
  if KEYS["up"] ~= 0 and PLAYER_MOVE == "UP" or PLAYER_MOVE == "UP_LEFT" or PLAYER_MOVE == "UP_RIGHT" or LAST_PLAYER_MOVE == "UP" or LAST_PLAYER_MOVE == "UP_LEFT" or LAST_PLAYER_MOVE == "UP_RIGHT" then

    if PLAYER_ANIMATION < 30 then love.graphics.draw(assets.PLAYER_UP_0, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif PLAYER_ANIMATION >= 30 and PLAYER_ANIMATION < 60 then love.graphics.draw(assets.PLAYER_UP_1, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif PLAYER_ANIMATION >= 60 and PLAYER_ANIMATION < 90 then love.graphics.draw(assets.PLAYER_UP_2, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    else love.graphics.draw(assets.PLAYER_UP_3, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32); end

  elseif KEYS["down"] ~= 0 and  PLAYER_MOVE == "DOWN" or PLAYER_MOVE == "DOWN_LEFT" or PLAYER_MOVE == "DOWN_RIGHT" or LAST_PLAYER_MOVE == "DOWN" or LAST_PLAYER_MOVE == "DOWN_LEFT" or LAST_PLAYER_MOVE == "DOWN_RIGHT" then

    if PLAYER_ANIMATION < 30 then love.graphics.draw(assets.PLAYER_DOWN_0, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif PLAYER_ANIMATION >= 30 and PLAYER_ANIMATION < 60 then love.graphics.draw(assets.PLAYER_DOWN_1, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif PLAYER_ANIMATION >= 60 and PLAYER_ANIMATION < 90 then love.graphics.draw(assets.PLAYER_DOWN_2, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    else love.graphics.draw(assets.PLAYER_DOWN_3, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32); end

  elseif KEYS["left"] ~= 0 and  PLAYER_MOVE == "LEFT" or LAST_PLAYER_MOVE == "LEFT" then

    if PLAYER_ANIMATION < 30 then love.graphics.draw(assets.PLAYER_LEFT_0, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif PLAYER_ANIMATION >= 30 and PLAYER_ANIMATION < 60 then love.graphics.draw(assets.PLAYER_LEFT_1, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif PLAYER_ANIMATION >= 60 and PLAYER_ANIMATION < 90 then love.graphics.draw(assets.PLAYER_LEFT_2, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    else love.graphics.draw(assets.PLAYER_LEFT_3, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32); end

  elseif KEYS["right"] ~= 0 and PLAYER_MOVE == "RIGHT" or LAST_PLAYER_MOVE == "RIGHT" then

    if PLAYER_ANIMATION < 30 then love.graphics.draw(assets.PLAYER_RIGHT_0, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif PLAYER_ANIMATION >= 30 and PLAYER_ANIMATION < 60 then love.graphics.draw(assets.PLAYER_RIGHT_1, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif PLAYER_ANIMATION >= 60 and PLAYER_ANIMATION < 90 then love.graphics.draw(assets.PLAYER_RIGHT_2, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    else love.graphics.draw(assets.PLAYER_RIGHT_3, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32); end
  
  else
    -- idle player ??
    if KEYS["down"] ~= 2 and LAST_PLAYER_MOVE == "IDLE_DOWN" or ((KEYS["right"].state ~= 2 or KEYS["left"].state ~= 2) and KEYS["up"].state ~= 2 and (LAST_PLAYER_MOVE == "IDLE_DOWN_RIGHT" or LAST_PLAYER_MOVE == "IDLE_DOWN_LEFT")) then
      love.graphics.draw(assets.PLAYER_DOWN_IDLE, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif KEYS["right"] ~= 2 and LAST_PLAYER_MOVE == "IDLE_UP" or ((KEYS["right"].state ~= 2 or KEYS["left"].state ~= 2) and KEYS["up"].state ~= 2 and (LAST_PLAYER_MOVE == "IDLE_UP_RIGHT" or LAST_PLAYER_MOVE == "IDLE_UP_LEFT")) then
      love.graphics.draw(assets.PLAYER_UP_IDLE, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif KEYS["left"] ~= 2 and LAST_PLAYER_MOVE == "IDLE_LEFT" then
      love.graphics.draw(assets.PLAYER_LEFT_IDLE, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    elseif KEYS["right"] ~= 2 and LAST_PLAYER_MOVE == "IDLE_RIGHT" then
      love.graphics.draw(assets.PLAYER_RIGHT_IDLE, trunc(WIDTH/2, 0)-32, trunc(HEIGHT/2, 0)-32);
    end
  end
  local fps = love.timer.getFPS( )
  love.graphics.print(fps.." fps", 10, 10)
end









-- for _a, a in pairs(Game.map) do
--  _a = _a + 1;
--  if ((_a*64) > (playerCoords.realY - 64)) and ((_a*64) < (playerCoords.realY + HEIGHT + 64)) then
--    for _b, b in pairs(a) do
--      _b = _b + 1;
--
--      if ((_b*64) > (playerCoords.realX - 64)) and ((_b*64) < (playerCoords.realX + WIDTH + 64)) then
--        local y, x = (_a*64)-32 + yDiff, (_b*64)-32 + xDiff;
--        -- the fun
--        if b == "x" then
--          love.graphics.draw(assets.ROCK, x, y);
--        end
--
--      end
--    end
--  end
--end