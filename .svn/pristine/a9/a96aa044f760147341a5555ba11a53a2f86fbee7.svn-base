SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS test_data;




/* Create Tables */

CREATE TABLE test_data
(
	id varchar(64) NOT NULL COMMENT '编号',
	user_id varchar(64) COMMENT '归属用户',
	office_id varchar(64) COMMENT '归属部门',
	area_id varchar(64) COMMENT '归属区域',
	name varchar(100) COMMENT '名称',
	sex char(1) COMMENT '性别',
	in_date date COMMENT '加入日期',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '业务数据表';



/* Create Indexes */

CREATE INDEX test_data_del_flag ON test_data (del_flag ASC);


