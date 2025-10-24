CREATE TABLE Users
(
    user_id VARCHAR2(1000) NOT NULL,
    user_pw VARCHAR2(1000) NOT NULL,
    user_name VARCHAR2(1000) NOT NULL,
    user_reg_date DATE NOT NULL
);

CREATE TABLE Cart
(
    user_id VARCHAR2(1000) NOT NULL,
    product_id NUMBER NOT NULL,
    cond_id NUMBER NOT NULL,
    cart_prod_put_date DATE NOT NULL
);

CREATE TABLE ProductRecommendation
(
    user_id VARCHAR2(1000) NOT NULL,
    product_id NUMBER NOT NULL,
    product_recd_score NUMBER NOT NULL,
    product_recd_date DATE NOT NULL
);

CREATE TABLE PartnerCompany 
(
    part_com_id NUMBER NOT NULL,
    part_com_name VARCHAR2(1000) NOT NULL,
    part_com_no VARCHAR2(1000) NULL,
    part_com_reg_date DATE NOT NULL
);

CREATE TABLE Condition
(
    cond_id NUMBER NOT NULL, 
    cond_name VARCHAR2(1000) NOT NULL,
    cond_reg_date DATE NOT NULL
);

CREATE TABLE DetailedCondition
(
    det_cond_id NUMBER NOT NULL,
    cond_id NUMBER NOT NULL,
    det_cond_name VARCHAR2(1000) NOT NULL,
    det_cond_reg_date DATE NOT NULL
);

CREATE TABLE Orders
(
    order_id NUMBER NOT NULL,
    user_id VARCHAR2(1000) NOT NULL,
    cond_id NUMBER NOT NULL,
    det_cond_id NUMBER NULL,
    order_date DATE NOT NULL,
    order_sum NUMBER NOT NULL
);

CREATE TABLE OrderProduct
(
    order_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    cond_id NUMBER NOT NULL,
    det_cond_id NUMBER NULL,
    order_cnt NUMBER CHECK(order_cnt >= 1) NOT NULL
);

CREATE TABLE OrderProductDelivery
(
    ord_prod_dlvy_loc VARCHAR2(1000) NOT NULL,
    order_id NUMBER NOT NULL, 
    product_id NUMBER NOT NULL,
    cond_id NUMBER NOT NULL,
    det_cond_id NUMBER NULL,
    cur_ord_prod_dlvy_loc VARCHAR2(1000) NULL,
    ord_prod_dlvy_st_date DATE NULL,
    ord_prod_dlvy_ed_date DATE NULL
);

CREATE TABLE Product
(
    product_id NUMBER NOT NULL,
    prod_sl_ctg_id NUMBER NOT NULL,
    product_name VARCHAR2(1000) NOT NULL,
    product_reg_date DATE NOT NULL, 
    product_rating NUMBER DEFAULT 0 NOT NULL,
    product_rating_cnt NUMBER DEFAULT 0 NOT NULL,
    product_view_cnt NUMBER DEFAULT 0 NOT NULL
);

CREATE TABLE ProductService
(
    product_id NUMBER NOT NULL,
    service_id NUMBER NOT NULL,
    det_serv_id NUMBER NULL,
    prod_serv_reg_date DATE NOT NULL
);

CREATE TABLE Search
(
    search_id NUMBER NOT NULL,
    search_name VARCHAR2(1000),
    search_reg_date DATE NOT NULL
);

CREATE TABLE DetailedSearch
(
    det_srch_id NUMBER NOT NULL,
    search_id NUMBER NOT NULL, 
    det_srch_name VARCHAR2(1000) NOT NULL, 
    det_srch_reg_date DATE NOT NULL
);


CREATE TABLE ProductLargeCategory
(
    prod_lg_ctg_id NUMBER NOT NULL,
    prod_lg_ctg_name VARCHAR2(1000) NOT NULL,
    prod_lg_ctg_reg_date DATE NOT NULL,
    prod_lg_ctg_std_ord_delta NUMBER NOT NULL,
    prod_lg_ctg_std_ord_efv_date NUMBER NOT NULL
);

