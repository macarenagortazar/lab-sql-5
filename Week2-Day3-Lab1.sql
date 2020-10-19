use sakila2;
#Drop column picture from staff.
ALTER TABLE sakila2.staff
DROP picture;
Select*from sakila2.staff;

#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
Select*from sakila2.staff;
insert into sakila2.staff (first_name,last_name,address_id,email,store_id,username) 
VALUES("Tammy","Sanders",
(select address_id from customer where first_name="Tammy" and last_name="Sanders"),
(select email from customer where first_name="Tammy" and last_name="Sanders"),
(select store_id from customer where first_name="Tammy" and last_name="Sanders"),
"Tammy");
Select*from sakila2.staff;


#Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1 today.

Select*from sakila2.customer;
insert into sakila2.customer (store_id,first_name,last_name,email,address_id) 
VALUES(
(select store_id from staff where first_name="Mike" and last_name="Hillyer"),
"Mike",
"Hillyer",
(select email from staff where first_name="Mike" and last_name="Hillyer"),
(select address_id from staff where first_name="Mike" and last_name="Hillyer"));

select*from sakila2.customer
where first_name="Mike" and last_name="Hillyer";

select*from sakila2.rental;
insert into sakila2.rental(inventory_id,customer_id,staff_id)
VALUES("1",
(select customer_id from customer where first_name="Mike" and last_name="Hillyer"),
"3");

Select*from sakila2.rental;

#Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date the user was deleted.

drop table sakila2.deleted_users;

create table deleted_users(
customer_id int(11) not null,
store_id char(3),
first_name char(30),
last_name char(20),
email char(50),
address_id char(3),
active int(11),
date_deleted TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

select*from sakila2.deleted_users;

select*from sakila2.customer
where active="0";

select*from sakila2.deleted_users;

delete from customer
where active="0";



