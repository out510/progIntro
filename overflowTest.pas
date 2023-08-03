program OverflowTest;
{$MODE OBJFPC}
uses SysUtils;
var
	src: file;
	dest: file;
	res: longint;
	buf, b1, b2: byte;
begin
	assign(src, '48_bytes_file.txt');
	assign(dest, 'copy_of_48_bytes_file.txt');
	try
		reset(src, 2);
		rewrite(dest, 2);
		BlockRead(src, buf, 24, res);	
		writeln('b1: ', chr(b1));
		writeln('b2: ', chr(b2));
		BlockWrite(dest, buf, 24, res);
	except on E: EInOutError do
	  writeln('Caught EInOutError: ', E.Message);
	end;
	close(src);
	close(dest);
end.
