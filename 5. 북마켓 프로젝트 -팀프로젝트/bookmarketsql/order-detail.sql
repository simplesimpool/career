select * from OrderDetail order by od_id asc, order_id desc;
--------------------------------------------------------------------------------------------------
INSERT ALL -- ���� insert (Ʈ����� ó����)
    INTO Orders VALUES ((select count(*) from Orders) + 1, 'userId1', sysdate, 'n', 'n', 'n', 
    (select nvl(sum(c.book_cnt * b.book_price), 0) from Cart c, Book b where b.book_id = c.book_id and user_id = 'userId1' and cart_del = 'n'))
    INTO OrderDetail VALUES (get_od_seq_nextval(), 1, (select count(*) from Orders) + 1, 10) 
    INTO OrderDetail VALUES (get_od_seq_nextval(), 2, (select count(*) from Orders) + 1, 20)
    INTO OrderDetail VALUES (get_od_seq_nextval(), 3, (select count(*) from Orders) + 1, 30)
SELECT * FROM dual;
---------------------------------------------------------------------------------------------------
CREATE SEQUENCE od_seq
START WITH 1
INCREMENT BY 1
nocycle
nocache;

drop sequence od_seq;
-----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_od_seq_nextval
RETURN NUMBER
IS
  v_nextval NUMBER;
BEGIN
  SELECT od_seq.nextval
  INTO v_nextval
  FROM dual; 
  
  RETURN v_nextval;
END;
/

drop function get_od_seq_nextval;
---------------------------------------------------------------------------------------------------------------------
--�ش� �ֹ����̵� ���� �ֹ��� ��ü���� ��������
select count(*) from OrderDetail where order_id = 1;
---------------------------------------------------------------------------------------------------------------------
--�ش� �ֹ����̵� ���� �ֹ��� ����Ʈ ��������
select * from (
    select od.*, rownum as rnum from (
        select * from OrderDetail where order_id = 1
    ) od
) where rnum between 1 and 9999;
---------------------------------------------------------------------------------------------------------------------
--�ش� �ֹ����̵� ���� �ֹ��� ���Ե� å ����Ʈ ��������
select * from (
    select od1.*, rownum as rnum from (
        select * from OrderDetail where order_id = 1
    ) od1
) od2, Book b where od2.book_id = b.book_id and rnum between 1 and 9999;
---------------------------------------------------------------------------------------------------------------------