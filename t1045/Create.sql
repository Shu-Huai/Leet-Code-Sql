Drop table if exists Customer;
Create table If Not Exists Customer
(
    customer_id int,
    product_key int
);
Drop table if exists Product;
Create table if not exists Product
(
    product_key int
);
Truncate table Customer;
insert into Customer (customer_id, product_key)
values ('1', '5');
insert into Customer (customer_id, product_key)
values ('2', '6');
insert into Customer (customer_id, product_key)
values ('3', '5');
insert into Customer (customer_id, product_key)
values ('3', '6');
insert into Customer (customer_id, product_key)
values ('1', '6');
Truncate table Product;
insert into Product (product_key)
values ('5');
insert into Product (product_key)
values ('6');