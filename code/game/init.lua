Game = nil;

-- font
local fontToLoad = {}

-- images
local assetsToLoad = {
  { path = "design/game/test/rock.png", key = "ROCK" },
  { path = "design/game/test/player.png", key = "PLAYER" },
  -- player down
  { path = "design/game/player/down/down_0.png", key = "PLAYER_DOWN_0" },
  { path = "design/game/player/down/down_1.png", key = "PLAYER_DOWN_1" },
  { path = "design/game/player/down/down_2.png", key = "PLAYER_DOWN_2" },
  { path = "design/game/player/down/down_3.png", key = "PLAYER_DOWN_3" },
  -- player left
  { path = "design/game/player/left/left_0.png", key = "PLAYER_LEFT_0" },
  { path = "design/game/player/left/left_1.png", key = "PLAYER_LEFT_1" },
  { path = "design/game/player/left/left_2.png", key = "PLAYER_LEFT_2" },
  { path = "design/game/player/left/left_3.png", key = "PLAYER_LEFT_3" },
  -- player right
  { path = "design/game/player/right/right_0.png", key = "PLAYER_RIGHT_0" },
  { path = "design/game/player/right/right_1.png", key = "PLAYER_RIGHT_1" },
  { path = "design/game/player/right/right_2.png", key = "PLAYER_RIGHT_2" },
  { path = "design/game/player/right/right_3.png", key = "PLAYER_RIGHT_3" },
  -- player up
  { path = "design/game/player/up/up_0.png", key = "PLAYER_UP_0" },
  { path = "design/game/player/up/up_1.png", key = "PLAYER_UP_1" },
  { path = "design/game/player/up/up_2.png", key = "PLAYER_UP_2" },
  { path = "design/game/player/up/up_3.png", key = "PLAYER_UP_3" },
  -- player down idle
  { path = "design/game/player/down_idle/idle_down.png", key = "PLAYER_DOWN_IDLE" },
  -- player left idle
  { path = "design/game/player/left_idle/idle_left.png", key = "PLAYER_LEFT_IDLE" },
  -- player right idle
  { path = "design/game/player/right_idle/idle_right.png", key = "PLAYER_RIGHT_IDLE" },
  -- player up idle
  { path = "design/game/player/up_idle/idle_up.png", key = "PLAYER_UP_IDLE" },
}


function loadGameAssets()
  print("load game");
  STATE = "load";
  for _, asset in pairs(assetsToLoad) do
    assets[asset.key] = love.graphics.newImage(asset.path, {});
  end


  for _, font in pairs(fontToLoad) do
    fonts[font.name] = love.graphics.newFont(font.path, font.size);
  end

  love.graphics.setFont(fonts.DEFAULT_FONT)

  Game.map = generateMap();

  STATE = "game";
  print("finish load")
end














function INIT_GAME()
  print("init game");
  Game = Class:new(DEFAULT_PARAMS);
  dofile("code/game/Player.lua");
  dofile("code/game/map.lua");


  loadGameAssets();
  

  initPlayer(DEFAULT_PARAMS);

  LAST_MOVE_TIME = os.time();

  dofile("code/game/drawGame.lua");
end