-- GAME INFOS
VERSION = "0.0.1_ALPHA";


-- Width && height
DEFAULT_HEIGHT =  800;
DEFAULT_WIDTH  =  1200;

-- assets
assets = {};
fonts = {}

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
  lshift = { key = "lshift", held = 0, state = 0 },
  rshift = { key = "rshift", held = 0, state = 0 },
  ["return"] = { key = "enter", held = 0, state = 0 },
  ["escape"] = { key = "escape", held = 0, state = 0 }
}

MOUSE = {
  [".data"] = { heldTime = 0.25, heldTimeBetween = 0.1 },
  -- default mouse buttons
  [1] = { key = "left", held = 0, state = 0 },
  [2] = { key = "right", held = 0, state = 0 },
  [3] = { key = "middle", held = 0, state = 0 }
}


-- LOAD OPTIONS_CTG
BOX_LOAD_BOX_HEIGHT = 600;
BOX_LOAD_BOX_WIDTH = 800;

-- save options
MAX_GAMES = 4;


-- GAME OPTIONS
DEFAULT_PARAMS = {
  money = 200,
  xp = 0,
  lvl = 0,
  amour = { head = nil, body = nil, legs = nil, feet = nil },
  weapons = { main = nil, secondary = nil },
  spells = { main = nil, secondary = nil },
  inventory = { items = {}, spells = {}, weapons = {}, amour = {} },
  stats = {
    health = 100,
    mana = 100,
    strength = 10,
    agility = 10,
    intelligence = 10,
    luck = 10,
    speed = 10,
    defense = 10,
    resistance = 10,
    accuracy = 10,
    evasion = 10
  },
  position = { x = 0, y = 0 },
  map = {}
}

LOAD_MESSAGE_STATE = 0;

PLAYER_SPEED = 1;
DEFAULT_PLAYER_SPEED = 1;

PLAYER_MOVE = "IDLE_DOWN";
PLAYER_MOVE_STATE = 0;
LAST_MOVE_TIME = os.time();
LAST_PLAYER_MOVE = "IDLE_DOWN";

MAX_PLAYER_MOVE = 11;
DEFAULT_MAX_PLAYER_MOVE = 11;
PLAYER_ANIMATION = 0;