program HelloCrt;
uses crt;
const
	str = 'Hello world';
	delayMili = 5000;
	originX = 1;
	originY = 2;
var
	x, y: integer;
begin
	clrscr;
	x := (ScreenWidth - length(str)) div 2;
	y := ScreenHeight div 2;	
	GotoXY(x, y);
	writeln(str);
	GotoXY(originX, originY);
	delay(delayMili);
end.
