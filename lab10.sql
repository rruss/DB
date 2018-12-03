create database transaction;
create user2 password 'kbtu';
create tables students(id integer, name varchar(30));
select into students values(23, 'Askar'), (12, 'Azazaza');
grant select, update, insert on students to user2;

--user1
begin transaction isolation level serializable;
insert into students values(1, 'Ruslan'),(2, 'Ruslan');
update students set id=id+1 where name='Aibek';
commit;

--user2
begin transaction isolation level repeatable read;
insert into students values(4, 'Iskander'),(5, 'Drbes');
delete from students where name='Askar';
commit;

--user1
begin transaction isolation level read commited
delete from students where id=12;
update students set id=id+8 where name='Askar';
commit;

--user2
begin transaction isolation level serializable;
insert into students values(7, 'Alua'),(8, 'Alibek');
update students set id=id+1 where name='Askar';
commit;