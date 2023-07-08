program char2num;

procedure ReadLongint(var success: boolean; var result: longint);
var 
	c: char;
	str: string;
	res: longint;
	pos: longint;
begin
	res := 0;
	pos := 0;
	str := '';
	repeat
		read(c);
		pos := pos + 1;
		if c = ' ' then
			str := str + 'S'
		else if c = #10 then
			str := str + 'E'
		else
			str := str + c;
	until (c <> ' ') and (c <> #10);
	while (c <> ' ') and (c <> #10) do
	begin
		if (c < '0') or (c > '9') then
		begin
			writeln('Unexpected ''', c, ''' in pos: ', pos);
			readln(c);
			success := false;
			exit;
		end;
		res := res * 10 + ord(c) - ord('0');
		read(c);
		pos := pos + 1;
	end;
	writeln(str);
	result := res;
	success := true;
end;

var
	x, y: longint;
	ok: boolean;
begin
	repeat
		write('type the firs number: ');
		ReadLongint(ok, x);
		writeln(' | '); 
	until ok;
	repeat
		write('type the second number: ');
		ReadLongint(ok, y);
	until ok;
	writeln(x, ' times ', y, ' is ', x * y);
end.

