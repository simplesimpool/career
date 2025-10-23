create table Orders (
    order_id number primary key
);
drop table Orders;

create table OrderDetail (
    od_id number primary key,
    order_id number not null,
    book_id number not null,
    odr_cnt number not null
);
drop table OrderDetail;

create table Book (
    book_id number primary key,
    book_stock number not null
);
drop table Book;

alter table OrderDetail add constraint fk_order_id foreign key(order_id) references Orders(order_id);
alter table OrderDetail add constraint fk_book_id foreign key(book_id) references Book(book_id);

insert into Orders values (1);
insert into Orders values (2);

insert into OrderDetail values (1, 1, 1, 10);
insert into OrderDetail values (2, 1, 2, 20);
insert into OrderDetail values (3, 1, 3, 30);
insert into OrderDetail values (4, 2, 1, 40);
insert into OrderDetail values (5, 2, 2, 50);
insert into OrderDetail values (6, 2, 3, 60);

insert into Book values (1, 100);
insert into Book values (2, 200);
insert into Book values (3, 300);

select * from Orders;
select * from OrderDetail;
select * from Book;

update Book set book_stock = 1000 where book_id = 1;
update Book set book_stock = 2000 where book_id = 2;
update Book set book_stock = 3000 where book_id = 3;

select * from Book b, Orders o, OrderDetail od where o.order_id = od.order_id and od.book_id = b.book_id;

update Book b set b.book_stock = 
b.book_stock - (select od.odr_cnt from OrderDetail od, Orders o 
where b.book_id = od.book_id and od.order_id = o.order_id and o.order_id = 1);