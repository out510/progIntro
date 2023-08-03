program ChangeRecordBin;
uses sysutils;
type
	Point = record
		latitude, longitude: real;
		name: string[15];
	end;
var
	f: file of Point;
	p: Point;
begin
	assign(f, 'points.bin');
	reset(f);
	seek(f, 7);
	read(f, p);
	p.name := 'Lol wtf';
	seek(f, 7);
	write(f, p);
	close(f);
end.
