program MovingStar;
uses crt;
const
	starSymbol = '*';
	delayDuration = 100;
	blinkDelayDuration = 300;
	originX = 1;
	originY = 1;
type
	Star = record
		CurX, CurY, dx, dy: integer;
	end;

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

procedure MoveStar(var s: star);
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
	end;
	if (s.dx = 0) and (s.dy = 0) then
		delay(blinkDelayDuration);
	ShowStar(s);
	if (s.dx = 0) and (s.dy = 0) then
		delay(blinkDelayDuration);
end;

procedure setDirection(var s: star; dx, dy: integer);
begin
	s.dx := dx;
	s.dy := dy;
end;

var 
	s: star;
	c: integer;
begin
	clrscr;
	s.CurX := (ScreenWidth - length(starSymbol)) div 2;
	s.CurY := ScreenHeight div 2;	
	s.dx := 0;
	s.dx := 0;
	ShowStar(s);
	while true do
	begin
		if not KeyPressed then
		begin
			MoveStar(s);
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
