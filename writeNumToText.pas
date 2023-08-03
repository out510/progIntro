program WriteNumToText;
var
	n: integer;
	f: text;
begin
	assign(f, 'writeNumToText.txt');
	rewrite(f);
	n := 666;
	write(f, n);
	close(f);
end.
