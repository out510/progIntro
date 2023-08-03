program MovingStar; 
uses crt; 
const
	starSymbol = '*';
	delayDuration = 100;
	blinkDelayDuration = 300;
	sparkPaintDelay = 100;
	sparkLen = 4;
	originX = 1;
	originY = 1;
	GAME_OVER_MESSAGE = 'Game over';
type
	Star = record
		CurX, CurY, dx, dy: integer;
	end;
	Spark = record
		headX, headY, tailX, tailY, dx, dy, len, movingDelay: integer;
		symbol: char;
		color: word;
	end;
	SparkArray = array of Spark;
	BooleanArray = array of boolean;	

procedure GetKey(var code: integer);
var
	c: char;
	isSpecial: boolean;
begin
	isSpecial := false;
	c := ReadKey;
	if c = #0 then
	begin
		c := ReadKey;
		isSpecial := true;
	end;
	code := ord(c);
	if isSpecial then
		code := -code;
end;

procedure ShowStar(var s: Star);
begin
	GotoXY(s.CurX, s.CurY);
	write(starSymbol);
	GotoXY(originX, originY);
end;

procedure HideStar(s: star);
begin
	GotoXY(s.CurX, s.CurY);
	write(' ');
	GotoXY(originX, originY);
end;

function canMove(var s: star): boolean;
var
	nextX, nextY: integer;
begin
	nextX := s.CurX + s.dx;
	nextY := s.CurY + s.dy;
	if (nextX > 0) and (nextX + length(starSymbol) <= ScreenWidth) 
	   and (nextY > 0) and (nextY <= ScreenHeight) then
		canMove := true
	else
		canMove := false;
end;

function CanPaint(var paintSwitches: BooleanArray): boolean;
var
	i: integer;
begin
	for i := 0 to high(paintSwitches) do
	begin
		if paintSwitches[i] then
		begin
			CanPaint := true;
			exit;
		end;
	end;
	CanPaint := false;
end;

procedure PaintSparks(var sparks: SparkArray);
var
	i, nextX, nextY: integer;
	paintSwitches: BooleanArray;
