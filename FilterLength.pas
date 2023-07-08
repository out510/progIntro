program FilterLength;
var
	c: char;
	lineLength: integer;
begin
	lineLength := 0;
	while not eof do
	begin
		read(c);
		if c <> #10 then
			lineLength := lineLength + 1
		else
		begin
			writeln(lineLength, ' letters');
			writeln('---');
			lineLength := 0;
		end;
	end;
end.
