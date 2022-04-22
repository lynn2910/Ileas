-- GAME INFOS
VERSION = "0.0.1_ALPHA";


-- Width && height
DEFAULT_HEIGHT =  800;
DEFAULT_WIDTH  =  1200;

-- assets
assets = {};

-- menu && general options
STATE = "menu";
MENU_SELECTED = 0;
MENU_CTG = "main";
-- ["main", "new", "load", "options", "success", "options"]
OPTIONS_CTG = "select"

EXIT_DIALOG = false;
EXIT_SELECTED = 1;


HEIGHT, WIDTH = 0, 0;
RATIO = {
  x = 1,
  y = 1
}

-- FONT
FONT_PATH = "design/joystix.ttf";
FONT_SIZE = 14;

-- window options
WINDOW_OPTIONS = { resizable = true, vsync = true, minwidth = 400, minheight = 300 };
WINDOW_TITLE = "Ileas";


KEYS = {
  [".data"] = { heldTime = 0.25, heldTimeBetween = 0.1 },
  up = { key = "up", held = 0, state = 0 },
  down = { key = "down", held = 0, state = 0 },
  right = { key = "right", held = 0, state = 0 },
  left = { key = "left", held = 0, state = 0 },
  ["return"] = { key = "enter", held = 0, state = 0 },
  ["escape"] = { key = "escape", held = 0, state = 0 }
}