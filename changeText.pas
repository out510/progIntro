program ChangeText;
var
	f: file of char;
begin
	assign(f, 't.txt');
	reset(f);
	seek(f, 5);
	write(f, ',');
	close(f);
end.
