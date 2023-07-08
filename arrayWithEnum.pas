program arrayWithEnum;
type 
	RaindbowColors = (
		red, orange, yellow, green, blue, indigo, violent
	);
	RaindbowCounters = array [RaindbowColors] of integer;
var
	ballCounter: RaindbowCounters;
begin
	ballCounter[green] := 1;
	writeln(ballCounter[green]);
end.

