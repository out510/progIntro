program MultAndAdd;
var
	sum, mult, n: real;
	f: text;
begin
	{$I-}
	if ParamCount < 1 then
	begin
		writeln('Specify the filename');
		halt(1);
	end;
	assign(f, ParamStr(1));
	reset(f);
	if IOResult <> 0 then
	begin
		writeln('Could not open the file ', ParamStr(1));
		halt(1);
	end;
	sum := 0.0;	
	while not SeekEof(f) do 
	begin
		mult := 1;
		while not SeekEoln(f) do
		begin
			read(f, n);
			mult := mult * n;
		end;
		readln(f);
		sum := sum + mult;
	end;
	writeln(sum:7:5);
end.