CREATE TABLE ProductMediumCategory
(
    prod_md_ctg_id NUMBER NOT NULL,
    prod_lg_ctg_id NUMBER NOT NULL,
    prod_md_ctg_name VARCHAR2(1000) NOT NULL,
    prod_md_ctg_reg_date DATE NOT NULL,
    prod_md_ctg_std_ord_delta NUMBER NOT NULL,
    prod_md_ctg_std_ord_efv_date NUMBER NOT NULL
);

CREATE TABLE ProductSmallCategory
(
    prod_sl_ctg_id NUMBER NOT NULL,
    prod_md_ctg_id NUMBER NOT NULL,
    prod_sl_ctg_name VARCHAR2(1000) NOT NULL,
    prod_sl_ctg_reg_date DATE NOT NULL,
    prod_sl_ctg_std_ord_delta NUMBER NOT NULL,
    prod_sl_ctg_std_ord_efv_date NUMBER NOT NULL
);

CREATE TABLE Service
(
    service_id NUMBER NOT NULL,
    service_name VARCHAR2(1000) NOT NULL,
    service_reg_date DATE NOT NULL
);

CREATE TABLE DetailedService
(
    det_serv_id NUMBER NOT NULL,
    service_id NUMBER NOT NULL,
    det_serv_name VARCHAR2(1000) NOT NULL,
    det_serv_reg_date DATE NOT NULL
);

CREATE TABLE Request
(
    req_id NUMBER NOT NULL,
    req_name VARCHAR2(1000) NOT NULL,
    req_reg_date DATE NOT NULL
);

CREATE TABLE DetailedRequest
(
    det_req_id NUMBER NOT NULL,
    req_id NUMBER NOT NULL,
    det_req_name VARCHAR2(1000) NOT NULL,
    det_req_reg_date DATE NOT NULL
);

CREATE TABLE PartnerCompanyRequest
(
    part_com_id NUMBER NOT NULL,
    service_id NUMBER NOT NULL,
    req_id NUMBER NOT NULL,
    det_serv_id NUMBER NULL,
    det_req_id NUMBER NULL,
    cond_id NUMBER NOT NULL,
    det_cond_id NUMBER NULL,
    product_id NUMBER NULL,
    part_com_req_date DATE NOT NULL
);

CREATE TABLE UserProductSearch
(
    user_prod_srch_kw VARCHAR2(1000) NOT NULL,
    user_prod_srch_date DATE NOT NULL,
    user_id VARCHAR2(1000) NULL,
    search_id NUMBER NOT NULL,
    det_srch_id NUMBER NULL
);

