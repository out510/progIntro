program diamond;
const
	FIRST_ROW_NUMBER = 1;
	HALF = 2;

procedure PrintSpaces(count: integer);
var
	i: integer;
begin
	for i := 1 to count do
			write(' ')
end;

procedure PrintRowOfDiamond(rowNumber, diamondHeight: integer);
var
	halfRowLength: integer;
begin
	halfRowLength := Trunc(diamondHeight / HALF) + 1;
	PrintSpaces(halfRowLength - rowNumber);
	write('*');
	PrintSpaces(2 * rowNumber - 3);
	if (rowNumber <> FIRST_ROW_NUMBER) then
		writeln('*')
	else
		writeln
end;

var 
	diamondHeight, rowNumber: integer;
begin
	repeat
		write('Enter the diamond''s height (positive odd): ');
		readln(diamondHeight);
	until (diamondHeight > 0) and (diamondHeight mod 2 = 1);
	for rowNumber := 1 to (diamondHeight div 2) + 1  do
	begin
		PrintRowOfDiamond(rowNumber, diamondHeight);
	end;
	for rowNumber := (diamondHeight div 2) downto 1 do
	begin
		PrintRowOfDiamond(rowNumber, diamondHeight);
	end
end.
