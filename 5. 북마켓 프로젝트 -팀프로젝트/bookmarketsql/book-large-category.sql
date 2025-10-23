select * from BookLargeCategory;

insert into BookLargeCategory values(1, 'domestic');
insert into BookLargeCategory values(2, 'foreign');
insert into BookLargeCategory values(3, 'ebook');

update BookLargeCategory set blc_name = '국내' where blc_id = 1;
update BookLargeCategory set blc_name = '외국' where blc_id = 2;