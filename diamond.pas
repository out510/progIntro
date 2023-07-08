program diamond;
var 
	height, half_len, r, k : integer;
begin
	repeat
		write('Enter the diamond''s height (positive odd): ');
		readln(height);
	until (height > 0) and (height mod 2 = 1);
	half_len := Trunc(height / 2) + 1;
	for r := 1 to (height div 2) + 1  do
	begin
		for k := 1 to half_len - r do
			write(' ');
		write('*');
		for k := 1 to 2 * r - 3 do
			write(' ');
		if (r <> 1) then
			writeln('*')
		else
			writeln
	end;
	for r := (height div 2) downto 1 do
	begin
		for k := 1 to half_len - r do
			write(' ');
		write('*');
		for k := 1 to 2 * r - 3 do
			write(' ');
		if (r <> 1) then
			writeln('*')
		else
			writeln
	end

end.
