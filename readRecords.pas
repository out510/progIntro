program ReadRecords;
uses sysutils;
type
	Point = record
		latitude, longitude: real;
		name: string[15];
	end;
var
	f: file of Point;
	p: Point;
	i: integer;
begin
	filemode := 0;
	assign(f, 'points.bin');
	reset(f);
	i := 1;
	while not eof(f) do
	begin
		read(f, p);
		writeln('Point: ', i);
		writeln('longitude: ', p.longitude);
		writeln('latitude: ', p.latitude);
		writeln('name: ', p.name);
		writeln;
		i := i + 1;
	end;
	close(f);
end.
