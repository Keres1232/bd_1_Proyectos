/*create database db_class;*/
CREATE TABLE users(
id varchar(50),
user_name varchar(50)
);
insert into users(id, user_name) value('1','memo');
select * from users where id = '2';