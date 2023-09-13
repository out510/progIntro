program addToList;
type
	pp = ^nodePtr;
	nodePtr = ^node;
	node = record
		num: integer;
		next: nodePtr;
	end;
var
	p1, p2, p3: pp;

procedure printLinkedList(var head: nodePtr);
var 
	cur: nodePtr;
begin
	cur := head;
	write('Result: ');
	while cur <> nil do
	begin
		write(cur^.num);
		if (cur^.next <> nil) then
			write(' -> ');
		cur := cur^.next;
	end;
	writeln;
end;

procedure add(var cur: nodePtr; n: integer);
var
	tmp: nodePtr;
begin
	if p1 = nil then
		p1 := @(cur^.next)
	else
	begin
		if p2 = nil then
			p2 := @(cur^.next)
		else
			p3 := @(cur^.next);
	end;
	if (cur = nil) or (cur^.num > n) then
	begin
		writeln('p2^^.num = ', p2^^.num); { 4 for 1 -> 2 -> 4}
		writeln('p2 = @cur ', p2 = @cur);
		new(tmp);
		tmp^.num := n;
		tmp^.next := cur;
		cur := tmp;
	end
	else
		add(cur^.next, n);
end;

var
	head, tail: nodePtr;
	n, i: integer;
begin
	head := nil;
	tail := nil;
	read(n);
	new(head);
	head^.num := n;
	tail := head;
	while not SeekEof do
	begin
		read(n);
		new(tail^.next);
		tail := tail^.next;
		tail^.num := n;
	end;
	printLinkedList(head);
	readln(n);
	p1 := nil;
	p2 := nil;
	p3 := nil;
	add(head, n);
	printLinkedList(head);
end.

