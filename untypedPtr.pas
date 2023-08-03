program untypedPointer;
var
	p: pointer;
	s: char;
	pStr: ^char;
	x: integer;
	pInt: ^integer;
begin
	s := '!';
	p := @s;
	pInt := p;
	x := pInt^;
	writeln(x);
	x := 33;
	p := @x;
	pStr := p;
	s := pStr^;
	writeln(s);
end.
