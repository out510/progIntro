program doublePointer;
type
	pInt = ^integer;
	ppInt = ^pInt;
var
	p: pInt;
	pp: ppInt;
	p0, p1: ^integer;
	x: integer;
begin
	x := 1;
	p := @x;
	pp := @p;
	writeln('x: ', x);
	writeln('p^: ', p^);
	writeln('pp^: ', pp^^);
	x := 2;
	writeln('x: ', x);
	writeln('p^: ', p^);
	writeln('pp^^: ', pp^^);
	pp^^ := 3;
	writeln('x: ', x);
	writeln('p^: ', p^);
	writeln('pp^^: ', pp^^);
	{--------------------------------------}	
	p0 := @x;
	p1 := @p0;
	writeln(p1^); { output: -6023 }
	x := 123;						{ WTF??? }
	writeln(p1^); { output: -6023 }
	{--------------------------------------}	
end.
