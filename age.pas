program age;
var
	year: integer;
begin
	repeat
		readln(year)
	until (year > 1900) and (year <= 2021)
end.