ALTER TABLE Condition ADD CONSTRAINT pk_condition PRIMARY KEY(cond_id);
ALTER TABLE DetailedCondition ADD CONSTRAINT pk_detailed_condition PRIMARY KEY(det_cond_id);
ALTER TABLE DetailedCondition ADD CONSTRAINT fk_detailed_condition_cond_id FOREIGN KEY (cond_id) REFERENCES Condition(cond_id);
ALTER TABLE Users ADD CONSTRAINT pk_users PRIMARY KEY(user_id);
ALTER TABLE Search ADD CONSTRAINT pk_search PRIMARY KEY(search_id);
ALTER TABLE DetailedSearch ADD CONSTRAINT pk_detailed_search PRIMARY KEY(det_srch_id);
ALTER TABLE DetailedSearch ADD CONSTRAINT fk_detailed_search_search_id FOREIGN KEY(search_id) REFERENCES Search(search_id);
ALTER TABLE UserProductSearch ADD CONSTRAINT pk_user_product_search PRIMARY KEY(user_prod_srch_kw, user_prod_srch_date);
ALTER TABLE UserProductSearch ADD CONSTRAINT fk_user_product_search_user_id FOREIGN KEY(user_id) REFERENCES Users(user_id);
ALTER TABLE UserProductSearch ADD CONSTRAINT fk_user_product_search_search_id FOREIGN KEY(search_id) REFERENCES Search(Search_id);
ALTER TABLE UserProductSearch ADD CONSTRAINT fk_user_product_search_det_srch_id FOREIGN KEY(det_srch_id) REFERENCES DetailedSearch(det_srch_id);
ALTER TABLE ProductLargeCategory ADD CONSTRAINT pk_product_large_category PRIMARY KEY(prod_lg_ctg_id);
ALTER TABLE ProductMediumCategory ADD CONSTRAINT pk_product_medium_category PRIMARY KEY(prod_md_ctg_id);
ALTER TABLE ProductMediumCategory ADD CONSTRAINT fk_product_medium_category_prod_lg_ctg_id FOREIGN KEY(prod_lg_ctg_id) REFERENCES ProductLargeCategory(prod_lg_ctg_id);
ALTER TABLE ProductSmallCategory ADD CONSTRAINT pk_product_small_category PRIMARY KEY(prod_sl_ctg_id);
ALTER TABLE ProductSmallCategory ADD CONSTRAINT fk_product_small_category_prod_md_ctg_id FOREIGN KEY(prod_md_ctg_id) REFERENCES ProductMediumCategory(prod_md_ctg_id);
ALTER TABLE Service ADD CONSTRAINT pk_service PRIMARY KEY(service_id);
ALTER TABLE DetailedService ADD CONSTRAINT pk_detailed_service PRIMARY KEY(det_serv_id);
ALTER TABLE DetailedService ADD CONSTRAINT fk_detailed_servicec FOREIGN KEY(service_id) REFERENCES Service(service_id);
ALTER TABLE Request ADD CONSTRAINT pk_request PRIMARY KEY(req_id);
ALTER TABLE DetailedRequest ADD CONSTRAINT pk_detailed_request PRIMARY KEY(det_req_id);
ALTER TABLE DetailedRequest ADD CONSTRAINT fk_detailed_request FOREIGN KEY(req_id) REFERENCES Request(req_id);
ALTER TABLE PartnerCompany ADD CONSTRAINT pk_partner_company PRIMARY KEY(part_com_id);
ALTER TABLE Product ADD CONSTRAINT pk_product PRIMARY KEY(product_id);
ALTER TABLE Product ADD CONSTRAINT fk_product_prod_sl_ctg_id FOREIGN KEY(prod_sl_ctg_id) REFERENCES ProductSmallCategory(prod_sl_ctg_id);
ALTER TABLE Orders ADD CONSTRAINT pk_orders PRIMARY KEY(order_id);
ALTER TABLE Orders ADD CONSTRAINT fk_orders_user_id FOREIGN KEY(user_id) REFERENCES Users(user_id);
ALTER TABLE Orders ADD CONSTRAINT fk_orders_cond_id FOREIGN KEY(cond_id) REFERENCES Condition(cond_id);
ALTER TABLE Orders ADD CONSTRAINT fk_orders_det_cond_id FOREIGN KEY(det_cond_id) REFERENCES DetailedCondition(det_cond_id);
ALTER TABLE OrderProduct ADD CONSTRAINT pk_order_product PRIMARY KEY(order_id, product_id);
ALTER TABLE OrderProduct ADD CONSTRAINT fk_order_product_order_id FOREIGN KEY(order_id) REFERENCES Orders(order_id);
ALTER TABLE OrderProduct ADD CONSTRAINT fk_order_product_product_id FOREIGN KEY(product_id) REFERENCES Product(product_id);
ALTER TABLE OrderProduct ADD CONSTRAINT fk_order_product_cond_id FOREIGN KEY(cond_id) REFERENCES Condition(cond_id);
ALTER TABLE OrderProduct ADD CONSTRAINT fk_order_product_det_cond_id FOREIGN KEY(det_cond_id) REFERENCES DetailedCondition(det_cond_id);
ALTER TABLE OrderProductDelivery ADD CONSTRAINT pk_order_product_delivery PRIMARY KEY(ord_prod_dlvy_loc, order_id, product_id);
ALTER TABLE OrderProductDelivery ADD CONSTRAINT fk_order_product_delivery_order_id FOREIGN KEY(order_id, product_id) REFERENCES OrderProduct(order_id, product_id);
ALTER TABLE OrderProductDelivery ADD CONSTRAINT fk_order_product_delivery_cond_id FOREIGN KEY(cond_id) REFERENCES Condition(cond_id);
ALTER TABLE OrderProductDelivery ADD CONSTRAINT fk_order_product_delivery_det_cond_id FOREIGN KEY(det_cond_id) REFERENCES DetailedCondition(det_cond_id);
ALTER TABLE ProductRecommendation ADD CONSTRAINT pk_product_recommendation PRIMARY KEY(user_id, product_id);
ALTER TABLE ProductRecommendation ADD CONSTRAINT fk_product_recommendation_user_id FOREIGN KEY(user_id) REFERENCES Users(user_id);
ALTER TABLE ProductRecommendation ADD CONSTRAINT fk_product_recommendation_product_id FOREIGN KEY(product_id) REFERENCES Product(product_id);
ALTER TABLE ProductService ADD CONSTRAINT pk_product_service PRIMARY KEY(product_id, service_id);
ALTER TABLE ProductService ADD CONSTRAINT fk_product_service_product_id FOREIGN KEY(product_id) REFERENCES Product(product_id);
ALTER TABLE ProductService ADD CONSTRAINT fk_product_service_service_id FOREIGN KEY(service_id) REFERENCES Service(service_id);
ALTER TABLE ProductService ADD CONSTRAINT fk_product_service_det_serv_id FOREIGN KEY(det_serv_id) REFERENCES DetailedService(det_serv_id);
ALTER TABLE PartnerCompanyRequest ADD CONSTRAINT pk_partner_company_request PRIMARY KEY(part_com_id, service_id, req_id);
ALTER TABLE PartnerCompanyRequest ADD CONSTRAINT fk_partner_company_request_part_com_id FOREIGN KEY(part_com_id) REFERENCES PartnerCompany(part_com_id);
ALTER TABLE PartnerCompanyRequest ADD CONSTRAINT fk_partner_company_request_service_id FOREIGN KEY(service_id) REFERENCES Service(service_id);
ALTER TABLE PartnerCompanyRequest ADD CONSTRAINT fk_partner_company_request_det_serv_id FOREIGN KEY(det_serv_id) REFERENCES DetailedService(det_serv_id);
ALTER TABLE PartnerCompanyRequest ADD CONSTRAINT fk_partner_company_request_req_id FOREIGN KEY(req_id) REFERENCES Request(req_id);
ALTER TABLE PartnerCompanyRequest ADD CONSTRAINT fk_partner_company_request_det_req_id FOREIGN KEY(det_req_id) REFERENCES DetailedRequest(det_req_id);
ALTER TABLE PartnerCompanyRequest ADD CONSTRAINT fk_partner_company_request_cond_id FOREIGN KEY(cond_id) REFERENCES Condition(cond_id);
ALTER TABLE PartnerCompanyRequest ADD CONSTRAINT fk_partner_company_request_det_cond_id FOREIGN KEY(det_cond_id) REFERENCES DetailedCondition(det_cond_id);
ALTER TABLE PartnerCompanyRequest ADD CONSTRAINT fk_partner_company_request_product_id FOREIGN KEY(product_id) REFERENCES Product(product_id);
ALTER TABLE Cart ADD CONSTRAINT pk_cart PRIMARY KEY(user_id, product_id);
ALTER TABLE Cart ADD CONSTRAINT fk_cart_user_id FOREIGN KEY(user_id) REFERENCES Users(user_id);
ALTER TABLE Cart ADD CONSTRAINT fk_cart_product_id FOREIGN KEY(product_id) REFERENCES Product(product_id);
ALTER TABLE Cart ADD CONSTRAINT fk_cart_cond_id FOREIGN KEY(cond_id) REFERENCES Condition(cond_id);

