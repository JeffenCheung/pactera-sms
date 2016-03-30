
/* Drop Tables */

DROP TABLE test_data_show_how;




/* Create Tables */

CREATE TABLE test_data_show_how
(
	id varchar2(64) NOT NULL,
	user_id varchar2(64),
	office_id varchar2(64),
	area_id nvarchar2(64),
	name nvarchar2(100),
	sex char(1),
	in_date date,
	create_by varchar2(64) NOT NULL,
	create_date timestamp NOT NULL,
	update_by varchar2(64) NOT NULL,
	update_date timestamp NOT NULL,
	remarks nvarchar2(255),
	del_flag char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
);


/* Create Indexes */

CREATE INDEX test_data_show_how_del_flag ON test_data_show_how (del_flag);



/* Comments */

COMMENT ON TABLE test_data_show_how IS '业务数据表_演示';
COMMENT ON COLUMN test_data_show_how.id IS '编号';
COMMENT ON COLUMN test_data_show_how.user_id IS '归属用户';
COMMENT ON COLUMN test_data_show_how.office_id IS '归属部门';
COMMENT ON COLUMN test_data_show_how.area_id IS '归属区域';
COMMENT ON COLUMN test_data_show_how.name IS '名称';
COMMENT ON COLUMN test_data_show_how.sex IS '性别';
COMMENT ON COLUMN test_data_show_how.in_date IS '加入日期';
COMMENT ON COLUMN test_data_show_how.create_by IS '创建者';
COMMENT ON COLUMN test_data_show_how.create_date IS '创建时间';
COMMENT ON COLUMN test_data_show_how.update_by IS '更新者';
COMMENT ON COLUMN test_data_show_how.update_date IS '更新时间';
COMMENT ON COLUMN test_data_show_how.remarks IS '备注信息';
COMMENT ON COLUMN test_data_show_how.del_flag IS '删除标记';