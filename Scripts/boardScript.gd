extends TileMap

const BLANK_TILE = -1;
const RED_TILE = 0;
const RED_TILE_HIGHLIGHTED = 1;
const YELLOW_TILE = 2;
const TOKEN_1 = 3;
const TOKEN_1_HIGHLIGHT = 4;
const TOKEN_1_MOVEMENT = 5;
const TOKEN_2 = 6;
const TOKEN_2_HIGHLIGHT = 7;
const TOKEN_2_MOVEMENT = 8;
const DIVISION = 9;
const MULTIPLICATION = 10;
const ADDITION = 11;
const SUBTRACTION = 12;

const BOARD_SIZE = 8;

func _ready():
	for i in range (BOARD_SIZE):
		for j in range(BOARD_SIZE):
			renderTile(i, j);
	pass

func renderTile(x, y):
	if (evenRoll(x, y)):
		renderTokens(x, y);
	elif (oddRoll(x, y)):
		renderTokens(x, y);
	else:
		renderYellowTile(x, y);
	pass

func renderTokens(x, y):
	if y < 3:
		renderToken1(x, y);
	elif y > 4:
		renderToken2(x, y);
	else:
		renderRedTile(x, y);
	pass

func renderYellowTile(x, y):
	set_cellv(Vector2(x,y), YELLOW_TILE, false, false, false);
	pass
	
func renderRedTile(x, y):
	set_cellv(Vector2(x,y), RED_TILE, false, false, false);
	pass

func renderToken1(x, y):
	set_cellv(Vector2(x,y), TOKEN_1, false, false, false);
	pass

func renderToken2(x, y):
	set_cellv(Vector2(x,y), TOKEN_2, false, false, false);
	pass

func evenRoll(x, y):
	return (y % 2) != 1 and (x % 2) != 1

func oddRoll(x, y):
	return (y % 2) == 1 and (x % 2) == 1