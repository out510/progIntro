program AddToHeadOfLinkedList;
type
	nodePtr = ^node;
	node = record
		num: integer;
		next: nodePtr;
	end;

var
	head, tmp: nodePtr;
	n: integer;
	isFirst: boolean;
begin
	head := nil;
	tmp := nil;
	while not SeekEof do
	begin
		read(n);
		new(head);
		head^.num := n;
		head^.next := tmp;
		tmp := head;
	end;
	write('Result: ');
	isFirst := true;
	while tmp <> nil do
	begin
		write(tmp^.num);
		if isFirst then
		begin
			write(' (head)');
			isFirst := false;
		end;
		if (tmp^.next <> nil) then
			write(' -> ');
		tmp := tmp^.next;
	end;
	writeln;
end.
