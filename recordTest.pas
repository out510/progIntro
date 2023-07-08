program recordTest;
type
	CheckPoint = record
		n: integer;
		latitude, longitude: real;
		hidden: boolean;
		penalty: integer;
	end;

procedure getCheckpoint(var ch: CheckPoint);
begin
	ch.n := 1;
	writeln('In procedure');
end;

var
	chHome: CheckPoint;
begin
	chHome.n := 0;
	writeln(chHome.n);
	getCheckpoint(chHome);
	writeln(chHome.n);
end.
