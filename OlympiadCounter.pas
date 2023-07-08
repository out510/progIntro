program Olympiadcounter;
const
	MaxSchool = 67;
	MaxGroup = 100;
type
	CountersArray = array [1..MaxSchool] of integer;
var
	counters: CountersArray;
	i, studentNumber, schoolNumber: integer;
begin
	for i := 1 to MaxSchool do
		counters[i] := 0;
	while not eof do
	begin
		readln(studentNumber);
		schoolNumber := studentNumber div MaxGroup;
		counters[schoolNumber] := counters[schoolNumber] + 1;
	end;
	for i := 1 to MaxSchool do 
		writeln('School №', i, ': ', counters[i]);
end.
	
