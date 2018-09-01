
drop table if exists BeanOrder;

drop table if exists BeanPet;

drop table if exists BeanStore;

drop table if exists BeanType;

drop table if exists BeanUser;

/*==============================================================*/
/* Table: BeanBook                                              */
/*==============================================================*/
create table BeanBook
(
   Bid                  varchar(50) not null,
   Mid                  varchar(50),
   Pid                  varchar(50),
   Sid                  varchar(50),
   Bcase                char(50),
   FinishTime           datetime,
   BookTime             datetime,
   primary key (Bid)
);

/*==============================================================*/
/* Table: BeanManager                                           */
/*==============================================================*/
create table BeanManager
(
   Mid                  varchar(50) not null,
   Mpassword            char(20),
   Mgrade               char(10),
   Mname                char(10),
   primary key (Mid)
);

/*==============================================================*/
/* Table: BeanOrder                                             */
/*==============================================================*/
create table BeanOrder
(
   Oid                  varchar(50) not null,
   Mid                  varchar(50),
   Uid                  varchar(50),
   Sid                  varchar(50),
   Omessage             varchar(500),
   Onumber              char(20),
   Oprice               float(8),
   primary key (Oid)
);

/*==============================================================*/
/* Table: BeanPet                                               */
/*==============================================================*/
create table BeanPet
(
   Pid                  varchar(50) not null,
   Mid                  varchar(50),
   Bea_Uid              varchar(50),
   Uid                  varchar(50),
   Photo                longblob,
   Pname                char(10),
   primary key (Pid)
);

/*==============================================================*/
/* Table: BeanStore                                             */
/*==============================================================*/
create table BeanStore
(
   Tid                  varchar(50),
   Sid                  varchar(50) not null,
   Mid                  varchar(50),
   Uid                  varchar(50),
   Sname                char(20),
   Sprice               float(8),
   Sbrand               char(30),
   primary key (Sid)
);

/*==============================================================*/
/* Table: BeanType                                              */
/*==============================================================*/
create table BeanType
(
   Tid                  varchar(50) not null,
   Sid                  varchar(50),
   Tname                char(20),
   Tdescribe            char(50),
   primary key (Tid)
);

/*==============================================================*/
/* Table: BeanUser                                              */
/*==============================================================*/
create table BeanUser
(
   Uname                char(10),
   Uid                  varchar(50) not null,
   Mid                  varchar(50),
   Unumber              char(20),
   Uaddress             varchar(100),
   Umail                char(20),
   primary key (Uid)
);

alter table BeanBook add constraint FK_管理5 foreign key (Mid)
      references BeanManager (Mid) on delete restrict on update restrict;

alter table BeanOrder add constraint FK_管理4 foreign key (Mid)
      references BeanManager (Mid) on delete restrict on update restrict;

alter table BeanPet add constraint FK_Relationship_1 foreign key (Bea_Uid)
      references BeanUser (Uid) on delete restrict on update restrict;

alter table BeanPet add constraint FK_管理 foreign key (Mid)
      references BeanManager (Mid) on delete restrict on update restrict;

alter table BeanStore add constraint FK_管理3 foreign key (Mid)
      references BeanManager (Mid) on delete restrict on update restrict;

alter table BeanStore add constraint FK_选购 foreign key (Uid)
      references BeanUser (Uid) on delete restrict on update restrict;

alter table BeanType add constraint FK_从属 foreign key (Sid)
      references BeanStore (Sid) on delete restrict on update restrict;

alter table BeanUser add constraint FK_Relationship_3 foreign key (Mid)
      references BeanManager (Mid) on delete restrict on update restrict;beanmanager