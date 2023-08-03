program WriteRecords;
uses sysutils;
type
	Point = record
		latitude, longitude: real;
		name: string[15];
	end;
var
	f: file of Point;
	i: integer;
	points: array[1..10] of Point;
begin
	for i := 1 to 10 do
	begin
		points[i].longitude := i;
		points[i].latitude := i * 2;
		points[i].name := 'point №' + intToStr(i);
	end;
	assign(f, 'points.bin');
	rewrite(f);
	for i := 1 to 10 do
		write(f, points[i]);
	close(f);
end.