INSERT INTO Users(user_id, user_pw, user_name, user_reg_date) VALUES ('userId1', '1', 'userName1', SYSDATE);
INSERT INTO Users(user_id, user_pw, user_name, user_reg_date) VALUES ('userId2', '2', 'userName2', SYSDATE);
INSERT INTO Users(user_id, user_pw, user_name, user_reg_date) VALUES ('userId3', '3', 'userName3', SYSDATE);
INSERT INTO Users(user_id, user_pw, user_name, user_reg_date) VALUES ('userId4', '4', 'userName4', SYSDATE);
INSERT INTO Users(user_id, user_pw, user_name, user_reg_date) VALUES ('userId5', '5', 'userName5', SYSDATE);
INSERT INTO ProductLargeCategory(prod_lg_ctg_id, prod_lg_ctg_name, prod_lg_ctg_reg_date, prod_lg_ctg_std_ord_delta, prod_lg_ctg_std_ord_efv_date)
VALUES(1, 'LargeCategory1', SYSDATE, 0.01, 180);
INSERT INTO ProductLargeCategory(prod_lg_ctg_id, prod_lg_ctg_name, prod_lg_ctg_reg_date, prod_lg_ctg_std_ord_delta, prod_lg_ctg_std_ord_efv_date)
VALUES(2, 'LargeCategory2', SYSDATE, 0.01, 180);
INSERT INTO ProductLargeCategory(prod_lg_ctg_id, prod_lg_ctg_name, prod_lg_ctg_reg_date, prod_lg_ctg_std_ord_delta, prod_lg_ctg_std_ord_efv_date)
VALUES(3, 'LargeCategory3', SYSDATE, 0.01, 180);
INSERT INTO ProductLargeCategory(prod_lg_ctg_id, prod_lg_ctg_name, prod_lg_ctg_reg_date, prod_lg_ctg_std_ord_delta, prod_lg_ctg_std_ord_efv_date)
VALUES(4, 'LargeCategory4', SYSDATE, 0.01, 180);
INSERT INTO ProductLargeCategory(prod_lg_ctg_id, prod_lg_ctg_name, prod_lg_ctg_reg_date, prod_lg_ctg_std_ord_delta, prod_lg_ctg_std_ord_efv_date)
VALUES(5, 'LargeCategory5', SYSDATE, 0.01, 180);
INSERT INTO ProductMediumCategory(prod_md_ctg_id, prod_lg_ctg_id, prod_md_ctg_name, prod_md_ctg_reg_date, prod_md_ctg_std_ord_delta, prod_md_ctg_std_ord_efv_date)
VALUES(1, 1, 'MediumCategory1', SYSDATE, 0.01, 180);
INSERT INTO ProductMediumCategory(prod_md_ctg_id, prod_lg_ctg_id, prod_md_ctg_name, prod_md_ctg_reg_date, prod_md_ctg_std_ord_delta, prod_md_ctg_std_ord_efv_date)
VALUES(2, 1, 'MediumCategory2', SYSDATE, 0.01, 180);
INSERT INTO ProductMediumCategory(prod_md_ctg_id, prod_lg_ctg_id, prod_md_ctg_name, prod_md_ctg_reg_date, prod_md_ctg_std_ord_delta, prod_md_ctg_std_ord_efv_date)
VALUES(3, 1, 'MediumCategory3', SYSDATE, 0.01, 180);
INSERT INTO ProductMediumCategory(prod_md_ctg_id, prod_lg_ctg_id, prod_md_ctg_name, prod_md_ctg_reg_date, prod_md_ctg_std_ord_delta, prod_md_ctg_std_ord_efv_date)
VALUES(4, 1, 'MediumCategory4', SYSDATE, 0.01, 180);
INSERT INTO ProductMediumCategory(prod_md_ctg_id, prod_lg_ctg_id, prod_md_ctg_name, prod_md_ctg_reg_date, prod_md_ctg_std_ord_delta, prod_md_ctg_std_ord_efv_date)
VALUES(5, 1, 'MediumCategory5', SYSDATE, 0.01, 180);
INSERT INTO ProductSmallCategory(prod_sl_ctg_id, prod_md_ctg_id, prod_sl_ctg_name, prod_sl_ctg_reg_date, prod_sl_ctg_std_ord_delta, prod_sl_ctg_std_ord_efv_date)
VALUES(1, 1, 'SmallCategory1', SYSDATE, 0.01, 180);
INSERT INTO ProductSmallCategory(prod_sl_ctg_id, prod_md_ctg_id, prod_sl_ctg_name, prod_sl_ctg_reg_date, prod_sl_ctg_std_ord_delta, prod_sl_ctg_std_ord_efv_date)
VALUES(2, 1, 'SmallCategory2', SYSDATE, 0.01, 180);
INSERT INTO ProductSmallCategory(prod_sl_ctg_id, prod_md_ctg_id, prod_sl_ctg_name, prod_sl_ctg_reg_date, prod_sl_ctg_std_ord_delta, prod_sl_ctg_std_ord_efv_date)
VALUES(3, 1, 'SmallCategory3', SYSDATE, 0.01, 180);
INSERT INTO ProductSmallCategory(prod_sl_ctg_id, prod_md_ctg_id, prod_sl_ctg_name, prod_sl_ctg_reg_date, prod_sl_ctg_std_ord_delta, prod_sl_ctg_std_ord_efv_date)
VALUES(4, 1, 'SmallCategory4', SYSDATE, 0.01, 180);
INSERT INTO ProductSmallCategory(prod_sl_ctg_id, prod_md_ctg_id, prod_sl_ctg_name, prod_sl_ctg_reg_date, prod_sl_ctg_std_ord_delta, prod_sl_ctg_std_ord_efv_date)
VALUES(5, 1, 'SmallCategory5', SYSDATE, 0.01, 180);
INSERT INTO Product(product_id, prod_sl_ctg_id, product_name, product_reg_date, product_rating, product_rating_cnt, product_view_cnt)
VALUES(1, 1, 'productName1', SYSDATE, 1, 1, 1);
INSERT INTO Product(product_id, prod_sl_ctg_id, product_name, product_reg_date, product_rating, product_rating_cnt, product_view_cnt)
VALUES(2, 1, 'productName2', SYSDATE, 2, 2, 2);
INSERT INTO Product(product_id, prod_sl_ctg_id, product_name, product_reg_date, product_rating, product_rating_cnt, product_view_cnt)
VALUES(3, 1, 'productName3', SYSDATE, 3, 3, 3);
INSERT INTO Product(product_id, prod_sl_ctg_id, product_name, product_reg_date, product_rating, product_rating_cnt, product_view_cnt)
VALUES(4, 1, 'productName4', SYSDATE, 3, 4, 4);
INSERT INTO Product(product_id, prod_sl_ctg_id, product_name, product_reg_date, product_rating, product_rating_cnt, product_view_cnt)
VALUES(5, 1, 'productName5', SYSDATE, 5, 5, 5);
INSERT INTO Product(product_id, prod_sl_ctg_id, product_name, product_reg_date, product_rating, product_rating_cnt, product_view_cnt)
VALUES(6, 1, 'productName6', SYSDATE, 6, 6, 6);
INSERT INTO Product(product_id, prod_sl_ctg_id, product_name, product_reg_date, product_rating, product_rating_cnt, product_view_cnt)
VALUES(7, 1, 'productName7', SYSDATE, 7, 7, 7);
INSERT INTO Product(product_id, prod_sl_ctg_id, product_name, product_reg_date, product_rating, product_rating_cnt, product_view_cnt)
VALUES(8, 1, 'productName8', SYSDATE, 8, 8, 8);
INSERT INTO Product(product_id, prod_sl_ctg_id, product_name, product_reg_date, product_rating, product_rating_cnt, product_view_cnt)
VALUES(9, 1, 'productName9', SYSDATE, 9, 9, 9);
INSERT INTO Condition(cond_id, cond_name, cond_reg_date) VALUES(1, '주문완료', SYSDATE);
INSERT INTO Condition(cond_id, cond_name, cond_reg_date) VALUES(2, '주문상품등록완료', SYSDATE);
INSERT INTO Condition(cond_id, cond_name, cond_reg_date) VALUES(3, '배송완료', SYSDATE);
INSERT ALL
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(1, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(1, 1, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 1, 1, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(2, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(2, 1, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 2, 1, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(3, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(3, 1, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 3, 1, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(4, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(4, 1, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 4, 1, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(5, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(5, 1, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 5, 1, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(6, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(6, 1, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 6, 1, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(7, 'userId1', 1, NULL, SYSDATE, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(7, 1, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 7, 1, 3, NULL, NULL, NULL, NULL)
SELECT * FROM Dual;
INSERT ALL
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(8, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(8, 2, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 8, 2, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(9, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(9, 2, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 9, 2, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(10, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(10, 2, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 10, 2, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(11, 'userId1', 1, NULL, SYSDATE, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(11, 2, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 11, 2, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(12, 'userId1', 1, NULL, SYSDATE, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(12, 2, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 12, 2, 3, NULL, NULL, NULL, NULL)
SELECT * FROM Dual;
INSERT ALL
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(13, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(13, 4, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 13, 4, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(14, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(14, 4, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 14, 4, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(15, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(15, 4, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 15, 4, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(16, 'userId1', 1, NULL, SYSDATE, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(16, 4, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 16, 4, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(17, 'userId1', 1, NULL, SYSDATE, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(17, 4, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 17, 4, 3, NULL, NULL, NULL, NULL)
SELECT * FROM Dual;
INSERT ALL
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(18, 'userId1', 1, NULL, SYSDATE - 180, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(18, 3, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 18, 3, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(19, 'userId1', 1, NULL, SYSDATE, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(19, 3, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 19, 3, 3, NULL, NULL, NULL, NULL)
    INTO Orders(order_id, user_id, cond_id, det_cond_id, order_date, order_sum) VALUES(20, 'userId1', 1, NULL, SYSDATE, 0)
    INTO OrderProduct(order_id, product_id, cond_id, det_cond_id, order_cnt) VALUES(20, 3, 2, NULL, 1)
    INTO OrderProductDelivery(ord_prod_dlvy_loc, order_id, product_id, cond_id, det_cond_id, cur_ord_prod_dlvy_loc, ord_prod_dlvy_st_date, ord_prod_dlvy_ed_date)
    VALUES('loc1', 20, 3, 3, NULL, NULL, NULL, NULL)
SELECT * FROM Dual;    



--DELETE FROM Cart;
--DELETE FROM Condition;
--DELETE FROM DetailedCondition;
--DELETE FROM DetailedRequest;
--DELETE FROM DetailedSearch;
--DELETE FROM DetailedService;
--DELETE FROM OrderProduct;
--DELETE FROM OrderProductDelivery;
--DELETE FROM Orders;
--DELETE FROM PartnerCompany;
--DELETE FROM Product;
--DELETE FROM ProductLargeCategory;
--DELETE FROM ProductMediumCategory;
--DELETE FROM ProductSmallCategory;
--DELETE FROM ProductRecommendation;
--DELETE FROM ProductService;
--DELETE FROM Request;
--DELETE FROM Search;
--DELETE FROM Service;
--DELETE FROM UserProductSearch;
--DELETE FROM Users;

--DROP TABLE Cart;
--DROP TABLE Condition;
--DROP TABLE DetailedCondition;
--DROP TABLE DetailedRequest;
--DROP TABLE DetailedSearch;
--DROP TABLE DetailedService;
--DROP TABLE OrderProduct;
--DROP TABLE OrderProductDelivery;
--DROP TABLE Orders;
--DROP TABLE PartnerCompany;
--DROP TABLE PartnerCompanyRequest;
--DROP TABLE Product;
--DROP TABLE ProductLargeCategory;
--DROP TABLE ProductMediumCategory;
--DROP TABLE ProductSmallCategory;
--DROP TABLE ProductRecommendation;
--DROP TABLE ProductService;
--DROP TABLE Request;
--DROP TABLE Search;
--DROP TABLE Service;
--DROP TABLE UserProductSearch;
--DROP TABLE Users;