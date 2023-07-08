program enumRaindbow;
type
	RaindbowColors = (
		red, orange, yellow, green, blue, indigo, violent
	);
var
	rc: RaindbowColors;
begin 
	rc := green;
	writeln(rc);
	rc := yellow;
	writeln(rc);
end.
