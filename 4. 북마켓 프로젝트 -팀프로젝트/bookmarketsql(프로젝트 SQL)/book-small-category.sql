select * from BookSmallCategory;
desc BookSmallCategory;
---------------------------------------------------------------------����
insert into BookSmallCategory values (1, 1, '��ȭ');--��ȭ
insert into BookSmallCategory values (2, 1, '�Ҽ�');--�Ҽ�
insert into BookSmallCategory values (3, 1, '����');--����
insert into BookSmallCategory values (4, 1, '��ġ');--��ġ
insert into BookSmallCategory values (5, 1, '���');--���
----------------------------------------------------------------------����
insert into BookSmallCategory values (6, 2, '����');--����
insert into BookSmallCategory values (7, 2, '�Ϻ���');--�Ϻ�
insert into BookSmallCategory values (8, 2, '�߱���');--�߱�
insert into BookSmallCategory values (9, 2, '��Ÿ');--��Ÿ
------------------------------------------------------------------------ebook
insert into BookSmallCategory values (10, 3, '����');--����
insert into BookSmallCategory values (11, 3, '�θǽ�');--�θǽ�
insert into BookSmallCategory values (12, 3, '�ｺ');--�ｺ
insert into BookSmallCategory values (13, 3, '����');--����
insert into BookSmallCategory values (14, 3, '�丮');--�丮

update BookSmallCategory set bsc_name = '��ȭ' where bsc_id = 1;
update BookSmallCategory set bsc_name = '�Ҽ�' where bsc_id = 2;
update BookSmallCategory set bsc_name = '����' where bsc_id = 3;
update BookSmallCategory set bsc_name = '��ġ' where bsc_id = 4;
update BookSmallCategory set bsc_name = '���' where bsc_id = 5;
update BookSmallCategory set bsc_name = '����' where bsc_id = 6;
update BookSmallCategory set bsc_name = '�Ϻ�' where bsc_id = 7;
update BookSmallCategory set bsc_name = '�߱�' where bsc_id = 8;
update BookSmallCategory set bsc_name = '��Ÿ' where bsc_id = 9;
update BookSmallCategory set bsc_name = '����' where bsc_id = 10;
update BookSmallCategory set bsc_name = '�θǽ�' where bsc_id = 11;
update BookSmallCategory set bsc_name = '�ｺ' where bsc_id = 12;
update BookSmallCategory set bsc_name = '����' where bsc_id = 13;
update BookSmallCategory set bsc_name = '�丮' where bsc_id = 14;
---------------------------------------------------------------------