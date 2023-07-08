program GtKey;
uses crt;

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

var
	code: integer;
begin
	repeat
		GetKey(code);
		writeln(code);
	until code = ord(' ')
end.

