program func;

function Test(i: integer): integer;
begin
	if i > 3 then
		Test := 0;
	if i > 2 then 
		Test := 1;
	Test := 2
end;

var
	i: integer;
begin
	i := Test(4);
	writeln(i)
end.
