select * from Orders order by order_date desc, order_id desc;
update Orders set order_del = 'n', order_confirm = 'n', order_reject = 'y';
--------------------------------------------------------------------------------------------------------------------------
select * from Orders o, OrderDetail od -- 전체 책포함된 주문신청 리스트 최신순으로
where o.order_id = od.order_id and o.user_id = 'userId1' and o.order_del = 'n' and o.order_confirm = 'n'
order by o.order_date desc, o.order_id desc, od.od_id asc;
--------------------------------------------------------------------------------------------------------------------------
select * from ( -- 유저아이디에 대한 상세주문 신청 리스트 최신순으로
    select f_qry.*, rownum as rnum from (
        select o.order_id, o.user_id, o.order_date, o.order_del, o.order_confirm,
        od.od_id, od.book_id, od.odr_cnt
        from Orders o, OrderDetail od
        where o.order_id = od.order_id and o.user_id = 'userId1' and o.order_del = 'n' and o.order_confirm = 'n' and o.order_reject = 'n'
        order by o.order_date desc, o.order_id desc, od.od_id asc
    ) f_qry
) where rnum between 1 and 9999;
--------------------------------------------------------------------------------------------------------------------------
-- 주문신청 리스트중 해당 주문 아이디에 대한 주문 책 리스트 최신순으로
select * from (
    select ord1.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'n'
        order by order_date desc, order_id desc
    ) ord1
) ord2, OrderDetail od, Book b 
where ord2.order_id = od.order_id and od.book_id = b.book_id and rnum between 1 and 5 
order by ord2.order_id desc, od.od_id asc;
------------------------------------------------------------------------------------------------------------------------------
-- 주문 신청 리스트 가져오기
select * from (
    select ord1.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'n'
        order by order_date desc, order_id desc
    ) ord1
) where rnum between 1 and 5;
------------------------------------------------------------------------------------------------------------------------------
-- 유저아이디에 대한 전체 주문신청 갯수
select count(*) from Orders 
where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'n'; 
-------------------------------------------------------------------------------------------------------------------------------
-- 유저아이디에 대한 전체 주문완료 갯수
select count(*) from Orders
where user_id = 'userId1' and order_del = 'n' and order_confirm = 'y' and order_reject = 'n';
-------------------------------------------------------------------------------------------------------------------------------
-- 주문 완료 리스트 가져오기
select * from (
    select ord1.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'y' and order_reject = 'n'
        order by order_date desc, order_id desc
    ) ord1
) where rnum between 1 and 5;
-------------------------------------------------------------------------------------------------------------------------------
-- 주문완료 리스트중 해당 주문 아이디에 대한 주문 책 리스트 최신순으로
select * from (
    select ord1.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'y' and order_reject = 'n'
        order by order_date desc, order_id desc
    ) ord1
) ord2, OrderDetail od, Book b 
where ord2.order_id = od.order_id and od.book_id = b.book_id and rnum between 1 and 5 
order by ord2.order_id desc, od.od_id asc;
-------------------------------------------------------------------------------------------------------------------------------
-- 전체 주문신청에 대한 갯수 가져오기
select count(*) from Orders
where order_del = 'n' and order_confirm = 'n' and order_reject = 'n'
order by order_date desc, order_id desc;
-------------------------------------------------------------------------------------------------------------------------------
-- 전체 주문신청에 대한 리스트 가져오기
select * from (
    select ord.*, rownum as rnum from (
        select * from Orders 
        where order_del = 'n' and order_confirm = 'n' and order_reject = 'n'
        order by order_date desc, order_id desc
    ) ord
) where rnum between 1 and 9999;
-------------------------------------------------------------------------------------------------------------------------------
-- 주문아이디에 대한 주문상세에 있는 책들중 주문요청 갯수가 재고 보다 많은 책 리스트 가져오기
select * from Orders o, OrderDetail od, Book b
where o.order_id = 1 and o.order_id = od.order_id and od.book_id = b.book_id;
-------------------------------------------------------------------------------------------------------------------------------
--해당 주문아이디에 대한 주문갯수가 책 재고보다 많거나 책 재고가 0 이하인 전체 책 가져오기
select * from Orders o, OrderDetail od, Book b
where o.order_id = 1 
and o.order_id = od.order_id and od.book_id = b.book_id
and (od.odr_cnt > b.book_stock or b.book_stock <= 0);
-------------------------------------------------------------------------------------------------------------------------------
-- 해당 주문에 대한 책 재고 빼기 및 주문 승인하기 (spring boot Service 에서 @Transactional 사용하기)
begin
    update Orders set order_confirm = 'y' where order_id = 13;

    update Book b set b.book_stock = 
    b.book_stock - nvl((select od.odr_cnt from OrderDetail od, Orders o
    where b.book_id = od.book_id and od.order_id = o.order_id and o.order_id = 13), 0);
    
    commit;
end;
/
-------------------------------------------------------------------------------------------------------------------------------
--해당아이디에 대한 주문신청반려된 전체 갯수 가져오기
select count(*) from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'y';
-------------------------------------------------------------------------------------------------------------------------------
--해당아이디에 대한 반려된 주문 리스트 가져오기
select * from (
    select o.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'y'
        order by order_date desc, order_id desc
    ) o
) where rnum between 1 and 9999;
-------------------------------------------------------------------------------------------------------------------------------
-- 주문반려 리스트중 해당 주문 아이디에 대한 주문 책 리스트 최신순으로
select * from (
    select o1.*, rownum as rnum from (
        select * from Orders where user_id = 'userId1' and order_del = 'n' and order_confirm = 'n' and order_reject = 'y'
        order by order_date desc, order_id desc
    ) o1
) o2, OrderDetail od, Book b 
where o2.order_id = od.order_id and od.book_id = b.book_id and rnum between 1 and 9999 
order by o2.order_id desc, od.od_id asc;
-------------------------------------------------------------------------------------------------------------------------------