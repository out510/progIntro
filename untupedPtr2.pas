program unp;
type
	Person = record
		weight: real;
	end;
var
	p: pointer;
	pers: Person;
	s: string;
	pS: ^string;
begin
	pers.weight := 33.7;
	p := @pers;
	pS := p;
	s := pS^;
	writeln(s);
end.
