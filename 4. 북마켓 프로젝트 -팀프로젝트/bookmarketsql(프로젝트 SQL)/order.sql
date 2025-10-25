select * from Orders order by order_date desc, order_id desc;
update Orders set order_del = 'n', order_confirm = 'n', order_reject = 'y';
--------------------------------------------------------------------------------------------------------------------------
select * from Orders o, OrderDetail od -- ��ü å���Ե� �ֹ���û ����Ʈ �ֽż�����
where o.order_id = od.order_id and o.user_id = 'userId1' and o.order_del = 'n' and o.order_confirm = 'n'
order by o.order_date desc, o.order_id desc, od.od_id asc;
--------------------------------------------------------------------------------------------------------------------------
select * from ( -- �������̵� ���� ���ֹ� ��û ����Ʈ �ֽż�����
    select f_qry.*, rownum as rnum from (
        select o.order_id, o.user_id, o.order_date, o.order_del, o.order_confirm,
        od.od_id, od.book_id, od.odr_cnt
        from Orders o, OrderDetail od
        where o.order_id = od.order_id and o.user_id = 'userId1' and o.order_del = 'n' and o.order_confirm = 'n' and o.order_reject = 'n'
        order by o.order_date desc, o.order_id desc, od.od_id asc
    ) f_qry
) where rnum between 1 and 9999;
--------------------------------------------------------------------------------------------------------------------------
-- �ֹ���û ����Ʈ�� �ش� �ֹ� ���̵� ���� �ֹ� å ����Ʈ �ֽż�����
select * from (
    select ord1.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'n'
        order by order_date desc, order_id desc
    ) ord1
) ord2, OrderDetail od, Book b 
where ord2.order_id = od.order_id and od.book_id = b.book_id and rnum between 1 and 5 
order by ord2.order_id desc, od.od_id asc;
------------------------------------------------------------------------------------------------------------------------------
-- �ֹ� ��û ����Ʈ ��������
select * from (
    select ord1.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'n'
        order by order_date desc, order_id desc
    ) ord1
) where rnum between 1 and 5;
------------------------------------------------------------------------------------------------------------------------------
-- �������̵� ���� ��ü �ֹ���û ����
select count(*) from Orders 
where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'n'; 
-------------------------------------------------------------------------------------------------------------------------------
-- �������̵� ���� ��ü �ֹ��Ϸ� ����
select count(*) from Orders
where user_id = 'userId1' and order_del = 'n' and order_confirm = 'y' and order_reject = 'n';
-------------------------------------------------------------------------------------------------------------------------------
-- �ֹ� �Ϸ� ����Ʈ ��������
select * from (
    select ord1.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'y' and order_reject = 'n'
        order by order_date desc, order_id desc
    ) ord1
) where rnum between 1 and 5;
-------------------------------------------------------------------------------------------------------------------------------
-- �ֹ��Ϸ� ����Ʈ�� �ش� �ֹ� ���̵� ���� �ֹ� å ����Ʈ �ֽż�����
select * from (
    select ord1.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'y' and order_reject = 'n'
        order by order_date desc, order_id desc
    ) ord1
) ord2, OrderDetail od, Book b 
where ord2.order_id = od.order_id and od.book_id = b.book_id and rnum between 1 and 5 
order by ord2.order_id desc, od.od_id asc;
-------------------------------------------------------------------------------------------------------------------------------
-- ��ü �ֹ���û�� ���� ���� ��������
select count(*) from Orders
where order_del = 'n' and order_confirm = 'n' and order_reject = 'n'
order by order_date desc, order_id desc;
-------------------------------------------------------------------------------------------------------------------------------
-- ��ü �ֹ���û�� ���� ����Ʈ ��������
select * from (
    select ord.*, rownum as rnum from (
        select * from Orders 
        where order_del = 'n' and order_confirm = 'n' and order_reject = 'n'
        order by order_date desc, order_id desc
    ) ord
) where rnum between 1 and 9999;
-------------------------------------------------------------------------------------------------------------------------------
-- �ֹ����̵� ���� �ֹ��󼼿� �ִ� å���� �ֹ���û ������ ��� ���� ���� å ����Ʈ ��������
select * from Orders o, OrderDetail od, Book b
where o.order_id = 1 and o.order_id = od.order_id and od.book_id = b.book_id;
-------------------------------------------------------------------------------------------------------------------------------
--�ش� �ֹ����̵� ���� �ֹ������� å ����� ���ų� å ��� 0 ������ ��ü å ��������
select * from Orders o, OrderDetail od, Book b
where o.order_id = 1 
and o.order_id = od.order_id and od.book_id = b.book_id
and (od.odr_cnt > b.book_stock or b.book_stock <= 0);
-------------------------------------------------------------------------------------------------------------------------------
-- �ش� �ֹ��� ���� å ��� ���� �� �ֹ� �����ϱ� (spring boot Service ���� @Transactional ����ϱ�)
begin
    update Orders set order_confirm = 'y' where order_id = 13;

    update Book b set b.book_stock = 
    b.book_stock - nvl((select od.odr_cnt from OrderDetail od, Orders o
    where b.book_id = od.book_id and od.order_id = o.order_id and o.order_id = 13), 0);
    
    commit;
end;
/
-------------------------------------------------------------------------------------------------------------------------------
--�ش���̵� ���� �ֹ���û�ݷ��� ��ü ���� ��������
select count(*) from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'y';
-------------------------------------------------------------------------------------------------------------------------------
--�ش���̵� ���� �ݷ��� �ֹ� ����Ʈ ��������
select * from (
    select o.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'y'
        order by order_date desc, order_id desc
    ) o
) where rnum between 1 and 9999;
-------------------------------------------------------------------------------------------------------------------------------
-- �ֹ��ݷ� ����Ʈ�� �ش� �ֹ� ���̵� ���� �ֹ� å ����Ʈ �ֽż�����
select * from (
    select o1.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'y'
        order by order_date desc, order_id desc
    ) o1
) o2, OrderDetail od, Book b 
where o2.order_id = od.order_id and od.book_id = b.book_id and rnum between 1 and 9999 
order by o2.order_id desc, od.od_id asc;
-------------------------------------------------------------------------------------------------------------------------------