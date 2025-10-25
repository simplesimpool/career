select * from Cart order by cart_date desc, cart_id desc;
-------------------------------------------------------------------------------------------------------------------
-- 해당유저 카트에 들어있는 삭제안된 전체 책 갯수 가져오기
select count(*) from Cart where user_id = 'userId1' and cart_del = 'n';
-------------------------------------------------------------------------------------------------------------------
select * from ( -- 해당유저 카트에 들어있는 삭제안된 책 리스트 가져오기 장바구니에 담긴 최신순으로
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
select nvl(sum(c.book_cnt * b.book_price), 0) -- 해당유저의 삭제안된 장바구니 전체에 대한 전체주문금액
from Cart c, Book b where b.book_id = c.book_id and user_id = 'userId1' and cart_del = 'n';
---------------------------------------------------------------------------------------------------------------------
select * from Cart c, Book b -- 해당유저의 삭제안된 장바구니 전체에 대한 책 재고보다 크거나 재고가 0인 리스트 가져오기
where (c.book_id = b.book_id and user_id = 'userId1' and cart_del = 'n')
and (c.book_cnt > b.book_stock or b.book_stock = 0);
----------------------------------------------------------------------------------------------------------------------
select * from Cart c, Book b -- 해당유저 카트에 들어있는 삭제안된 전체책 리스트 가져오기
where b.book_id = c.book_id and user_id = 'userId1' and c.cart_del = 'n'
order by c.cart_date desc, c.cart_id desc;
-----------------------------------------------------------------------------------------------------------------------