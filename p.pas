program pTest;
var 
	p: ^integer;
	x, c: integer;
	r: real;
begin
	p^ := -23;
	writeln(p^);
	x := 1;
	p := @x;
	c := x;
	writeln('p: ', p^);
	writeln('x: ', x);
	writeln('c: ', c);
	writeln;
	writeln('p^ := 2');
	writeln;
	p^ := 2;
	writeln('p: ', p^);
	writeln('x: ', x);
	writeln('c: ', c);
	writeln;
	writeln('p := @c');
	writeln('p^ := 3');
	writeln;
	p := @c;
	p^ := 3;
	writeln('p: ', p^);
	writeln('x: ', x);
	writeln('c: ', c);
	{ r := 666.0; 
	p^ := r }
end.
