program arrayIdexOut;
type 
	real10 = array [1..10] of real;
var
	arr: real10;
begin
	arr[0] := 233.0;
	writeln(arr[0]);
	arr[11] := 11.0;
	writeln(arr[11]);
end.

