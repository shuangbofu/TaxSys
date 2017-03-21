/*	private String id;
	private String dept;
	private String account;
	private String name;
	private String password;
	private String headImg;
	private boolean gender;
	private String state;
	private String mobile;
	private String email;
	private Date birthday;
	private String memo;
*/

create database if exists TaxSys;

create database TaxSys default character set utf8;

use TaxSys;

drop table if exists user;

/*-------------------用户表-------------------*/
create table user 
(
	/*用户ID*/
	u_id varchar(40),
	/*用户所属部门*/
	u_dept varchar(40),
	/*用户账号*/
	u_account varchar(20),
	/*用户名*/
	u_name varchar(20),
	/*用户密码*/
	u_password varchar(20),
	/*用户头像(图片)*/
	u_headImg varchar(20),
	/*用户性别*/
	u_gender tinyint(1),
	/*用户角色*/
	u_role varchar(40),
	/*用户状态*/
	u_state tinyint(4),
	/*用户电话*/
	u_mobile varchar(20),
	/*用户邮箱*/
	u_email varchar(32),
	/*用户生日*/
	u_birthday Date,
	/*用户备注*/
	u_memo varchar(128),
	/*设置用户ID为主键*/
	primary key(u_id),
	/*设置外键与部门表关联*/
	constraint u_dept_fk foreign key(u_dept) references dept(d_id) on delete set null on update cascade,
	/*设置外键与角色表关联*/
	constraint u_role_fk foreign key(u_role) references role(r_id) on delete set null on update cascade
);


 insert into user (u_id, u_dept, u_account, 
      u_name, u_password, u_headImg, 
      u_gender, u_state, u_role, u_mobile, 
      u_email, u_birthday, u_memo
      )
    values (1, '1', 'bob78',
     '黑色幽默bo', '1767', '无', 
      1,1,'2', '18862283760', 
      '786183073@qq.com','1996-08-05','666'
      );
      
      
insert into user (u_id, u_dept, u_account, 
      u_name, u_password, u_headImg, 
      u_gender, u_state, u_role, u_mobile, 
      u_email, u_birthday, u_memo
      )
    values (2, '1', 'Clarkson',
     '乔丹-克拉克森', '1111', '无', 
      1,1, '1', '18862283760', 
      'clarkson@sina.com','1992-08-05','我是洛杉矶湖人队的乔丹克拉克森！！！'
      );



drop table if exists dept;

/*-------------------部门表-------------------*/
create table dept 
(
	/*部门ID*/
	d_id varchar(40),
	/*部门名称*/
	d_name varchar(20),
	/*设置部门ID为部门表主键*/
	primary key(d_id)
);
	















/*-------------------角色表-------------------*/
drop table if exists role;

create table role 
(
	/*---角色ID，角色名称，状态---*/
	/*角色ID*/
	r_id varchar(40),
	/*角色名称*/
	r_name varchar(20),
	/*状态*/
	r_state tinyint(1),
	/*设置角色ID为角色表主键*/
	primary key(r_id)
);

/*-------------------权限表-------------------*/
drop table if exists privilege;

create table privilege
(
	/*---权限编码，权限名称---*/
	/*权限编码*/
	p_code varchar(40),
	/*权限名称*/
	p_name varchar(20),
	
	primary key(p_code)
);
/*-------------------角色权限中间表-------------------*/

drop table if exists role_privilege;

create table role_privilege
(
	/*---角色ID，权限编码---*/
	/*角色ID*/
	r_id varchar(40),
	/*权限编码*/
	p_code varchar(40),
	
	primary key(r_id, p_code)
);
	
insert into role(r_id, r_name, r_state) values('1','超级管理员',1);
insert into role(r_id, r_name, r_state) values('2','游客',1);
insert into role(r_id, r_name, r_state) values('3','中级管理员1',1);
insert into role(r_id, r_name, r_state) values('4','中级管理员2',1);


insert into privilege(p_code, p_name) values('#xzgl','行政管理');
insert into privilege(p_code, p_name) values('#hqfw','后勤服务');
insert into privilege(p_code, p_name) values('#zxxx','在线学习');
insert into privilege(p_code, p_name) values('#nsfw','纳税服务');
insert into privilege(p_code, p_name) values('#space','我的空间');


insert into role_privilege(r_id, p_code) values('1','#xzgl');
insert into role_privilege(r_id, p_code) values('1','#hqfw');
insert into role_privilege(r_id, p_code) values('1','#zxxx');
insert into role_privilege(r_id, p_code) values('1','#nsfw');
insert into role_privilege(r_id, p_code) values('1','#space');

insert into role_privilege(r_id, p_code) values('2','#zxxx');
insert into role_privilege(r_id, p_code) values('2','#space');