begin
	setlength(paintSwitches, high(sparks) + 1);
	for i := 0 to high(sparks) do
	begin
		sparks[i].headX := sparks[i].tailX;
		sparks[i].headY := sparks[i].tailY;
		paintSwitches[i] := true;
	end;
	while canPaint(paintSwitches) do 
	begin
		for i := 0 to high(sparks) do
		begin
			nextX := sparks[i].headX + sparks[i].dx;
			nextY := sparks[i].headY + sparks[i].dy;
			if (not paintSwitches[i]) 
				or (abs(sparks[i].headX - sparks[i].tailX) >= abs(sparks[i].len * sparks[i].dx))
					and (sparks[i].dx <> 0)
				or (abs(sparks[i].headY - sparks[i].tailY) >= abs(sparks[i].len * sparks[i].dy)) 
					and (sparks[i].dy <> 0)
				or (nextX < 1) or (nextX > ScreenWidth)
				or (nextY < 1) or (nextY > ScreenHeight) then
			begin
				paintSwitches[i] := false;
				sparks[i].headX := sparks[i].headX - 1;
				sparks[i].headY := sparks[i].headY - 1;
			end
			else
			begin
				gotoxy(sparks[i].headX, sparks[i].headY);	
				TextColor(sparks[i].color);
				write('*');
				gotoxy(originX, originY);
				sparks[i].headX := nextX;
				sparks[i].headY := nextY;
			end;
		end;
		delay(sparkPaintDelay);
	end;
	write(#27'[0m');
end;

procedure MoveSparkle(var sp: Spark);
begin

end;

procedure Sparkle(fromX, fromY: integer);
var
	i, sparkHead, sparkTail, nextX: integer;
	s: Star;
	sparks: SparkArray;
begin
	setlength(sparks, 8);
	sparks[0].len := sparkLen;
	sparks[0].tailX := fromX;
	sparks[0].tailY := fromY - 2;
	sparks[0].dx := 0;
	sparks[0].dy := -1;
	sparks[0].color := Yellow;

	sparks[1].len := sparkLen;
	sparks[1].tailX := fromX + 2;
	sparks[1].tailY := fromY;
	sparks[1].dx := 2;
	sparks[1].dy := 0;
	sparks[1].color := LightMagenta;

	sparks[2].len := sparkLen;
	sparks[2].tailX := fromX;
	sparks[2].tailY := fromY + 2;
	sparks[2].dx := 0;
	sparks[2].dy := 1;
	sparks[2].color := White;

	sparks[3].len := sparkLen;
	sparks[3].tailX := fromX - 2;
	sparks[3].tailY := fromY;
	sparks[3].dx := -2;
	sparks[3].dy := 0;
	sparks[3].color := LightBlue;

	sparks[4].len := sparkLen;
	sparks[4].tailX := fromX + 2;
	sparks[4].tailY := fromY + 1;
	sparks[4].dx := 2;
	sparks[4].dy := 1;
	sparks[4].color := Red;

	sparks[5].len := sparkLen;
	sparks[5].tailX := fromX - 2;
	sparks[5].tailY := fromY + 1;
	sparks[5].dx := -2;
	sparks[5].dy := 1;
	sparks[5].color := Magenta;

	sparks[6].len := sparkLen;
	sparks[6].tailX := fromX - 2;
	sparks[6].tailY := fromY - 1;
	sparks[6].dx := -2;
	sparks[6].dy := -1;
	sparks[6].color := Cyan;

	sparks[7].len := sparkLen;
	sparks[7].tailX := fromX + 2;
	sparks[7].tailY := fromY - 1;
	sparks[7].dx := 2;
	sparks[7].dy := -1;
	sparks[7].color := Green;

	paintSparks(sparks);
end;

procedure ShowCrash(var s: star);
begin
	sparkle(s.CurX, s.CurY);
end;

procedure ShowGameOver;
var
	fromX, fromY: integer;
begin
	clrscr;
	fromX := (ScreenWidth - length(GAME_OVER_MESSAGE)) div 2;
	fromY := ScreenHeight div 2;
	gotoxy(fromX, fromY);
	TextColor(Red);
	write(GAME_OVER_MESSAGE);
	delay(2000);
	sparkle(fromX + length(GAME_OVER_MESSAGE) div 2, fromY); 
	write(#27'[0m');
end;

procedure MoveStar(var s: star; var res: boolean);
begin
	HideStar(s);
	if canMove(s) then
	begin
		s.CurX := s.CurX + s.dx; 
		s.CurY := s.CurY + s.dy; 
	end
	else
	begin
		s.dx := 0;
		s.dy := 0;
		ShowCrash(s);
		res := false;
		exit;
	end;
	if (s.dx = 0) and (s.dy = 0) then
		delay(blinkDelayDuration);
	ShowStar(s);
	if (s.dx = 0) and (s.dy = 0) then
		delay(blinkDelayDuration);
	res := true;
end;


procedure setDirection(var s: star; dx, dy: integer);
begin
	s.dx := dx;
	s.dy := dy;
end;

var 
	s: star;
	c: integer;
	res: boolean;
begin
	clrscr;
	s.CurX := (ScreenWidth - length(starSymbol)) div 2;
	s.CurY := ScreenHeight div 2;	
	s.dx := 0;
	s.dx := 0;
	res := true;
	ShowStar(s);
	while true do
	begin
		if not KeyPressed then
		begin
			MoveStar(s, res);
			if not res then
			begin
				ShowGameOver;
				break;
			end;
			delay(delayDuration);
			continue;
		end;
		GetKey(c);
		case c of 
			-75: setDirection(s, -1, 0);
			-77: setDirection(s, 1, 0);
			-72: setDirection(s, 0, -1);
			-80: setDirection(s, 0, 1);
			32: setDirection(s, 0, 0);
			27: break;
		end;
	end;
	clrscr;
end.
