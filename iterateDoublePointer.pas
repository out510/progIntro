program IterateDoublePointer;
type
	pp: ^nodePtr;
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
	cur: pp;
	tmp: nodePtr;
begin
	cur := @head;	
	while cur <> nil do
	begin
		if cur^^.num < 0 then
		begin
			tmp := cur^;
			cur = @(cur^^.next);
			dispose(tmp);
		end
		else
			cur := @(cur^^.next);
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
