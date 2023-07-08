program MovingHello;
uses crt, SysUtils;
const
	message = 'Hello world';
	originX = 1;
	originY = 1;

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

procedure ShowMessage(x, y: integer; msg: string);
begin
	GotoXY(x, y);
	write(msg);
	GotoXY(originX, originY);
end;

procedure HideMessage(x, y: integer; msg: string);
var
	i: integer;
begin
	GotoXY(x, y);
	for i := 1 to length(msg) do
		write(' ');
	GotoXY(originX, originY);
end;

function isOutOfScreen(x, y: integer; msg: string): boolean;
begin
	if (x > 0) and (x + length(msg) <= ScreenWidth) and (y > 0) and (y <= ScreenHeight) then
		isOutOfScreen := false
	else
		isOutOfScreen := true;
end;

procedure MoveMessage(var x, y: integer; msg: string; dx, dy: integer);
begin
	if isOutOfScreen(x + dx, y + dy, msg) then
		exit;
	HideMessage(x, y, msg);	
	x := x + dx;
	y := y + dy;
	ShowMessage(1, 2, 'x: ' + IntToStr(x) + ' ');
	ShowMessage(1, 3, 'y: ' + IntToStr(y) + ' ');
	ShowMessage(1, 4, 'Max x: ' + IntToStr(ScreenWidth) + ' ');
	ShowMessage(1, 5, 'Max y: ' + IntToStr(ScreenHeight) + ' ');
	ShowMessage(x, y, msg);
end;

var 
	curX, curY: integer;
	c: integer;
begin
	clrscr;
	curX := (ScreenWidth - length(message)) div 2;
	curY := ScreenHeight div 2;	
	ShowMessage(curX, curY, message);
	while true do
	begin
		GetKey(c);
		if c > 0 then
			break;
		case c of 
			-75: MoveMessage(curX, curY, message, -1, 0);
			-77: MoveMessage(curX, curY, message, 1, 0);
			-72: MoveMessage(curX, curY, message, 0, -1);
			-80: MoveMessage(curX, curY, message, 0, 1);
		end;
	end;
	clrscr;
end.
