function randomCase()
  local randomNumber = (rng:random(1,1000))%100;
  return randomNumber;
end 

CASES_PROPERTIES = {
  [0] = {
    hitbox = { left = 0, right = 0, top = 0, bottom = 0 },
    sprite = "case_0",
    type = "case",
    solid = false,
  },
  [1] = {
    hitbox = { left = 0, right = 0, top = 0, bottom = 26 },
    sprite = "case_1",
    type = "case",
    solid = true,
  },
}

function generateMap(x, y)
  if type(x) ~= "number" then x = 50; end
  if type(y) ~= "number" then y = 50; end
  local map = {}
  math.randomseed(os.time()); -- reset the seed
  for i = 1, y do
    map[i] = {}
    for j = 1, x do

      
      if i == 10 and j == 10 then
        map[i][j] = {
          rnd = randomCase(), -- (math.random(1, 100) + i + j)%100,
          _caseSize = 64,
          x = i,
          y = j,
          id = 1,
        }
      else
        map[i][j] = {
          rnd = randomCase(), -- (math.random(1, 100) + i + j)%100,
          _caseSize = 64,
          x = i,
          y = j,
          id = 0,
        }
      end



    end
  end
  -- found the x and y value of the only case where id == 1
  local f = {}
  for _, a in pairs(map) do
    for _, b in pairs(a) do
      if b.id == 1 then
        f.x = _;
        f.y = _;
      end
    end
  end
  print(table.toString(f));
  return map;
end

function createCase(x, y)
  if type(x) ~= "number" or type(y) ~= "number" then
    return nil
  else
    if Game.map[y] ~= nil and Game.map[y][x] ~= nil then
      return false
    else
      math.randomseed(os.time()); -- reset the seed
      if Game.map[y] == nil then
        Game.map[y] = {};
        local rowLength = #Game.map[1];
        for i = 1, rowLength do
          Game.map[y][i] = {
            rnd = randomCase(), -- (math.random(1, 100) + i + y)%100,
            _caseSize = 64,
            x = i,
            y = y,
            id = 0,
          }
        end
      end

      math.randomseed(os.time()); -- reset the seed
      if Game.map[y][x] == nil then
        Game.map[y][x] = {
          rnd = randomCase(), -- (math.random(1, 100) + x + y)%100,
          _caseSize = 64,
          x = x,
          y = y,
          id = 0,
        }
        return true;
      end
    end
  end
end
