-- Drop column picture from staff.
alter table staff
drop column picture;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from customer where first_name = "Tammy";

insert into staff (store_id, first_name, last_name,address_id, username)
values (2, "Tammy", "Sanders", "79","Tammy");
-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1
insert into rental
values	(489752, 
		"2022-11-12 19:06:37",
		(select inventory_id from sakila.inventory where film_id = (select film_id from sakila.film where title = 'Academy Dinosaur') and inventory_id = 6),
        (select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER'),
        NULL,
        1,
        "2022-11-12 19:06:37");

select * from rental 
order by rental_id desc 
limit 1;
-- Check if there are any non-active users

select * from customer 
where active = 0;

-- Insert the non active users in the table backup table

create table customer_backup as 
select * from customer
where active = 0;

-- Delete the non active users from the table customer

delete from customer
where active = 0;