insert into role_privilege(r_id, p_code) values('3','#zxxx');
insert into role_privilege(r_id, p_code) values('3','#nsfw');
insert into role_privilege(r_id, p_code) values('3','#space');

insert into role_privilege(r_id, p_code) values('4','#hqfw');
insert into role_privilege(r_id, p_code) values('4','#zxxx');
insert into role_privilege(r_id, p_code) values('4','#space');









select 
 		u.u_id, d.d_name, r.r_name, u.u_account, 
	    u.u_name, u.u_password, u.u_headImg, 
	    u.u_gender, u.u_state, u.u_mobile, 
	    u.u_email, u.u_birthday, u.u_memo
 		from user as u inner join role as r inner join dept as d
 		on u.u_dept = d.d_id and u.u_role = r.r_id;
 		
 
/*-------------------发布信息表-------------------*/

drop table if exists info;

create table info
(	
	/*信息编号*/
	i_id varchar(40),
	/*信息类型*/
	i_type varchar(20),
	/*信息来源*/
	i_source varchar(20),
	/*信息标题*/
	i_title varchar(20),
	/*信息内容*/
	i_content varchar(1024),
	/*信息备注*/
	i_memo varchar(128),
	/*信息创建人*/
	i_creator varchar(20),
	/*创建信息时间*/
	i_createtime timestamp,
	/*信息状态*/
	i_state tinyint(1),
	/*设置信息编号为主键*/
	primary key(i_id)
);


/*-------------------用户投诉表-------------------*/

drop table if exists complain;

create table info
(	

 



drop table if exists complain;

/*==============================================================*/
/* Table: complain                                              */
/*==============================================================*/
create table complain
(
   c_id                 varchar(40) not null,
   c_company            varchar(100),
   c_mobile             varchar(20),
   c_state              varchar(32),
   c_isNM               bool,
   c_time               datetime,
   c_title              varchar(200) not null,
   c_toName             varchar(32),
   c_todept             varchar(32),
   c_content            text,
   c_name               varchar(10),
   primary key (c_id),
   constraint c_todeptt_fk foreign key(c_todept) references dept(d_id) on delete set null on update cascade
);


drop table if exists reply;

/*==============================================================*/
/* Table: reply                                                 */
/*==============================================================*/
create table reply
(
   reply_id             varchar(40) not null,
   c_id                 varchar(32) not null,
   reply_er             varchar(20),
   reply_dept           varchar(100),
   reply_time           datetime,
   reply_content        varchar(300),
   primary key (reply_id),
   constraint reply_dept_fk foreign key(reply_dept) references dept(d_id) on delete set null on update cascade
);

alter table reply add constraint FK_comp_reply foreign key (c_id)
      references complain (c_id) on delete restrict on update restrict;


insert into complain(c_id, c_company, c_mobile, 
      c_state, c_isNM, c_time, 
      c_title, c_toName, c_todept, 
      c_name, c_content) values('1','傻逼公司','12365478900','1',1,'2017-03-04 19:09:03','你们的管理有问题啊','张三','1','李四','你们这个管理有问题，是这样的...');
      
  
 
/*-------------------预约事项表-------------------*/ 

drop table if exists reserveItem;

create table reserveItem
(
	/*事项编号，事项名称，处理部门，处理人，状态，备注*/
	resItem_id   varchar(40),
	resItem_name varchar(10),
	resItem_dept varchar(4),
	resItem_Er varchar(20),
	resItem_state tinyint(1),
	resItem_memo varchar(300),
	primary key(resItem_id),
	constraint resverseItem_dept_fk foreign key(resItem_dept) references dept(d_id) on delete set null on update cascade 
);

/*------------------预约表----------------------*/
drop table if exists reserve;

create table reserve
(
	/*预约编号，预约事项编号，预约时间，预约地点，预约说明，预约人姓名，预约人手机号，预约状态*/
	res_id varchar(40),
	res_resItem_id varchar(40),
	res_time timestamp,
	res_place varchar(32),
	res_memo varchar(300),
	res_name varchar(10),
	res_mobile varchar(16),
	res_state varchar(4),
	primary key(res_id),
	constraint reverse_resverseItem_fk foreign key(res_resItem_id) reference reserveItem(resItem_id) on delete set null update cascade
	
)

/*------------------预约处理表---------------------*/
drop table if exists reserveReply

create table reserveReply
(
	/*预约恢复编号，回复部门，回复人，处理结果，回复内容*/
	resreply_id varchar(40),
	resreply_dept varchar(40),
	resreply_Er varchar(10),
	resreply_result varchar(32)，
	resreply_content text
	constraint resreply_dept_fk foreign key(resreply_dept) references dept(d_id) on delete set null on update cascade 
); 
 
	
	
	