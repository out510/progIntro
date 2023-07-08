program StarSlash;
var
	n, m: integer;
begin
	for n := 0 to 23 do
	begin
		for m := 0 to n - 1 do
			write(' ');
		writeln('*');
	end
end.
