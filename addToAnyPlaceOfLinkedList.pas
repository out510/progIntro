program AddToAnyPlaceOfLinkedList;
type
	pp = ^nodePtr;
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

procedure add(var head: nodePtr; n, position: integer);
var
	i: integer;
	cur: pp;
	tmp: nodePtr;
begin
	i := 1;
	cur := @head;
	while i <> position do
	begin
		cur := @(cur^^.next);
		i := i + 1;
	end;
	new(tmp);
	tmp^.num := n;
	tmp^.next := cur^;
	cur^ := tmp;
end;

procedure add2(var head: nodePtr; n, position: integer);
var
	i: integer;
	cur: nodePtr;
	tmp: nodePtr;
begin
	i := 1;
	cur := head;
	while i <> position do
	begin
		cur := cur^.next;
		i := i + 1;
	end;
	new(tmp);
	tmp^.num := n;
	tmp^.next := cur;
	cur := tmp;
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
	readln(i);
	{ add(head, n, i); }
	add2(head, n, i);
	printLinkedList(head);
end.
