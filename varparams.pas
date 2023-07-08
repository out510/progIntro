program varparams;

procedure varPar(var a: integer);
begin
	a := 1;
end;

function varParFunc(var a: integer): integer;
begin
	a := 2;
	varParFunc := 1;
end;

var
	b: integer;
begin
	b := 0;
	writeln(b);
	varPar(b);
	writeln(b);
	varParFunc(b);
	writeln(b);
end.
	
