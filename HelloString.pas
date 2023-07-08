program HelloString;
var
	hello: array [1..30] of char;
	world: string;
	ws: string[1];
begin
	hello := 'Hello world!';
	writeln(hello);
	world := 'world!!!!!!!!!!!!!!!!!!!!!!!!!!!!';
	writeln(HexStr(15, 3));
	ws := 'Too long';
	writeln(ws);
	writeln(ws + 'oo long');
	writeln('Zero element of string \'world\' without ord(): ', world[0]);
	writeln('Zero element of string world: ', ord(world[0]));
end.
