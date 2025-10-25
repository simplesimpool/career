--------------------------------------------------------------------------------------------------------
SELECT dt_qry.*, (dt_qry.tot_odr_cnt - dt_qry.prev_tot_odr_cnt) / prod_std_efv_date odr_delta, prod.* --버전1
FROM (SELECT p.product_id product_id, COUNT(p.product_id) tot_odr_cnt,
    (SELECT COUNT(*)
    FROM Orders o1
    INNER JOIN OrderProduct op1 ON (o1.order_id = op1.order_id)
    WHERE TO_DATE(o1.order_date, 'YYYY-MM-DD') <= TO_DATE(SYSDATE - 180, 'YYYY-MM-DD')
    AND op1.product_id = p.product_id) prev_tot_odr_cnt, 
    MAX(psc.prod_sl_ctg_std_ord_delta) prod_std_ord_delta,
    MAX(psc.prod_sl_ctg_std_ord_efv_date) prod_std_efv_date
    FROM Orders o
    INNER JOIN OrderProduct op ON (o.order_id = op.order_id)
    INNER JOIN Product p ON (op.product_id = p.product_id)
    INNER JOIN ProductSmallCategory psc ON (p.prod_sl_ctg_id = psc.prod_sl_ctg_id)
    WHERE p.prod_sl_ctg_id = 1
    GROUP BY p.product_id) dt_qry
INNER JOIN Product prod ON (dt_qry.product_id = prod.product_id)
WHERE (dt_qry.tot_odr_cnt - dt_qry.prev_tot_odr_cnt) / prod_std_efv_date > prod_std_ord_delta
ORDER BY dt_qry.tot_odr_cnt DESC, prod.product_rating DESC, prod.product_rating_cnt DESC, prod.product_view_cnt DESC;
-------------------------------------------------------------------------------------------------------------------------
SELECT p.product_id product_id, --버전2 
    MAX(p.product_name) product_name,
    MAX(p.product_reg_date) product_reg_date,
    MAX(p.product_rating) product_rating,
    MAX(p.product_rating_cnt) product_rating_cnt,
    MAX(p.product_view_cnt) product_view_cnt
    FROM Orders o
    INNER JOIN OrderProduct op ON (o.order_id = op.order_id)
    INNER JOIN Product p ON (op.product_id = p.product_id)
    WHERE p.prod_sl_ctg_id = 1
GROUP BY p.product_id
HAVING (COUNT(p.product_id) - (SELECT COUNT(*)
        FROM Orders o1
        INNER JOIN OrderProduct op1 ON (o1.order_id = op1.order_id)
        WHERE TO_DATE(o1.order_date, 'YYYY-MM-DD') <= TO_DATE(SYSDATE - 180, 'YYYY-MM-DD')
        AND op1.product_id = p.product_id)) / 180 > 0.01
ORDER BY COUNT(p.product_id) DESC,
(COUNT(p.product_id) - (SELECT COUNT(*)
FROM Orders o1
INNER JOIN OrderProduct op1 ON (o1.order_id = op1.order_id)
WHERE TO_DATE(o1.order_date, 'YYYY-MM-DD') <= TO_DATE(SYSDATE - 180, 'YYYY-MM-DD')
AND op1.product_id = p.product_id)) / 180 DESC,
MAX(p.product_rating) DESC, MAX(p.product_rating_cnt) DESC, MAX(p.product_view_cnt) DESC;
-------------------------------------------------------------------------------------------------------------------------
-- 상품명으로 조회시 WHERE p.prod_sl_ctg_id = 1 를 상품명 WHERE 절로 바꿔주기만 하면됨. 하지만 이에 따른 델타값을 따로 고려해야함.








