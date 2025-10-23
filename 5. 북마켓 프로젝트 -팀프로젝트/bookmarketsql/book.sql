select * from Book order by book_date desc, book_id desc;
--------------------------------------------------------------------------------------------------------------------------
select * from Book b, BookSellRequest bsr, BookLargeCategory blc, BookSmallCategory bsc -- �ǸŰ����� ī�װ� ���Ե� å ��������
where b.book_id = 616 ---���� ó���ϱ�
and b.book_id = bsr.book_id 
and bsr.bsr_yn = 'y' 
and b.bsc_id = bsc.bsc_id 
and bsc.blc_id = blc.blc_id;
----------------------------------------------------------------------------------------------------------------------------------
select count(*) from Book b, BookSellRequest bsr, BookLargeCategory blc, BookSmallCategory bsc -- �ǸŰ����� ��ü ī�װ�ȭ �� å ����
where bsr.bsr_yn = 'y' and b.book_id = bsr.book_id and bsr.bsr_yn = 'y' and b.bsc_id = bsc.bsc_id and bsc.blc_id = blc.blc_id;
----------------------------------------------------------------------------------------------------------------------------------
select count(*) from Book b, BookSellRequest bsr, BookLargeCategory blc, BookSmallCategory bsc -- �ǸŰ����� Ű���� ������ ��ü ī�װ�ȭ �� å ����
where bsr.bsr_yn = 'y' and b.book_id = bsr.book_id and bsr.bsr_yn = 'y' and b.bsc_id = bsc.bsc_id and bsc.blc_id = blc.blc_id
and b.book_name like '%' || '1' || '%';
-----------------------------------------------------------------------------------------------------------------------------------
select * from ( --�ֽż����� �ǸŰ����� ī�װ�ȭ �� å ����Ʈ �������� (���ǵ� å�� �� �Ʒ���)
    select f_qry.*, rownum as rnum from (
        select b.book_id, b.bsc_id, b.book_price, b.book_name, 
        b.book_writer, b.book_desc, b.book_index,
        b.book_pub_cmt, b.book_stock, b.book_date, b.book_img, 
        b.book_page, b.book_size, b.book_isbn, b.book_out, b.book_rcd_cnt,
        bsr.bsr_id, bsr.pub_id, bsr.bsr_cnt, bsr.bsr_yn, bsr.bsr_date, bsr.bsr_confirm, 
        bsc.bsc_name, 
        blc.blc_id, blc.blc_name
        from Book b, BookSellRequest bsr, BookLargeCategory blc, BookSmallCategory bsc
        where bsr.bsr_yn = 'y' and b.book_id = bsr.book_id and b.bsc_id = bsc.bsc_id and bsc.blc_id = blc.blc_id
        order by b.book_out asc, b.book_date desc, b.book_id desc
    ) f_qry
) where rnum between 1 and 9999;
-------------------------------------------------------------------------------------------------------------------------
select * from ( -- �ֽż����� �ǸŰ����� Ű���� ������ ��ü ī�װ�ȭ �� å ����Ʈ �������� (���ǵ� å�� �� �Ʒ���)
    select f_qry.*, rownum as rnum from (
        select b.book_id, b.bsc_id, b.book_price, b.book_name, 
        b.book_writer, b.book_desc, b.book_index,
        b.book_pub_cmt, b.book_stock, b.book_date, b.book_img, 
        b.book_page, b.book_size, b.book_isbn, b.book_out, b.book_rcd_cnt,
        bsr.bsr_id, bsr.pub_id, bsr.bsr_cnt, bsr.bsr_yn, bsr.bsr_date, bsr.bsr_confirm,
        bsc.bsc_name, 
        blc.blc_id, blc.blc_name
        from Book b, BookSellRequest bsr, BookLargeCategory blc, BookSmallCategory bsc
        where bsr.bsr_yn = 'y' and b.book_id = bsr.book_id and b.bsc_id = bsc.bsc_id and bsc.blc_id = blc.blc_id
        and b.book_name like '%' || '1' || '%'
        order by b.book_out asc, b.book_date desc, b.book_id desc
    ) f_qry
) where rnum between 1 and 9999;
----------------------------------------------------------------------------------------------------------------------------
-- ������ ����Ʈ å ����Ʈ ��������
select * from (
    select f_qry.*, rownum as rnum from (
        select b.book_id, b.bsc_id, b.book_price, b.book_name, 
        b.book_writer, b.book_desc, b.book_index,
        b.book_pub_cmt, b.book_stock, b.book_date, b.book_img, 
        b.book_page, b.book_size, b.book_isbn, b.book_out, b.book_rcd_cnt,
        bsr.bsr_id, bsr.pub_id, bsr.bsr_cnt, bsr.bsr_yn, bsr.bsr_date, bsr.bsr_confirm,
        bsc.bsc_name, 
        blc.blc_id, blc.blc_name
        from Book b, BookSellRequest bsr, BookLargeCategory blc, BookSmallCategory bsc
        where bsr.bsr_yn = 'y' and b.book_id = bsr.book_id and b.bsc_id = bsc.bsc_id and bsc.blc_id = blc.blc_id
        and b.book_out = 'n' and b.book_stock != 0 and b.book_date like to_date(sysdate, 'YYYY-MM-DD')
        order by b.book_rcd_cnt desc, b.book_date desc, b.book_id desc
    ) f_qry
) where rnum between 1 and 5;
----------------------------------------------------------------------------------------------------------------------------
-- �ְ� ����Ʈ å ����Ʈ ��������
select * from (
    select f_qry.*, rownum as rnum from (
        select b.book_id, b.bsc_id, b.book_price, b.book_name, 
        b.book_writer, b.book_desc, b.book_index,
        b.book_pub_cmt, b.book_stock, b.book_date, b.book_img, 
        b.book_page, b.book_size, b.book_isbn, b.book_out, b.book_rcd_cnt,
        bsr.bsr_id, bsr.pub_id, bsr.bsr_cnt, bsr.bsr_yn, bsr.bsr_date, bsr.bsr_confirm,
        bsc.bsc_name, 
        blc.blc_id, blc.blc_name
        from Book b, BookSellRequest bsr, BookLargeCategory blc, BookSmallCategory bsc
        where bsr.bsr_yn = 'y' and b.book_id = bsr.book_id and b.bsc_id = bsc.bsc_id and bsc.blc_id = blc.blc_id
        and b.book_out = 'n' and b.book_stock != 0 
        and to_date(b.book_date, 'YYYY-MM-DD') between to_date(sysdate - 7, 'YYYY-MM-DD') and to_date(sysdate, 'YYYY-MM-DD')
        order by b.book_rcd_cnt desc, b.book_date desc, b.book_id desc
    ) f_qry
) where rnum between 1 and 5;
----------------------------------------------------------------------------------------------------------------------------
-- ī�װ��� ��ġ�ϴ� �ǸŰ����� å ����Ʈ �������� (���ǵ� å�� �� �Ʒ���)
select * from (
    select f_qry.*, rownum as rnum from (
        select b.book_id, b.bsc_id, b.book_price, b.book_name,
        b.book_writer, b.book_desc, b.book_index,
        b.book_pub_cmt, b.book_stock, b.book_date, b.book_img, 
        b.book_page, b.book_size, b.book_isbn, b.book_out, b.book_rcd_cnt,
        bsr.bsr_id, bsr.pub_id, bsr.bsr_cnt, bsr.bsr_yn, bsr.bsr_date, bsr.bsr_confirm, 
        bsc.bsc_name, 
        blc.blc_id, blc.blc_name
        from Book b, BookSellRequest bsr, BookLargeCategory blc, BookSmallCategory bsc
        where bsr.bsr_yn = 'y' and b.book_id = bsr.book_id and b.bsc_id = bsc.bsc_id and bsc.bsc_id = 1
        and bsc.blc_id = blc.blc_id
        order by b.book_out asc, b.book_date desc, b.book_id desc
    ) f_qry
) where rnum between 1 and 9999;
----------------------------------------------------------------------------------------------------------------------------
-- ī�װ��� ��ġ�ϴ� �ǸŰ����� å ��ü ����
select count(*) from (
    select f_qry.*, rownum as rnum from (
        select b.book_id, b.bsc_id, b.book_price, b.book_name,
        b.book_writer, b.book_desc, b.book_index,
        b.book_pub_cmt, b.book_stock, b.book_date, b.book_img, 
        b.book_page, b.book_size, b.book_isbn, b.book_out, b.book_rcd_cnt,
        bsr.bsr_id, bsr.pub_id, bsr.bsr_cnt, bsr.bsr_yn, bsr.bsr_date, bsr.bsr_confirm, 
        bsc.bsc_name,
        blc.blc_id, blc.blc_name
        from Book b, BookSellRequest bsr, BookLargeCategory blc, BookSmallCategory bsc
        where bsr.bsr_yn = 'y' and b.book_id = bsr.book_id and b.bsc_id = bsc.bsc_id and bsc.bsc_id = 1
        and bsc.blc_id = blc.blc_id
        order by b.book_out asc, b.book_date desc, b.book_id desc
    ) f_qry
);
----------------------------------------------------------------------------------------------------------------------------