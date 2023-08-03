program BlockFileCopy;
const
	BufSize = 4096;
var
	source: file;
	dest: file;
	buf: byte;
	ReadRes, WriteRes: longint;
begin
	assign(source, ParamStr(1));
	assign(dest, ParamStr(2));
	fileMode := 0;
	reset(source, 2);
	if IOResult > 0 then
	begin
		writeln(ErrOutput, 'Can not open ', ParamStr(1));
		halt(1);
	end;
	fileMode := 1;
	rewrite(dest, 2);
	if IOResult > 0 then
	begin
		writeln(ErrOutput, 'Can not open ', ParamStr(2));
		halt(1);
	end;
	while true do
	begin
		BlockRead(source, buf, BufSize, ReadRes);
		writeln('Readed: ', ReadRes);
		if (ReadRes = 0 ) then
			break;
		BlockWrite(dest, buf, ReadRes, WriteRes);
		if WriteRes <> ReadRes then
		begin
			writeln(ErrOutput, 'Error writing the file');
			break;
		end;
	end;
	close(source);
	close(dest);
end.
