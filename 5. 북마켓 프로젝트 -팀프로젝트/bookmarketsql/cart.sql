select * from Cart order by cart_date desc, cart_id desc;
-------------------------------------------------------------------------------------------------------------------
-- �ش����� īƮ�� ����ִ� �����ȵ� ��ü å ���� ��������
select count(*) from Cart where user_id = 'userId1' and cart_del = 'n';
-------------------------------------------------------------------------------------------------------------------
select * from ( -- �ش����� īƮ�� ����ִ� �����ȵ� å ����Ʈ �������� ��ٱ��Ͽ� ��� �ֽż�����
    select f_qry.*, rownum as rnum from (
        select c.cart_id, c.user_id, c.book_id, c.book_cnt, c.cart_del, c.cart_date,
        b.bsc_id, b.book_price, b.book_name, b.book_writer, b.book_desc,
        b.book_index, b.book_pub_cmt, b.book_stock, b.book_date, b.book_img,
        b.book_page, b.book_size, b.book_isbn, b.book_out, b.book_rcd_cnt
        from Cart c, Book b where b.book_id = c.book_id and user_id = 'userId1' and c.cart_del = 'n'
        order by c.cart_date desc, c.cart_id desc
    ) f_qry
) where rnum between 1 and 9999;
---------------------------------------------------------------------------------------------------------------------
select nvl(sum(c.book_cnt * b.book_price), 0) -- �ش������� �����ȵ� ��ٱ��� ��ü�� ���� ��ü�ֹ��ݾ�
from Cart c, Book b where b.book_id = c.book_id and user_id = 'userId1' and cart_del = 'n';
---------------------------------------------------------------------------------------------------------------------
select * from Cart c, Book b -- �ش������� �����ȵ� ��ٱ��� ��ü�� ���� å ����� ũ�ų� ��� 0�� ����Ʈ ��������
where (c.book_id = b.book_id and user_id = 'userId1' and cart_del = 'n')
and (c.book_cnt > b.book_stock or b.book_stock = 0);
----------------------------------------------------------------------------------------------------------------------
select * from Cart c, Book b -- �ش����� īƮ�� ����ִ� �����ȵ� ��üå ����Ʈ ��������
where b.book_id = c.book_id and user_id = 'userId1' and c.cart_del = 'n'
order by c.cart_date desc, c.cart_id desc;
-----------------------------------------------------------------------------------------------------------------------