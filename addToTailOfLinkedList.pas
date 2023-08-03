program ReadToLinkedListHead;
type
	nodePtr = ^node;
	node = record
		num: integer;
		next: nodePtr;
	end;

procedure printLinkedList(var head: nodePtr);
var 
	cur: nodePtr;
	isFirst: boolean;
begin
	cur := head;
	isFirst := true;
	write('Result: ');
	while cur <> nil do
	begin
		write(cur^.num);
		if isFirst then
		begin
			write(' (head)');
			isFirst := false;
		end;
		if (cur^.next <> nil) then
			write(' -> ');
		cur := cur^.next;
	end;
	writeln;
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
end.
