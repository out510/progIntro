program bitwise;
uses
	StrUtils;
var
	x, y: integer;
begin
	{write('Enter x: ');}
	read(x);
	writeln(x);
	y := not x;
	writeln('x = ', x);
	writeln('not x = ', y);
	writeln('    x = ', IntToBin(x, 32, 4));
	writeln('not x = ', IntToBin(y, 32, 4));
end.
