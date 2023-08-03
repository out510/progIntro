program IterateThroughtList;
type
	nodePtr = ^node;
	node = record
		num: integer;
		next: nodePtr;
	end;

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

procedure removeNegativeNumbers(var head: nodePtr);
var
	cur, prev: nodePtr;
begin
	if head = nil then
		exit;
	prev := head;
	cur := head^.next;
	while cur <> nil do
	begin
		{ first }
		if prev^.num < 0 then
		begin
			head := prev^.next;
			dispose(prev);
			prev := head;
			cur := cur^.next;
			continue;
		end;
		{ middle }
		if cur^.num < 0 then
		begin
			prev^.next := cur^.next;
			dispose(cur);
			cur := prev^.next;
			continue;
		end;
		cur := cur^.next;
		prev := prev^.next;
	end;
end;

var
	head, tail: nodePtr;
	n: integer;
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
	removeNegativeNumbers(head);
	printLinkedList(head);
end.
